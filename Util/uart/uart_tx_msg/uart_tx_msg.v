
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// uart_tx_msg.v
// Module transmits a serial message over a UART channel.
// Baud rates:
//   115,200 => 434
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module uart_tx_msg
  #(
  parameter CLK_PER_BIT = 50,
  parameter MSG_LEN = 512
  )(
  input clk,
  input rst,
  input block,
  input send,
  input [(8*MSG_LEN)-1:0] msg,
  output busy,
  output tx
  );

  // Determine number of bits needed
  parameter CTR_BITS = $clog2(CLK_PER_BIT);
  parameter MSG_BITS = $clog2(MSG_LEN);

  // Declare module states
  localparam STATE_BITS = 2;
  localparam
    IDLE       = 2'd0,
    START_BIT  = 2'd1,
    DATA       = 2'd2,
    STOP_BIT   = 2'd3;

  // Input/Output registers
  reg [(8*MSG_LEN)-1:0] data_d, data_q;
  reg busy_d, busy_q;
  reg tx_d, tx_q;

  // Internal registers
  reg [CTR_BITS-1:0] ctr_d, ctr_q;
  reg [2:0] bit_ctr_d, bit_ctr_q;
  reg [MSG_BITS-1:0] msg_ctr_d, msg_ctr_q;
  reg [7:0] byte_d, byte_q;
  reg [STATE_BITS-1:0] state_d, state_q = IDLE;

  // Connect output signals
  assign busy = busy_q;
  assign tx = tx_q;

  // Combinational logic
  always @(*) begin

    // Preallocate registers
    busy_d     = busy_q;
    ctr_d      = ctr_q;
    bit_ctr_d  = bit_ctr_q;
    msg_ctr_d  = msg_ctr_q;
    byte_d     = byte_q;
    state_d    = state_q;

    // State machine
    case (state_q)

      // No current transmissions
      IDLE: begin

        // Set TX line high
        tx_d = 1'b1;

        // Block condition
        if (block) begin
          busy_d = 1'b1;
        end

        // No block condition
        else begin

          // Reset values
          busy_d = 1'b0;
          bit_ctr_d = 3'b0;
          ctr_d = 1'b0;
          msg_ctr_d = 1'b0;

          // Send flag detected
          if (send) begin
            data_d = msg;
            busy_d = 1'b1;
            state_d = START_BIT;
          end

        end

      end

      // First transmission bit
      START_BIT: begin

        // Channel is busy
        busy_d = 1'b1;

        // First TX bit is low
        tx_d = 1'b0;

        // Increment counter
        ctr_d = ctr_q + 1'b1;

        // Assign byte from input data
        byte_d = data_q >> ( MSG_LEN - msg_ctr_q - 1) * 8;

        // Completed start bit
        if ( ctr_q == CLK_PER_BIT - 1 ) begin
          ctr_d = 1'b0;
          state_d = DATA;
        end

      end

      // Send the transmission bits
      DATA: begin

        // Channel is busy
        busy_d = 1'b1;

        // Send current TX bit
        tx_d = byte_q[bit_ctr_q];

        // Increment the counter
        ctr_d = ctr_q + 1'b1;

        // Completed current bit
        if ( ctr_q == CLK_PER_BIT - 1 ) begin

          // Reset counter
          ctr_d = 1'b0;

          // Increment bit counter
          bit_ctr_d = bit_ctr_q + 1'b1;

          // Completed transmitting last bit
          if ( bit_ctr_q == 7 ) begin
            state_d = STOP_BIT;
          end

        end

      end

      // Last transmission bit
      STOP_BIT: begin

        // Channel is busy
        busy_d = 1'b1;

        // Last TX bit is high
        tx_d = 1'b1;

        // Increment counter
        ctr_d = ctr_q + 1'b1;

        // Completed stop bit
        if ( ctr_q == CLK_PER_BIT - 1 ) begin

          // Increment message counter
          msg_ctr_d = msg_ctr_q + 1'b1;

          // Go idle if end of message
          if ( msg_ctr_q == MSG_LEN - 1 ) begin
            state_d = IDLE;
          end

          // Return to start bit o/w
          else begin
            state_d = START_BIT;
          end

        end

      end

      // Default to idle state
      default: begin
        state_d = IDLE;
      end

    endcase

  end

  // Sychronous logic
  always @( posedge clk ) begin

    // Reset conditions
    if (rst) begin
      tx_q     <= 1'b1;
      state_q  <= IDLE;
    end else begin
      tx_q     <= tx_d;
      state_q  <= state_d;
    end

    // Non-reset conditions
    data_q     <= data_d;
    busy_q     <= busy_d;
    ctr_q      <= ctr_d;
    bit_ctr_q  <= bit_ctr_d;
    msg_ctr_q  <= msg_ctr_d;
    byte_q     <= byte_d;

  end

endmodule



