
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (uart_rx_byte demo)
// Demonstrate the 'uart_rx_byte' module implemented on hardware.
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
  input uart_rx,
  output uart_tx

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Registers
  reg [7:0] tx_byte_d, tx_byte_q;

  // Transmission flag via 'timer' module
  wire tmr_sig;
  timer #(
    .PERIOD(25000000) )
    tmr_serial (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_sig) );

  // Connect the 'uart_tx_byte' module
  wire busy;
  uart_tx_byte #(
    .CLK_PER_BIT(434) )
    uart_tx_byte_demo (
    .clk(clk),
    .rst(rst),
    .block(1'b0),
    .send(tmr_sig),
    .data(tx_byte_q),
    .busy(busy),
    .tx(uart_tx) );

  // Connect the 'uart_rx_byte' module
  wire new_data;
  uart_rx_byte #(
    .CLK_PER_BIT(434) )
    uart_rx_byte_demo (
    .clk(clk),
    .rst(rst),
    .rx(uart_rx),
    .data(led),
    .new_data(new_data) );

  // Combinational logic
  always @(*) begin
    tx_byte_d = tx_byte_q + 1'b1;
    if ( tx_byte_q == 8'b01011010 )
      tx_byte_d = 8'b01000001;
  end

  // Synchronous logic
  always @( posedge tmr_sig ) begin
    if (rst) begin
      tx_byte_q <= 8'b01000000;
    end else begin
      tx_byte_q <= tx_byte_d;
    end
  end

endmodule



