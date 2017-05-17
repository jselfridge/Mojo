
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v
// Starting point for new projects on the Mojo FPGA board.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module template (

  // Clocks and hardware
  input clk,              // 50MHz clock input
  input rst_n,            // Reset button (active low)
  input cclk,             // AVR flag indicator
  output [7:0] led,       // Outputs to onboard LEDs

  // AVR SPI connections
  input spi_sck,          // Source clock
  input spi_ss,           // Slave select
  input spi_mosi,         // Master-output, slave-input
  output spi_miso,        // Master-input, slave-output
  output [3:0] spi_ch,    // SPI channel

  // Serial connections
  input avr_tx,           // AVR Tx => FPGA Rx
  output avr_rx,          // AVR Rx => FPGA Tx
  input avr_rx_busy       // AVR Rx buffer full

  );

  wire rst = ~rst_n;      // Make reset active high

  // Disconnect signals when not in use
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_channel = 4'bzzzz;

  // Toggle LEDs
  assign led[7] = rst;
  assign led[6:1] = 6'b0;
  assign led[0] = 1'b1;

endmodule




