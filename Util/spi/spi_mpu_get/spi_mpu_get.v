
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_mpu_get.v
// Gets an MPU9250 parameter via SPI serial communication.
// Input 'addr' specifies the register address.
// Output 'data' returns the byte of data from the sensor.
// CPOL=1 (POLARITY: sclk idle high).
// CPHA=1 (PHASE: sample falling edge).
// CLK_DIV (>=2) determines 'sclk' frequency.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_mpu_get
  #(
  parameter CLK_DIV = 4,
  parameter HOLD_BITS = 8
  )(
  input clk,
  input rst,
  input start,
  input miso,
  input [7:0] addr,
  output sclk,
  output busy,
  output finish,
  output mosi,
  output [7:0] data
  );

  // Define module states
  localparam
    MPU_BITS  = 2,
    MPU_IDLE  = 2'd0,
    MPU_HALF  = 2'd1,
    MPU_SEND  = 2'd2,
    MPU_HOLD  = 2'd3;

  // Input/Output registers
  reg [CLK_DIV-1:0] sclk_d, sclk_q;
  reg finish_d, finish_q;
  reg mosi_d, mosi_q;
  reg [7:0] data_d, data_q;

  // Internal registers
  reg [MPU_BITS-1:0] state_d, state_q = MPU_IDLE;
  reg [15:0] send_d, send_q = 16'b0;
  reg [3:0] loop_d, loop_q = 4'b1111;
  reg [HOLD_BITS-1:0] hold_d, hold_q = { HOLD_BITS {1'b0} };

  // Connect output signals
  assign sclk = ~( ( ~sclk_q[CLK_DIV-1] ) & ( state_q != MPU_IDLE ) );
  assign busy = ( state_q == MPU_HALF ) | (state_q == MPU_SEND );
  assign finish = finish_q;
  assign mosi = mosi_q;
  assign data = data_q;


  // Combinational logic
  always @(*) begin

    // Initial assignments
    sclk_d    = sclk_q;
    finish_d  = 1'b0;
    mosi_d    = mosi_q;
    data_d    = data_q;
    state_d   = state_q;
    send_d    = send_q;
    loop_d    = loop_q;
    hold_d    = hold_q;

    // Begin state machine
    case (state_q)

      // Wait for next start signal
      MPU_IDLE : begin

        // Reset counters and registers
        sclk_d = { CLK_DIV {1'b1} };
        loop_d = 4'b1111;
        hold_d = { HOLD_BITS {1'b0} };
        mosi_d = 1'b0;
        data_d = 8'b0;

        // Start condition has arrived
        if ( start == 1'b1 ) begin
          send_d = { addr, 8'hFF };
          state_d = MPU_HALF;
        end

      end

      // Wait half clock cycle for proper timing
      MPU_HALF : begin

        // Increment clock divider counter
        sclk_d = sclk_q - 1'b1;

        // Reached half period
        if ( sclk_q == { {1'b1}, { CLK_DIV-1 {1'b0} } } ) begin
          sclk_d = { CLK_DIV {1'b0} };
          state_d = MPU_SEND;
        end

      end

      // Send the SPI transmission
      MPU_SEND : begin

        // Increment the clock divider counter
        sclk_d = sclk_q + 1'b1;

        // Set bit output
        if ( sclk_q == { CLK_DIV {1'b0} } ) begin
          mosi_d = send_q[loop_q];
        end

        // Get bit input
        else if ( sclk_q == { CLK_DIV-1 {1'b1} } ) begin
          data_d = { data_q[6:0], miso };
        end

        // Reset for next bit
        else if ( sclk_q == { CLK_DIV {1'b1} } ) begin
          loop_d = loop_q - 1'b1;
          if ( loop_q == 3'b0 ) begin
            sclk_d = { CLK_DIV {1'b1} };
            mosi_d = 1'b0;
            state_d = MPU_HOLD;
          end
        end

      end

      // Apply short delay to terminate the sequence 
      MPU_HOLD : begin

        // Increment hold counter
        hold_d = hold_q + 1'b1;

        // Completed hold period
        if ( hold_q == { HOLD_BITS {1'b1} } ) begin
          finish_d = 1'b1;
          state_d = MPU_IDLE;
        end

      end

      // Assign default state
      default : begin
        state_d = MPU_IDLE;
      end

    // End state machine
    endcase

  end


  // Sequential logic
  always @( posedge clk ) begin

    if (rst) begin
      sclk_q    <= 1'b0;
      finish_q  <= 1'b0;
      mosi_q    <= 1'b0;
      data_q    <= 8'b0;
      state_q   <= MPU_IDLE;
      send_q    <= 16'b0;
      loop_q    <= 4'b1111;
      hold_q    <= { HOLD_BITS {1'b0} };
    end else begin
      sclk_q    <= sclk_d;
      finish_q  <= finish_d;
      mosi_q    <= mosi_d;
      data_q    <= data_d;
      state_q   <= state_d;
      send_q    <= send_d;
      loop_q    <= loop_d;
      hold_q    <= hold_d;
    end

  end

endmodule



