
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// serial_debug.v
// Module transmits a debugging message over a serial channel.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module serial_debug
  #(
  parameter CLK_PER_BIT = 50,
  parameter MSG_LEN = 256
  )(
  input clk,
  input rst,
  input block,
  input send,
  input [(8*MSG_LEN)-1:0] data,
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

  // IO registers
  reg [(8*MSG_LEN)-1:0] data_d, data_q;
  reg busy_d, busy_q;
  reg tx_d, tx_q;

  // Internal registers
  reg [7:0] byte_d, byte_q;
  reg [STATE_BITS-1:0] state_d, state_q = IDLE;
  reg [CTR_BITS-1:0] ctr_d, ctr_q;
  reg [2:0] bit_ctr_d, bit_ctr_q;
  reg [MSG_BITS-1:0] msg_ctr_d, msg_ctr_q;

  // Connect output signals
  assign busy = busy_q;
  assign tx = tx_q;

  // Combinational logic
  always @(*) begin

    // Preallocate registers
    byte_d        = byte_q;
    state_d       = state_q;
    ctr_d         = ctr_q;
    bit_ctr_d     = bit_ctr_q;
    msg_ctr_d     = msg_ctr_q;
    busy_d        = busy_q;

    // State machine
    case (state_q)

      IDLE: begin
        if (block) begin
          busy_d = 1'b1;
          tx_d = 1'b1;
        end else begin
          busy_d = 1'b0;
          tx_d = 1'b1;
          ctr_d = 1'b0;
          bit_ctr_d = 1'b0;
          msg_ctr_d = 1'b0;
          if (send) begin
            data_d = data;
            state_d = START_BIT;
            busy_d = 1'b1;
          end
        end
      end

      START_BIT: begin
        byte_d = data_q >> ( MSG_LEN - msg_ctr_q - 1) * 8;
        busy_d = 1'b1;
        ctr_d = ctr_q + 1'b1;
        tx_d = 1'b0;
        if ( ctr_q == CLK_PER_BIT - 1 ) begin
          ctr_d = 1'b0;
          state_d = DATA;
        end
      end

      DATA: begin
        busy_d = 1'b1;
        tx_d = byte_q[bit_ctr_q];
        ctr_d = ctr_q + 1'b1;
        if ( ctr_q == CLK_PER_BIT - 1 ) begin
          ctr_d = 1'b0;
          bit_ctr_d = bit_ctr_q + 1'b1;
          if ( bit_ctr_q == 7 ) begin
            state_d = STOP_BIT;
          end
        end
      end

      STOP_BIT: begin
        busy_d = 1'b1;
        tx_d = 1'b1;
        ctr_d = ctr_q + 1'b1;
        if ( ctr_q == CLK_PER_BIT - 1 ) begin
          msg_ctr_d = msg_ctr_q + 1'b1;
          if ( msg_ctr_q == MSG_LEN - 1 ) begin
            state_d = IDLE;
          end else begin
            state_d = START_BIT;
          end
        end
      end

      default: begin
        state_d = IDLE;
      end

    endcase

  end

  // Sychronous logic
  always @( posedge clk ) begin

    // Reset conditions
    if (rst) begin
      data_q     <= data;
      state_q    <= IDLE;
      msg_ctr_q  <= 1'b0;
      tx_q       <= 1'b1;
    end else begin
      data_q     <= data_d;
      state_q    <= state_d;
      msg_ctr_q  <= msg_ctr_d;
      tx_q       <= tx_d;
    end

    // Non-reset conditions
    byte_q         <= byte_d;
    ctr_q          <= ctr_d;
    bit_ctr_q      <= bit_ctr_d;
    busy_q         <= busy_d;

  end

endmodule



