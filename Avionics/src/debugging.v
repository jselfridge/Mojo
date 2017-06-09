
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// debugging.v
// Sends debugging messages to a terminal via the AVR USB.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
//`include "../../Util/VEC_ARR_2D.v"
`include "../../Sandbox/resize/VEC_ARR_2D/VEC_ARR_2D.v"

module debugging (

    // Clocks and timers
    input clk,
    input rst,
    input tmr,

    // Terminal data
    input [23:0] timestamp,

    // Inputs from AVR
    input [7:0] rx_data,
    input new_rx_data,
    input tx_busy,

    // Outputs to AVR
    output [7:0] tx_data,
    output reg new_tx_data

  );

  // Output message states
  localparam
    OUTPUT_BITS  = 1,
    OUTPUT_IDLE  = 1'd0,
    OUTPUT_MSG   = 1'd1;

/*
  // Input command states
  localparam
    INPUT_BITS   = 2,
    INPUT_IDLE   = 2'd0,
    INPUT_RESET  = 2'd1,
    INPUT_MOTOR  = 2'd2,
    INPUT_DATA   = 2'd3;
*/

  localparam MESSAGE_LEN = 16;
 
  // Internal registers
  reg [3:0] addr_d, addr_q;
  reg [OUTPUT_BITS-1:0] state_output_d, state_output_q;
  //reg [INPUT_BITS-1:0] state_input_d, state_input_q;
 
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

  // Assemble debug message
  wire [7:0] debug_msg [15:0];
  assign debug_msg[ 0] = "X";
  assign debug_msg[ 1] = " ";
  assign debug_msg[ 2] = "T";
  assign debug_msg[ 3] = "i";
  assign debug_msg[ 4] = "m";
  assign debug_msg[ 5] = "e";
  assign debug_msg[ 6] = ":";
  assign debug_msg[ 7] = " ";
  assign debug_msg[ 8] = timestamp_msg[5];
  assign debug_msg[ 9] = timestamp_msg[4];
  assign debug_msg[10] = timestamp_msg[3];
  assign debug_msg[11] = ".";
  assign debug_msg[12] = timestamp_msg[2];
  assign debug_msg[13] = " ";
  assign debug_msg[14] = " ";
  assign debug_msg[15] = "\r";


  // Combinational logic
  always @(*) begin

    // Initial assignments
    addr_d          = addr_q;
    state_output_d  = state_output_q;
    //state_input_d   = state_input_q;
    new_tx_data     = 1'b0;

    // Begin 'output' FSM
    case (state_output_q)

      // Wait for timer signal
      OUTPUT_IDLE: begin
        addr_d = 4'd0;
        if (tmr)
          state_output_d = OUTPUT_MSG;
      end

      // Output the debugging message
      OUTPUT_MSG: begin
        if (!tx_busy) begin
          new_tx_data = 1'b1;
          addr_d = addr_q + 1'b1;
          if ( addr_q == MESSAGE_LEN-1 )
            state_output_d = OUTPUT_IDLE;
        end
      end

      // Default 'output' case
      default: state_output_d = OUTPUT_IDLE;

    // Finish 'output' FSM 
    endcase

/*
    // State machine: Input user commands
    case (state_in_q)

      // Wait for change
      INPUT_IDLE: begin

        // New command from terminal
        if ( new_rx_data ) begin

          // Detected 'system reset'
          if ( rx_data == "r" ) begin
            state_in_d = RESET_CMD;
          end

          // Detected 'motor' command
          if ( rx_data == "m" ) begin
            state_in_d = MOTOR_CMD;
          end

          // Detected 'datalog' command
          if ( rx_data == "d" ) begin
            state_in_d = DATA_CMD;
          end

        end

      end

      // Reset the avionics board (WIP)
      RESET_CMD: begin
        state_in_d = INPUT_IDLE;
      end

      // Change the motor arm/disarm status (WIP)
      MOTOR_CMD: begin
        state_in_d = INPUT_IDLE;
      end

      // Change the datalog status (WIP)
      DATA_CMD: begin
        state_in_d = INPUT_IDLE;
      end

    // Conclude 'input' FSM
    endcase
*/

  end

  // Synchronous logic 
  always @( posedge clk ) begin

    if (rst) begin
      state_output_q  <= OUTPUT_IDLE;
      //state_input_q   <= INPUT_IDLE;
    end else begin
      state_output_q  <= state_output_d;
      //state_input_q   <= state_input_d;
    end
 
    addr_q <= addr_d;

  end

endmodule



