
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// timers.v
// Generates the various timers needed for the avionics board.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module timers
  (
  input clk,
  input rst,
  //output tmr_1Mhz,
  output tmr_1khz,
  //output tmr_100hz,
  output tmr_10hz
  //output tmr_1hz
  );

  /*
  // Connect a 1Mhz timer (future use)
  timer #(
    .PERIOD(50) )
    timer_1Mhz (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_1Mhz) );
  */

  // Connect a 1khz timer (timestamp)
  timer #(
    .PERIOD(50000) )
    timer_1khz (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_1khz) );

  /*
  // Connect a 100hz timer (future use)
  timer #(
    .PERIOD(500000) )
    timer_100hz (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_100hz) );
  */

  // Connect a 10hz timer (debugging)
  timer #(
    .PERIOD(5000000) )
    timer_10hz (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_10hz) );

  /*
  // Connect a 1hz timer (future use)
  timer #(
    .PERIOD(50000000) )
    timer_1hz (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_1hz) );
  */

endmodule



