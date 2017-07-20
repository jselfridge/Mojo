
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
  //input  [7:0] acc,

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
  localparam MSG_LEN  = 32;
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

  // Acc 
  //wire [7:0] acc_msg [7:0];
  //assign acc_msg[0] = acc[0] ? "1" : "0";
  //assign acc_msg[1] = acc[1] ? "1" : "0";
  //assign acc_msg[2] = acc[2] ? "1" : "0";
  //assign acc_msg[3] = acc[3] ? "1" : "0";
  //assign acc_msg[4] = acc[4] ? "1" : "0";
  //assign acc_msg[5] = acc[5] ? "1" : "0";
  //assign acc_msg[6] = acc[6] ? "1" : "0";
  //assign acc_msg[7] = acc[7] ? "1" : "0";


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


/*  // Assemble debug message
  genvar i;
  wire [7:0] debug_msg [63:0];
  assign i = 0;     assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = motor_msg;  // MOTOR => A:armed D:disarmed
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = data_msg;  // DATA => I:idle R:record
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = "T";
  assign i=i+1'b1;  assign debug_msg[i] = ":";
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = timestamp_msg[5];
  assign i=i+1'b1;  assign debug_msg[i] = timestamp_msg[4];
  assign i=i+1'b1;  assign debug_msg[i] = timestamp_msg[3];
  assign i=i+1'b1;  assign debug_msg[i] = ".";
  assign i=i+1'b1;  assign debug_msg[i] = timestamp_msg[2];
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[3][0];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[2][0];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[1][0];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[0][0];
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[3][1];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[2][1];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[1][1];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[0][1];
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[3][2];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[2][2];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[1][2];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[0][2];
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[3][3];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[2][3];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[1][3];
  assign i=i+1'b1;  assign debug_msg[i] = inuts_msg[0][3];
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = " ";
  assign i=i+1'b1;  assign debug_msg[i] = "\r";
*/

  // Assemble debug message
  wire [7:0] debug_msg [MSG_LEN-1:0];
  assign debug_msg[ 0] = " ";
  assign debug_msg[ 1] = motor_msg;  // MOTOR => A:armed D:disarmed
  assign debug_msg[ 2] = " ";
  assign debug_msg[ 3] = data_msg;  // DATA => I:idle R:record
  assign debug_msg[ 4] = " ";
  assign debug_msg[ 5] = "T";
  assign debug_msg[ 6] = ":";
  assign debug_msg[ 7] = " ";
  assign debug_msg[ 8] = timestamp_msg[5];
  assign debug_msg[ 9] = timestamp_msg[4];
  assign debug_msg[10] = timestamp_msg[3];
  assign debug_msg[11] = ".";
  assign debug_msg[12] = timestamp_msg[2];
  assign debug_msg[13] = " ";  // 
  assign debug_msg[14] = " ";  // acc_msg[0];
  assign debug_msg[15] = " ";  // acc_msg[1];
  assign debug_msg[16] = " ";  // acc_msg[2];
  assign debug_msg[17] = " ";  // acc_msg[3];
  assign debug_msg[18] = " ";  // acc_msg[4];
  assign debug_msg[19] = " ";  // acc_msg[5];
  assign debug_msg[20] = " ";  // acc_msg[6];
  assign debug_msg[21] = " ";  // acc_msg[7];
  assign debug_msg[22] = " ";
  assign debug_msg[23] = " ";
  assign debug_msg[24] = " ";
  assign debug_msg[25] = " ";
  assign debug_msg[26] = " ";
  assign debug_msg[27] = " ";
  assign debug_msg[28] = " ";
  assign debug_msg[29] = " ";
  assign debug_msg[30] = " ";
  assign debug_msg[31] = "\r";

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



