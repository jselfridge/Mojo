
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// outputs.v
// Converts the output command values into ESC signals.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
`include "../../Util/resize/VEC_ARR_2D/VEC_ARR_2D.v"

module outputs
  (
  input tmr_1Mhz,
  input rst,
  input [79:0] esc_val,
  output [7:0] esc_sig
  );

  wire [9:0] esc_arr [7:0];
  `VEC_ARR_2D( esc_val, 8, 10, esc_arr );

  esc esc_ch0 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .val(esc_arr[0]),
    .sig(esc_sig[0]) );

  esc esc_ch1 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .val(esc_arr[1]),
    .sig(esc_sig[1]) );

  esc esc_ch2 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .val(esc_arr[2]),
    .sig(esc_sig[2]) );

  esc esc_ch3 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .val(esc_arr[3]),
    .sig(esc_sig[3]) );

  esc esc_ch4 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .val(esc_arr[4]),
    .sig(esc_sig[4]) );

  esc esc_ch5 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .val(esc_arr[5]),
    .sig(esc_sig[5]) );

  esc esc_ch6 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .val(esc_arr[6]),
    .sig(esc_sig[6]) );

  esc esc_ch7 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .val(esc_arr[7]),
    .sig(esc_sig[7]) );

endmodule



