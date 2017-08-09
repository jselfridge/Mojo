
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// serial_tx_msg.v
// Module sends a complete message over a serial channel. 
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module serial_tx_msg
  #(
  parameter MSG_LEN = 4,
  parameter MSG_BITS = 2
  )(
  input clk,
  input rst,
  input block,
  input send,
  input [31:0] msg,
  output tx
  );

  // Local parameters
  localparam
    STATE_BITS = 1'b1,
    IDLE       = 1'b0,
    SEND       = 1'b1;

  // IO registers
  //reg [7:0] msg_array [MSG_LEN-1:0];

  // Internal registers
  reg [STATE_BITS-1:0] state_d, state_q;
  reg [MSG_BITS-1:0] addr_d, addr_q;
  reg sending_msg_d, sending_msg_q;

  // Connect 'serial_tx_byte' module
  serial_tx_byte
    #(
    .CLK_PER_BIT(434)
    )
    serial_tx_byte
    (
    .clk(clk),
    .rst(rst),
    .block(block),
    .send(sending_msg_q),
    .data(8'b00001111),  //(msg_array[addr_q]),
    .busy(sending_byte),
    .tx(tx)
    );

  // Combinational logic
  always @(*) begin

    state_d = state_q;
    sending_msg_d = sending_msg_q;

    // Demux message
    //msg_array[0] = msg[ 7: 0];
    //msg_array[1] = msg[15: 8];
    //msg_array[2] = msg[23:16];
    //msg_array[3] = msg[31:24];

    // State machine 
    case (state_q)

      // Not transmitting
      IDLE: begin
        addr_d = 2'd0;
        sending_msg_d = 1'b0;
        if (send) begin
          sending_msg_d = 1'b1;
          state_d = SEND;
        end
      end

      // Sending the serial message
      SEND: begin
        if ( !sending_byte ) begin
          addr_d = addr_q + 1'b1;
        //  if ( addr_q == MSG_LEN-1 ) begin
        //    state_d = IDLE;
        //    sending_msg_d = 1'b0;
        //  end
        end
      end

      // Default case
      default: state_d = IDLE;

    endcase

  end

  // Sequential logic
  always @( posedge clk ) begin

    if (rst) begin
      state_q <= IDLE;
      addr_q <= 2'b00;
      sending_msg_q <= 1'b0;
    end else begin
      state_q <= state_d;
      addr_q <= addr_d;
      sending_msg_q <= sending_msg_d;
    end

  end

endmodule



