
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (servo demo)
// Demonstrate the 'servo' module on hardware.
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

  // Servo
  output servo

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led = 8'b00110011;

  // Connect servo module
  servo demo_servo
    (
    .clk(clk),
    .rst(rst),
    .val(sawtooth),  // Add sawtooth signal
    .servo(servo)    // Establish servo pin
    );

endmodule



