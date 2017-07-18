
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// inputs.v
// Converts the radio signals into input command values.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
`include "../../Util/resize/ARR_VEC_2D/ARR_VEC_2D.v"

module inputs
  (
  input tmr_1Mhz,
  input rst,
  input [7:0] radio_sig,
  output [79:0] radio_val
  );

  wire [9:0] radio_arr [7:0];
  `ARR_VEC_2D( radio_arr, 8, 10, radio_val );

  radio #(
    .DEFAULT(10'd0) )
    radio_ch0 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .sig(radio_sig[0]),
    .val(radio_arr[0]) );

  radio #(
    .DEFAULT(10'd0) )
    radio_ch1 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .sig(radio_sig[1]),
    .val(radio_arr[1]) );

  radio #(
    .DEFAULT(10'd0) )
    radio_ch2 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .sig(radio_sig[2]),
    .val(radio_arr[2]) );

  radio #(
    .DEFAULT(10'd0) )
    radio_ch3 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .sig(radio_sig[3]),
    .val(radio_arr[3]) );

  radio #(
    .DEFAULT(10'd0) )
    radio_ch4 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .sig(radio_sig[4]),
    .val(radio_arr[4]) );

  radio #(
    .DEFAULT(10'd0) )
    radio_ch5 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .sig(radio_sig[5]),
    .val(radio_arr[5]) );

  radio #(
    .DEFAULT(10'd0) )
    radio_ch6 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .sig(radio_sig[6]),
    .val(radio_arr[6]) );

  radio #(
    .DEFAULT(10'd0) )
    radio_ch7 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .sig(radio_sig[7]),
    .val(radio_arr[7]) );

endmodule



