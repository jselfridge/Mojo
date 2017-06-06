
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (uart_tx_msg demo)
// Demonstrate the 'uart_tx_msg' implemented on hardware.
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

  // UART connections
  output uart_tx

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led = 8'b11000011;

  // Message register
  reg [(8*16)-1:0] msg_d, msg_q;

  // Connect a 1hz timer
  wire tmr_1hz;
  timer timer_1hz (
  .clk(clk),
  .rst(rst),
  .tmr(tmr_1hz) );

  // Connect the 'uart_tx_msg' module
  wire busy;
  uart_tx_msg #(
  .CLK_PER_BIT(434),
  .MSG_LEN(16) )
  uart_tx_msg_demo (
  .clk(clk),
  .rst(rst),
  .block(1'b0),
  .send(tmr_1hz),
  .msg(msg_q),
  .busy(busy),
  .tx(uart_tx) );

  // Combinational logic
  always @(*) begin
    msg_d = {{"Time: "},{"456"},{" \r\n"}};
  end

  // Synchronous logic
  always @( posedge tmr_1hz ) begin
    msg_q <= msg_d;
  end

endmodule



