
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (serial_debug demo)
// Demonstrate the 'serial_debug' implemented on hardware.
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
  assign led = 8'b00110011;

  wire clk_1hz;
  wire busy;

  reg [(8*16)-1:0] msg_d, msg_q;
  reg [5:0] ctr_d, ctr_q;

  // Connect a 1hz clock
  clock clock_1hz
  (
  .clk(clk),
  .rst(rst),
  .clkout(clk_1hz)
  );

  // Connect the 'serial_debug' module
  serial_debug
  #(
  .CLK_PER_BIT(434),
  .MSG_LEN(16)
  )
  serial_debug_demo
  (
  .clk(clk),
  .rst(rst),
  .block(1'b0),
  .send(clk_1hz),
  .data(msg_q),
  .busy(busy),
  .tx(tx_pin)
  );

always @(*) begin
  ctr_d = ctr_q + 1'b1;
  //$sformat( msg_d, "Time: %d \r\n", ctr_q );
  //msg_d = "Time: 123 \r\n";
  msg_d = {{"Time: "},{"456"},{" \r\n"}};
end

always @( posedge clk_1hz ) begin

  if (rst)
    ctr_q <= 1'b0;
  else
    ctr_q <= ctr_d;

  msg_q <= msg_d;

end

endmodule



