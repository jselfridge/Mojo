
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_slave.v
// Implements an SPI slave module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_slave(
  input clk,
  input rst,
  input sck,
  input ss,
  input mosi,
  input [7:0] din,
  output miso,
  output done,
  output [7:0] dout
  );

  // Registers
  reg sck_d, sck_q;
  reg sck_old_d, sck_old_q;
  reg ss_d, ss_q;
  reg mosi_d, mosi_q;
  reg [7:0] data_d, data_q;
  reg miso_d, miso_q;
  reg done_d, done_q;
  reg [7:0] dout_d, dout_q;
  reg [2:0] bit_ct_d, bit_ct_q;

  // Connect outputs
  assign miso = miso_q;
  assign done = done_q;
  assign dout = dout_q;

  // Combinational logic
  always @(*) begin

    // Initial assignments
    sck_d      = sck;
    sck_old_d  = sck_q;
    ss_d       = ss;
    mosi_d     = mosi;
    data_d     = data_q;
    miso_d     = miso_q;
    done_d     = 1'b0;
    dout_d     = dout_q;
    bit_ct_d   = bit_ct_q;

    // Slave select is high (deselcted)
    if (ss_q) begin
      bit_ct_d = 3'b0;
      data_d   = din;
      miso_d   = data_q[7];
    end

    // Slave select is low (selected)
    else begin

      // Rising edge
      if ( !sck_old_q && sck_q ) begin

        // Increment and shift data
        bit_ct_d = bit_ct_q + 1'b1;
        data_d = { data_q[6:0], mosi_q };

        // Final bit
        if ( bit_ct_q == 3'b111 ) begin
          dout_d = { data_q[6:0], mosi_q };
          done_d = 1'b1;
          data_d = din;
        end

      end

      // Falling edge
      else if ( sck_old_q && !sck_q ) begin
        miso_d = data_q[7];
      end

    end

  end

  // Sequential logic
  always @( posedge clk ) begin

    // Reset conditions
    if (rst) begin
      bit_ct_q  <= 3'b0;
      miso_q    <= 1'b1;
      done_q    <= 1'b0;
      dout_q    <= 8'b0;
    end else begin
      bit_ct_q  <= bit_ct_d;
      miso_q    <= miso_d;
      done_q    <= done_d;
      dout_q    <= dout_d;
    end

    // Persistent conditions
    sck_q      <= sck_d;
    sck_old_q  <= sck_old_d;
    ss_q       <= ss_d;
    mosi_q     <= mosi_d;
    data_q     <= data_d;

  end

endmodule



