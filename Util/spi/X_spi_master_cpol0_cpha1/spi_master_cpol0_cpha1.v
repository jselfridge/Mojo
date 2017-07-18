
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_master_cpol0_cpha1.v
// Implements an SPI master module.
// CPOL=0 (POLARITY: sck idle low).
// CPHA=1 (PHASE: sample falling edge).
// CLK_DIV (>=2) determines 'sck' frequency.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_master_cpol0_cpha1
  #(
  parameter CLK_DIV = 2
  )(
  input clk,
  input rst,
  input start,
  input miso,
  input [7:0] data_in,
  output sck,
  output busy,
  output new_data,
  output mosi,
  output [7:0] data_out
  );

  // Define module states
  localparam STATE_SIZE = 2,
    IDLE       = 2'd0,
    WAIT_HALF  = 2'd1,
    TRANSFER   = 2'd2;

  // Input/Output registers
  reg [7:0] data_in_d, data_in_q;
  reg [CLK_DIV-1:0] sck_d, sck_q;
  reg new_data_d, new_data_q;
  reg mosi_d, mosi_q;
  reg [7:0] data_out_d, data_out_q;

  // Internal registers
  reg [STATE_SIZE-1:0] state_d, state_q;
  reg [2:0] ctr_d, ctr_q;

  // Connect output signals
  assign sck = ( ~sck_q[CLK_DIV-1] ) & ( state_q == TRANSFER );
  assign busy = state_q != IDLE;
  assign new_data = new_data_q;
  assign mosi = mosi_q;
  assign data_out = data_out_q;

  // Combinational logic
  always @(*) begin

    // Initial assignments
    data_in_d   = data_in_q;
    sck_d       = sck_q;
    new_data_d  = 1'b0;
    mosi_d      = mosi_q;
    data_out_d  = data_out_q;
    state_d     = state_q;
    ctr_d       = ctr_q;

    // Module states
    case (state_q)

      IDLE: begin

        sck_d  = { CLK_DIV {1'b0} };
        ctr_d  = 3'b0;
        mosi_d = 1'b0;

        if ( start == 1'b1 ) begin
          data_in_d = data_in;
          state_d = WAIT_HALF;
        end

      end

      WAIT_HALF: begin

        sck_d = sck_q + 1'b1;

        if ( sck_q == { CLK_DIV-1 {1'b1} } ) begin
          sck_d = 1'b0;
          state_d = TRANSFER;
        end

      end

      TRANSFER: begin

        sck_d = sck_q + 1'b1;

        if ( sck_q == { CLK_DIV {1'b0} } ) begin
          mosi_d = data_in_q[7];
        end

        else if ( sck_q == { CLK_DIV-1 {1'b1} } ) begin
          data_in_d = { data_in_q[6:0], miso };
        end

        else if ( sck_q == { CLK_DIV {1'b1} } ) begin

          ctr_d = ctr_q + 1'b1;

          if ( ctr_q == 3'b111 ) begin
            data_out_d = data_in_q;
            new_data_d = 1'b1;
            state_d = IDLE;
          end

        end

      end

    endcase

  end

  // Sequential logic
  always @( posedge clk ) begin

    if (rst) begin
      data_in_q   <= 8'b0;
      sck_q       <= 1'b0;
      new_data_q  <= 1'b0;
      mosi_q      <= 1'b0;
      data_out_q  <= 8'b0;
      state_q     <= IDLE;
      ctr_q       <= 3'b0;
    end else begin
      data_in_q   <= data_in_d;
      sck_q       <= sck_d;
      new_data_q  <= new_data_d;
      mosi_q      <= mosi_d;
      data_out_q  <= data_out_d;
      state_q     <= state_d;
      ctr_q       <= ctr_d;
    end

  end

endmodule



