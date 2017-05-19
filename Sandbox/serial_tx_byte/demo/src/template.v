
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (serial_tx demo)
// Demonstrate the 'serial_tx' module on hardware.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module template
  (

  // Clocks and hardware
  input clk,
  input rst_n,
  input cclk,
  output [7:0] led,

  // AVR SPI connections
  input spi_sck,
  input spi_ss,
  input spi_mosi,
  output spi_miso,
  output [3:0] spi_ch,

  // Serial connections
  input avr_tx,
  output avr_rx,
  input avr_rx_busy,

  // Serial_TX connection
  output tx_pin

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led [6:1] = 6'b0;
  assign led [0] = saw_cnt;

  // Sawtooth for transmit timing
  wire saw_cnt;
  sawtooth
    #(
    .CTR_BITS(26),
    .VAL_BITS(1)
    )
    saw_serial_tx
    (
    .clk(clk),
    .rst(rst),
    .val(saw_cnt)
    );

  // Connect the serial_tx module
  serial_tx
    #(
    .CLK_PER_BIT(434)
    )
    serial_tx_demo
    (
    .clk(clk),
    .rst(rst),
    .block(1'b0),
    .new_data(saw_cnt),
    .data(8'b01100001),
    .busy(led[7]),
    .tx(tx_pin)
  );

endmodule



