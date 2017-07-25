
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// debugging.v
// Sends debugging messages to a terminal via the AVR USB.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
`include "../../Util/resize/VEC_ARR_2D/VEC_ARR_2D.v"

module debugging
  (

  // Clocks and timers
  input  clk,
  input  rst,
  input  tmr,

  // Terminal data
  input  [23:0] timestamp,
  input  [47:0] acc,
  input  [47:0] gyr,
  input  [47:0] mag,
  //input  [7:0] debug_imu,

  // Inputs from AVR
  input  [7:0] rx_data,
  input  new_rx_data,
  input  tx_busy,

  // Outputs to AVR
  output [7:0] tx_data,
  output reg new_tx_data

  );

  // Output message states
  localparam
    OUTPUT_BITS  = 1,
    OUTPUT_IDLE  = 1'd0,
    OUTPUT_MSG   = 1'd1;

  // Input command states
  localparam
    INPUT_BITS   = 2,
    INPUT_IDLE   = 2'd0,
    INPUT_RESET  = 2'd1,
    INPUT_MOTOR  = 2'd2,
    INPUT_DATA   = 2'd3;

  // Message parameters
  localparam MSG_LEN  = 64;
  parameter MSG_BITS = $clog2(MSG_LEN);
 
  // Internal registers
  reg [MSG_BITS-1:0] addr_d, addr_q;
  reg [OUTPUT_BITS-1:0] state_output_d, state_output_q = OUTPUT_IDLE;
  reg [INPUT_BITS-1:0] state_input_d, state_input_q = INPUT_IDLE;
 
  // Connect output signals
  assign tx_data = debug_msg[addr_q];

  // Timestamp: Convert binary to bcd
  wire [30:0] timestamp_bcd;
  bin2bcd #(
    .BITS(24) )
    bin2bcd_timestamp (
    .bin(timestamp),
    .bcd(timestamp_bcd) );

  // Timestamp: Convert bcd to ascii
  wire [63:0] timestamp_ascii;
  bcd2ascii #(
    .CHAR_LEN(8) )
    bcd2ascii_timestamp (
    .bcd({1'b0,timestamp_bcd}),
    .ascii(timestamp_ascii) );

  // Timestamp: Convert vector to array
  wire [7:0] timestamp_msg [7:0];
  `VEC_ARR_2D( timestamp_ascii, 8, 8, timestamp_msg )




/*  // Inputs: Convert binary to bcd
  wire [xx:0] inputs_bcd;
  bin2bcd #(
    .BITS(XX) )
    bin2bcd_inputs (
    .bin(inputs),
    .bcd(inputs_bcd) );

  // Inputs: Convert bcd to ascii
  wire [xx:0] inputs_ascii;
  bcd2ascii #(
    .CHAR_LEN(X) )
    bcd2ascii_timestamp (
    .bcd({1'b0,inputs_bcd}),
    .ascii(inputs_ascii) );
*/



  // Motor
  wire [7:0] motor_msg;
  reg motor_d, motor_q;
  assign motor_msg = motor_q ? "A" : "D";

  // Data
  wire [7:0] data_msg;
  reg data_d, data_q;
  assign data_msg = data_q ? "R" : "I";




  // Assemble debug message
  wire [7:0] debug_msg [MSG_LEN-1:0];

  // Full ACC
  assign debug_msg[ 0] = " ";
  assign debug_msg[ 1] = timestamp_msg[5];
  assign debug_msg[ 2] = timestamp_msg[4];
  assign debug_msg[ 3] = timestamp_msg[3];
  assign debug_msg[ 4] = ".";
  assign debug_msg[ 5] = timestamp_msg[2];
  assign debug_msg[ 6] = " ";
  assign debug_msg[ 7] = acc[47] ? "1" : "0";
  assign debug_msg[ 8] = acc[46] ? "1" : "0";
  assign debug_msg[ 9] = acc[45] ? "1" : "0";
  assign debug_msg[10] = acc[44] ? "1" : "0";
  assign debug_msg[11] = acc[43] ? "1" : "0";
  assign debug_msg[12] = acc[42] ? "1" : "0";
  assign debug_msg[13] = acc[41] ? "1" : "0";
  assign debug_msg[14] = acc[40] ? "1" : "0";
  assign debug_msg[15] = " ";
  assign debug_msg[16] = acc[39] ? "1" : "0";
  assign debug_msg[17] = acc[38] ? "1" : "0";
  assign debug_msg[18] = acc[37] ? "1" : "0";
  assign debug_msg[19] = acc[36] ? "1" : "0";
  assign debug_msg[20] = acc[35] ? "1" : "0";
  assign debug_msg[21] = acc[34] ? "1" : "0";
  assign debug_msg[22] = acc[33] ? "1" : "0";
  assign debug_msg[23] = acc[32] ? "1" : "0";
  assign debug_msg[24] = " ";
  assign debug_msg[25] = acc[31] ? "1" : "0";
  assign debug_msg[26] = acc[30] ? "1" : "0";
  assign debug_msg[27] = acc[29] ? "1" : "0";
  assign debug_msg[28] = acc[28] ? "1" : "0";
  assign debug_msg[29] = acc[27] ? "1" : "0";
  assign debug_msg[30] = acc[26] ? "1" : "0";
  assign debug_msg[31] = acc[25] ? "1" : "0";
  assign debug_msg[32] = acc[24] ? "1" : "0";
  assign debug_msg[33] = " ";
  assign debug_msg[34] = acc[23] ? "1" : "0";
  assign debug_msg[35] = acc[22] ? "1" : "0";
  assign debug_msg[36] = acc[21] ? "1" : "0";
  assign debug_msg[37] = acc[20] ? "1" : "0";
  assign debug_msg[38] = acc[19] ? "1" : "0";
  assign debug_msg[39] = acc[18] ? "1" : "0";
  assign debug_msg[40] = acc[17] ? "1" : "0";
  assign debug_msg[41] = acc[16] ? "1" : "0";
  assign debug_msg[42] = " ";
  assign debug_msg[43] = acc[15] ? "1" : "0";
  assign debug_msg[44] = acc[14] ? "1" : "0";
  assign debug_msg[45] = acc[13] ? "1" : "0";
  assign debug_msg[46] = acc[12] ? "1" : "0";
  assign debug_msg[47] = acc[11] ? "1" : "0";
  assign debug_msg[48] = acc[10] ? "1" : "0";
  assign debug_msg[49] = acc[ 9] ? "1" : "0";
  assign debug_msg[50] = acc[ 8] ? "1" : "0";
  assign debug_msg[51] = " ";
  assign debug_msg[52] = acc[ 7] ? "1" : "0";
  assign debug_msg[53] = acc[ 6] ? "1" : "0";
  assign debug_msg[54] = acc[ 5] ? "1" : "0";
  assign debug_msg[55] = acc[ 4] ? "1" : "0";
  assign debug_msg[56] = acc[ 3] ? "1" : "0";
  assign debug_msg[57] = acc[ 2] ? "1" : "0";
  assign debug_msg[58] = acc[ 1] ? "1" : "0";
  assign debug_msg[59] = acc[ 0] ? "1" : "0";
  assign debug_msg[60] = " ";
  assign debug_msg[61] = " ";
  assign debug_msg[62] = " ";
  assign debug_msg[63] = "\r";

/*  // Full GYR
  assign debug_msg[ 0] = " ";
  assign debug_msg[ 1] = timestamp_msg[5];
  assign debug_msg[ 2] = timestamp_msg[4];
  assign debug_msg[ 3] = timestamp_msg[3];
  assign debug_msg[ 4] = ".";
  assign debug_msg[ 5] = timestamp_msg[2];
  assign debug_msg[ 6] = " ";
  assign debug_msg[ 7] = gyr[47] ? "1" : "0";
  assign debug_msg[ 8] = gyr[46] ? "1" : "0";
  assign debug_msg[ 9] = gyr[45] ? "1" : "0";
  assign debug_msg[10] = gyr[44] ? "1" : "0";
  assign debug_msg[11] = gyr[43] ? "1" : "0";
  assign debug_msg[12] = gyr[42] ? "1" : "0";
  assign debug_msg[13] = gyr[41] ? "1" : "0";
  assign debug_msg[14] = gyr[40] ? "1" : "0";
  assign debug_msg[15] = " ";
  assign debug_msg[16] = gyr[39] ? "1" : "0";
  assign debug_msg[17] = gyr[38] ? "1" : "0";
  assign debug_msg[18] = gyr[37] ? "1" : "0";
  assign debug_msg[19] = gyr[36] ? "1" : "0";
  assign debug_msg[20] = gyr[35] ? "1" : "0";
  assign debug_msg[21] = gyr[34] ? "1" : "0";
  assign debug_msg[22] = gyr[33] ? "1" : "0";
  assign debug_msg[23] = gyr[32] ? "1" : "0";
  assign debug_msg[24] = " ";
  assign debug_msg[25] = gyr[31] ? "1" : "0";
  assign debug_msg[26] = gyr[30] ? "1" : "0";
  assign debug_msg[27] = gyr[29] ? "1" : "0";
  assign debug_msg[28] = gyr[28] ? "1" : "0";
  assign debug_msg[29] = gyr[27] ? "1" : "0";
  assign debug_msg[30] = gyr[26] ? "1" : "0";
  assign debug_msg[31] = gyr[25] ? "1" : "0";
  assign debug_msg[32] = gyr[24] ? "1" : "0";
  assign debug_msg[33] = " ";
  assign debug_msg[34] = gyr[23] ? "1" : "0";
  assign debug_msg[35] = gyr[22] ? "1" : "0";
  assign debug_msg[36] = gyr[21] ? "1" : "0";
  assign debug_msg[37] = gyr[20] ? "1" : "0";
  assign debug_msg[38] = gyr[19] ? "1" : "0";
  assign debug_msg[39] = gyr[18] ? "1" : "0";
  assign debug_msg[40] = gyr[17] ? "1" : "0";
  assign debug_msg[41] = gyr[16] ? "1" : "0";
  assign debug_msg[42] = " ";
  assign debug_msg[43] = gyr[15] ? "1" : "0";
  assign debug_msg[44] = gyr[14] ? "1" : "0";
  assign debug_msg[45] = gyr[13] ? "1" : "0";
  assign debug_msg[46] = gyr[12] ? "1" : "0";
  assign debug_msg[47] = gyr[11] ? "1" : "0";
  assign debug_msg[48] = gyr[10] ? "1" : "0";
  assign debug_msg[49] = gyr[ 9] ? "1" : "0";
  assign debug_msg[50] = gyr[ 8] ? "1" : "0";
  assign debug_msg[51] = " ";
  assign debug_msg[52] = gyr[ 7] ? "1" : "0";
  assign debug_msg[53] = gyr[ 6] ? "1" : "0";
  assign debug_msg[54] = gyr[ 5] ? "1" : "0";
  assign debug_msg[55] = gyr[ 4] ? "1" : "0";
  assign debug_msg[56] = gyr[ 3] ? "1" : "0";
  assign debug_msg[57] = gyr[ 2] ? "1" : "0";
  assign debug_msg[58] = gyr[ 1] ? "1" : "0";
  assign debug_msg[59] = gyr[ 0] ? "1" : "0";
  assign debug_msg[60] = " ";
  assign debug_msg[61] = " ";
  assign debug_msg[62] = " ";
  assign debug_msg[63] = "\r";
*/
/*  // Full MAG
  assign debug_msg[ 0] = " ";
  assign debug_msg[ 1] = timestamp_msg[5];
  assign debug_msg[ 2] = timestamp_msg[4];
  assign debug_msg[ 3] = timestamp_msg[3];
  assign debug_msg[ 4] = ".";
  assign debug_msg[ 5] = timestamp_msg[2];
  assign debug_msg[ 6] = " ";
  assign debug_msg[ 7] = mag[39] ? "1" : "0";
  assign debug_msg[ 8] = mag[38] ? "1" : "0";
  assign debug_msg[ 9] = mag[37] ? "1" : "0";
  assign debug_msg[10] = mag[36] ? "1" : "0";
  assign debug_msg[11] = mag[35] ? "1" : "0";
  assign debug_msg[12] = mag[34] ? "1" : "0";
  assign debug_msg[13] = mag[33] ? "1" : "0";
  assign debug_msg[14] = mag[32] ? "1" : "0";
  assign debug_msg[15] = " ";
  assign debug_msg[16] = mag[47] ? "1" : "0";
  assign debug_msg[17] = mag[46] ? "1" : "0";
  assign debug_msg[18] = mag[45] ? "1" : "0";
  assign debug_msg[19] = mag[44] ? "1" : "0";
  assign debug_msg[20] = mag[43] ? "1" : "0";
  assign debug_msg[21] = mag[42] ? "1" : "0";
  assign debug_msg[22] = mag[41] ? "1" : "0";
  assign debug_msg[23] = mag[40] ? "1" : "0";
  assign debug_msg[24] = " ";
  assign debug_msg[25] = mag[23] ? "1" : "0";
  assign debug_msg[26] = mag[22] ? "1" : "0";
  assign debug_msg[27] = mag[21] ? "1" : "0";
  assign debug_msg[28] = mag[20] ? "1" : "0";
  assign debug_msg[29] = mag[19] ? "1" : "0";
  assign debug_msg[30] = mag[18] ? "1" : "0";
  assign debug_msg[31] = mag[17] ? "1" : "0";
  assign debug_msg[32] = mag[16] ? "1" : "0";
  assign debug_msg[33] = " ";
  assign debug_msg[34] = mag[31] ? "1" : "0";
  assign debug_msg[35] = mag[30] ? "1" : "0";
  assign debug_msg[36] = mag[29] ? "1" : "0";
  assign debug_msg[37] = mag[28] ? "1" : "0";
  assign debug_msg[38] = mag[27] ? "1" : "0";
  assign debug_msg[39] = mag[26] ? "1" : "0";
  assign debug_msg[40] = mag[25] ? "1" : "0";
  assign debug_msg[41] = mag[24] ? "1" : "0";
  assign debug_msg[42] = " ";
  assign debug_msg[43] = mag[ 7] ? "1" : "0";
  assign debug_msg[44] = mag[ 6] ? "1" : "0";
  assign debug_msg[45] = mag[ 5] ? "1" : "0";
  assign debug_msg[46] = mag[ 4] ? "1" : "0";
  assign debug_msg[47] = mag[ 3] ? "1" : "0";
  assign debug_msg[48] = mag[ 2] ? "1" : "0";
  assign debug_msg[49] = mag[ 1] ? "1" : "0";
  assign debug_msg[50] = mag[ 0] ? "1" : "0";
  assign debug_msg[51] = " ";
  assign debug_msg[52] = mag[15] ? "1" : "0";
  assign debug_msg[53] = mag[14] ? "1" : "0";
  assign debug_msg[54] = mag[13] ? "1" : "0";
  assign debug_msg[55] = mag[12] ? "1" : "0";
  assign debug_msg[56] = mag[11] ? "1" : "0";
  assign debug_msg[57] = mag[10] ? "1" : "0";
  assign debug_msg[58] = mag[ 9] ? "1" : "0";
  assign debug_msg[59] = mag[ 8] ? "1" : "0";
  assign debug_msg[60] = " ";
  assign debug_msg[61] = " ";
  assign debug_msg[62] = " ";
  assign debug_msg[63] = "\r";
*/
/*  // High byte ACC and MAG
  assign debug_msg[ 0] = " ";
  assign debug_msg[ 1] = timestamp_msg[5];
  assign debug_msg[ 2] = timestamp_msg[4];
  assign debug_msg[ 3] = timestamp_msg[3];
  assign debug_msg[ 4] = ".";
  assign debug_msg[ 5] = timestamp_msg[2];
  assign debug_msg[ 6] = " ";
  assign debug_msg[ 7] = acc[47] ? "1" : "0";
  assign debug_msg[ 8] = acc[46] ? "1" : "0";
  assign debug_msg[ 9] = acc[45] ? "1" : "0";
  assign debug_msg[10] = acc[44] ? "1" : "0";
  assign debug_msg[11] = acc[43] ? "1" : "0";
  assign debug_msg[12] = acc[42] ? "1" : "0";
  assign debug_msg[13] = acc[41] ? "1" : "0";
  assign debug_msg[14] = acc[40] ? "1" : "0";
  assign debug_msg[15] = " ";
  assign debug_msg[16] = acc[31] ? "1" : "0";
  assign debug_msg[17] = acc[30] ? "1" : "0";
  assign debug_msg[18] = acc[29] ? "1" : "0";
  assign debug_msg[19] = acc[28] ? "1" : "0";
  assign debug_msg[20] = acc[27] ? "1" : "0";
  assign debug_msg[21] = acc[26] ? "1" : "0";
  assign debug_msg[22] = acc[25] ? "1" : "0";
  assign debug_msg[23] = acc[24] ? "1" : "0";
  assign debug_msg[24] = " ";
  assign debug_msg[25] = acc[15] ? "1" : "0";
  assign debug_msg[26] = acc[14] ? "1" : "0";
  assign debug_msg[27] = acc[13] ? "1" : "0";
  assign debug_msg[28] = acc[12] ? "1" : "0";
  assign debug_msg[29] = acc[11] ? "1" : "0";
  assign debug_msg[30] = acc[10] ? "1" : "0";
  assign debug_msg[31] = acc[9]  ? "1" : "0";
  assign debug_msg[32] = acc[8]  ? "1" : "0";
  assign debug_msg[33] = " ";
  assign debug_msg[34] = gyr[47] ? "1" : "0";
  assign debug_msg[35] = gyr[46] ? "1" : "0";
  assign debug_msg[36] = gyr[45] ? "1" : "0";
  assign debug_msg[37] = gyr[44] ? "1" : "0";
  assign debug_msg[38] = gyr[43] ? "1" : "0";
  assign debug_msg[39] = gyr[42] ? "1" : "0";
  assign debug_msg[40] = gyr[41] ? "1" : "0";
  assign debug_msg[41] = gyr[40] ? "1" : "0";
  assign debug_msg[42] = " ";
  assign debug_msg[43] = gyr[31] ? "1" : "0";
  assign debug_msg[44] = gyr[30] ? "1" : "0";
  assign debug_msg[45] = gyr[29] ? "1" : "0";
  assign debug_msg[46] = gyr[28] ? "1" : "0";
  assign debug_msg[47] = gyr[27] ? "1" : "0";
  assign debug_msg[48] = gyr[26] ? "1" : "0";
  assign debug_msg[49] = gyr[25] ? "1" : "0";
  assign debug_msg[50] = gyr[24] ? "1" : "0";
  assign debug_msg[51] = " ";
  assign debug_msg[52] = gyr[15] ? "1" : "0";
  assign debug_msg[53] = gyr[14] ? "1" : "0";
  assign debug_msg[54] = gyr[13] ? "1" : "0";
  assign debug_msg[55] = gyr[12] ? "1" : "0";
  assign debug_msg[56] = gyr[11] ? "1" : "0";
  assign debug_msg[57] = gyr[10] ? "1" : "0";
  assign debug_msg[58] = gyr[ 9] ? "1" : "0";
  assign debug_msg[59] = gyr[ 8] ? "1" : "0";
  assign debug_msg[60] = " ";
  assign debug_msg[61] = " ";
  assign debug_msg[62] = " ";
  assign debug_msg[63] = "\r";
*/

  // Combinational logic
  always @(*) begin

    // Initial assignments
    addr_d          = addr_q;
    state_output_d  = state_output_q;
    state_input_d   = state_input_q;
    new_tx_data     = 1'b0;
    motor_d         = motor_q;
    data_d          = data_q;

    // Begin 'output' FSM
    case (state_output_q)

      // Wait for timer signal
      OUTPUT_IDLE: begin
        addr_d = { MSG_BITS {1'b0} };
        if (tmr)
          state_output_d = OUTPUT_MSG;
      end

      // Output the debugging message
      OUTPUT_MSG: begin
        if (!tx_busy) begin
          new_tx_data = 1'b1;
          addr_d = addr_q + 1'b1;
          if ( addr_q == MSG_LEN-1 )
            state_output_d = OUTPUT_IDLE;
        end
      end

      // Default 'output' case
      default: state_output_d = OUTPUT_IDLE;

    // Finish 'output' FSM 
    endcase

    // Begin 'input' FSM
    case (state_input_q)

      // Wait for terminal input
      INPUT_IDLE: begin

        // New command available
        if (new_rx_data) begin

          // Detected 'reset' command
          if ( rx_data == "r" ) begin
            state_input_d = INPUT_RESET;
          end

          // Detected 'motor' command
          if ( rx_data == "m" ) begin
            state_input_d = INPUT_MOTOR;
          end

          // Detected 'data' command
          if ( rx_data == "d" ) begin
            state_input_d = INPUT_DATA;
          end

        end

      end

      // Reset the avionics board
      INPUT_RESET: begin
        // Add specific code here...
        state_input_d = INPUT_IDLE;
      end

      // Change the motor arm/disarm status
      INPUT_MOTOR: begin
        motor_d = ~motor_q;
        state_input_d = INPUT_IDLE;
      end

      // Change the datalog status
      INPUT_DATA: begin
        data_d = ~data_q;
        state_input_d = INPUT_IDLE;
      end

    // Finish 'input' FSM 
    endcase

  end


  // Synchronous logic 
  always @( posedge clk ) begin

    if (rst) begin
      state_output_q  <= OUTPUT_IDLE;
      state_input_q   <= INPUT_IDLE;
      motor_q         <= 1'b0;
      data_q          <= 1'b0;
    end else begin
      state_output_q  <= state_output_d;
      state_input_q   <= state_input_d;
      motor_q         <= motor_d;
      data_q          <= data_d;
    end
 
    addr_q <= addr_d;

  end

endmodule



