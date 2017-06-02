
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (servo demo)
// Demonstrate the 'servo' module implemented on hardware.
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

  // Servo output
  output servo_out

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // Sawtooth signal wire
  wire [7:0] sawtooth_sig;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led = 8'b00111100;

  // Connect sawtooth counter
  sawtooth
    #(
    .CTR_BITS(27),
    .VAL_BITS(8)
    )
    sawtooth_servo
    (
    .clk(clk),
    .rst(rst),
    .val(sawtooth_sig)
    );

  // Connect servo module
  servo
    servo_demo
    (
    .clk(clk),
    .rst(rst),
    .val(sawtooth_sig),
    .servo(servo_out)
    );

endmodule



