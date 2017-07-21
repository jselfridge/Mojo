
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_master_10.v
// Implements an SPI master module.
// CPOL=1 (POLARITY: sclk idle high).
// CPHA=0 (PHASE: sample rising edge).
// CLK_DIV (>=2) determines 'sclk' frequency.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_master_10
  #(
  parameter CLK_DIV = 2
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
  localparam STATE_SIZE = 2,
    IDLE       = 2'd0,
    TRANSFER   = 2'd1,
    WAIT_HALF  = 2'd2;

  // Input/Output registers
  reg [7:0] addr_d, addr_q;
  reg [CLK_DIV-1:0] sclk_d, sclk_q;
  reg finish_d, finish_q;
  reg mosi_d, mosi_q;
  reg [7:0] data_d, data_q;

  // Internal registers
  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [2:0] ctr_d, ctr_q;

  // Connect output signals
  assign sclk = ~( ( sclk_q[CLK_DIV-1] ) & ( state_q == TRANSFER ) );
  assign busy = state_q != IDLE;
  assign finish = finish_q;
  assign mosi = mosi_q;
  assign data = data_q;

  // Combinational logic
  always @(*) begin

    // Initial assignments
    addr_d    = addr_q;
    sclk_d    = sclk_q;
    finish_d  = 1'b0;
    mosi_d    = mosi_q;
    data_d    = data_q;
    state_d   = state_q;
    ctr_d     = ctr_q;

    // Module states
    case (state_q)

      IDLE: begin

        sclk_d = { CLK_DIV {1'b0} };
        ctr_d = 3'b0;
        mosi_d = 1'b0;

        if ( start == 1'b1 ) begin
          addr_d = addr;
          state_d = TRANSFER;
        end

      end

      TRANSFER: begin

        sclk_d = sclk_q + 1'b1;

        if ( sclk_q == { CLK_DIV {1'b0} } ) begin
          mosi_d = addr_q[7];
        end

        else if ( sclk_q == { CLK_DIV-1 {1'b1} } ) begin
          addr_d = { addr_q[6:0], miso };
        end

        else if ( sclk_q == { CLK_DIV {1'b1} } ) begin

          ctr_d = ctr_q + 1'b1;

          if ( ctr_q == 3'b111 ) begin
            data_d = addr_q;
            state_d = WAIT_HALF;
          end

        end

      end

      WAIT_HALF: begin

        sclk_d = sclk_q + 1'b1;

        if ( sclk_q == { CLK_DIV-1 {1'b1} } ) begin
          sclk_d = 1'b0;
          finish_d = 1'b1;
          state_d = IDLE;
        end

      end

    endcase

  end

  // Sequential logic
  always @( posedge clk ) begin

    if (rst) begin
      addr_q    <= 8'b0;
      sclk_q    <= 1'b0;
      finish_q  <= 1'b0;
      mosi_q    <= 1'b0;
      data_q    <= 8'b0;
      state_q   <= IDLE;
      ctr_q     <= 3'b0;
    end else begin
      addr_q    <= addr_d;
      sclk_q    <= sclk_d;
      finish_q  <= finish_d;
      mosi_q    <= mosi_d;
      data_q    <= data_d;
      state_q   <= state_d;
      ctr_q     <= ctr_d;
    end

  end

endmodule



