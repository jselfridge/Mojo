
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// avr_interface.v
// Module to connect with the ARV component.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module avr_interface
  #(
  parameter CLK_RATE = 50000000,
  parameter SERIAL_BAUD_RATE = 500000
  )(

  // Clocks and reset
  input clk,
  input rst,
  input cclk,

  // AVR SPI signals
  input spi_sck,
  input spi_ss,
  input spi_mosi,
  output spi_miso,
  output [3:0] spi_ch,

  // AVR serial signals
  input rx,
  output tx,

  // ADC interface signals
  input [3:0] channel,
  output new_sample,
  output [9:0] sample,
  output [3:0] sample_channel,

  // Serial Tx interface
  input [7:0] tx_data,
  input new_tx_data,
  input tx_block,
  output tx_busy,

  // Serial Rx interface
  output [7:0] rx_data,
  output new_rx_data

  );

  wire ready;
  wire n_rdy = !ready;
  wire spi_done;
  wire [7:0] spi_dout;

  wire tx_m;
  wire spi_miso_m;

  reg byte_ct_d, byte_ct_q;
  reg [9:0] sample_d, sample_q;
  reg new_sample_d, new_sample_q;
  reg [3:0] sample_channel_d, sample_channel_q;
  reg [3:0] block_d, block_q;
  reg busy_d, busy_q;

  avr_status
    #(
    .CLK_RATE(CLK_RATE)
    ) avr_status (
    .clk(clk),
    .rst(rst),
    .cclk(cclk),
    .ready(ready)
    );

  avr_spi
    avr_spi
    (
    .clk(clk),
    .rst(n_rdy),
    .ss(spi_ss),
    .mosi(spi_mosi),
    .miso(spi_miso_m),
    .sck(spi_sck),
    .done(spi_done),
    .din(8'hff),
    .dout(spi_dout)
    );

  parameter CLK_PER_BIT = $rtoi( $ceil( CLK_RATE / SERIAL_BAUD_RATE ) );

  avr_rx
    #(
    .CLK_PER_BIT(CLK_PER_BIT)
    ) avr_rx (
    .clk(clk),
    .rst(n_rdy),
    .rx(rx),
    .data(rx_data),
    .new_data(new_rx_data)
    );

  avr_tx
    #(
    .CLK_PER_BIT(CLK_PER_BIT)
    ) avr_tx (
    .clk(clk),
    .rst(n_rdy),
    .tx(tx_m),
    .block(busy_q),
    .busy(tx_busy),
    .data(tx_data),
    .new_data(new_tx_data)
    );

  // Output declarations
  assign new_sample = new_sample_q;
  assign sample = sample_q;
  assign sample_channel = sample_channel_q;

  // Connect to AVR, should be disconnected when the AVR isn't ready
  assign spi_ch = ready ? channel : 4'bZZZZ;
  assign spi_miso = ready && !spi_ss ? spi_miso_m : 1'bZ;
  assign tx = ready ? tx_m : 1'bZ;
  
  always @(*) begin

    byte_ct_d = byte_ct_q;
    sample_d = sample_q;
    new_sample_d = 1'b0;
    sample_channel_d = sample_channel_q;
    busy_d = busy_q;
    block_d = { block_q[2:0], tx_block };

    if ( block_q[3] ^ block_q[2] )
      busy_d = 1'b0;

    if ( !tx_busy && new_tx_data )
      busy_d = 1'b1;

    if (spi_ss) begin
      byte_ct_d = 1'b0;
    end

    if (spi_done) begin

      if ( byte_ct_q == 1'b0 ) begin
        sample_d[7:0] = spi_dout;  // First byte is the 8 LSB of the sample
        byte_ct_d = 1'b1;
      end else begin
        sample_d[9:8] = spi_dout[1:0];     // Second byte is the channel 2 MSB of the sample
        sample_channel_d = spi_dout[7:4];  // and the channel that was sampled
        byte_ct_d = 1'b1;  // slave-select must be brought high before the next transfer
        new_sample_d = 1'b1;
      end

    end

  end

  always @( posedge clk ) begin

    if (n_rdy) begin
      byte_ct_q <= 1'b0;
      sample_q <= 10'b0;
      new_sample_q <= 1'b0;
    end else begin
      byte_ct_q <= byte_ct_d;
      sample_q <= sample_d;
      new_sample_q <= new_sample_d;
    end

    block_q <= block_d;
    busy_q <= busy_d;
    sample_channel_q <= sample_channel_d;

  end

endmodule



