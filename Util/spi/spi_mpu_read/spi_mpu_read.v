
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_mpu_read.v
// Reads a set of MPU9250 sensor data via SPI serial communication.
// Input 'addr' specifies the register address.
// Output 'read' returns six bytes of data read from the sensor.
// CPOL=1 (POLARITY: sclk idle high).
// CPHA=1 (PHASE: sample falling edge).
// CLK_DIV (>=2) determines 'sclk' frequency.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_mpu_read
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
  output [47:0] read
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
  reg [47:0] read_d, read_q;

  // Internal registers
  reg [MPU_BITS-1:0] state_d, state_q = MPU_IDLE;
  reg [55:0] send_d, send_q = 56'b0;
  reg [5:0] loop_d, loop_q = 6'b110111;
  reg [HOLD_BITS-1:0] hold_d, hold_q = { HOLD_BITS {1'b0} };

  // Connect output signals
  assign sclk = ~( ( ~sclk_q[CLK_DIV-1] ) & ( state_q != MPU_IDLE ) );
  assign busy = ( state_q == MPU_HALF ) | (state_q == MPU_SEND );
  assign finish = finish_q;
  assign mosi = mosi_q;
  assign read = read_q;


  // Combinational logic
  always @(*) begin

    // Initial assignments
    sclk_d    = sclk_q;
    finish_d  = 1'b0;
    mosi_d    = mosi_q;
    read_d    = read_q;
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
        loop_d = 6'b110111;
        hold_d = { HOLD_BITS {1'b0} };
        mosi_d = 1'b0;
        read_d = 48'b0;

        // Start condition has arrived
        if ( start == 1'b1 ) begin
          send_d = { addr, 48'hFFFFFFFFFFFF };
          state_d = MPU_HALF;
        end

      end

      // Wait half clock cycle for proper timing
      MPU_HALF : begin

        // Decrement clock divider counter
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
          read_d = { read_q[46:0], miso };
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
      read_q    <= 48'b0;
      state_q   <= MPU_IDLE;
      send_q    <= 56'b0;
      loop_q    <= 6'b110111;
      hold_q    <= { HOLD_BITS {1'b0} };
    end else begin
      sclk_q    <= sclk_d;
      finish_q  <= finish_d;
      mosi_q    <= mosi_d;
      read_q    <= read_d;
      state_q   <= state_d;
      send_q    <= send_d;
      loop_q    <= loop_d;
      hold_q    <= hold_d;
    end

  end

endmodule



