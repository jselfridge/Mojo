
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (uart_tx_byte demo)
// Demonstrate the 'uart_tx_byte' module on hardware.
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

  // UART_TX connection
  output tx_pin

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led [6:0] = 7'b0;

  // Transmission flag via 'timer' module
  wire tmr_sig;
  timer #(
    .PERIOD(50000000) )
    tmr_serial (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_sig) );

  // Connect the 'uart_tx_byte' module
  uart_tx_byte #(
    .CLK_PER_BIT(434) )
    uart_tx_byte_demo (
    .clk(clk),
    .rst(rst),
    .block(1'b0),
    .send(tmr_sig),
    .data(8'b01100001),
    .busy(led[7]),
    .tx(tx_pin) );


endmodule



