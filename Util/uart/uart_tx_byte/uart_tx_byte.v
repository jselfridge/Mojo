
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// uart_tx_byte.v
// Module transmits a single byte of UART serial data.
// Baud rates:
//   115,200 => 434
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module uart_tx_byte
  #(
  parameter CLK_PER_BIT = 50
  )(
  input clk,
  input rst,
  input block,
  input send,
  input [7:0] data,
  output busy,
  output tx
  );

  // Determine number of bits counter
  parameter CTR_BITS = $clog2(CLK_PER_BIT);

  // Declare module states
  localparam STATE_BITS = 2;
  localparam
    IDLE       = 2'd0,
    START_BIT  = 2'd1,
    DATA       = 2'd2,
    STOP_BIT   = 2'd3;

  // Input/Output registers
  reg [7:0] data_d, data_q;
  reg busy_d, busy_q;
  reg tx_d, tx_q;

  // Internal registers
  reg [CTR_BITS-1:0] ctr_d, ctr_q;
  reg [2:0] bit_ctr_d, bit_ctr_q;
  reg [STATE_BITS-1:0] state_d, state_q = IDLE;

  // Connect output signals
  assign busy = busy_q;
  assign tx = tx_q;

  // Combinational logic
  always @(*) begin

    // Preallocate registers
    data_d     = data_q;
    busy_d     = busy_q;
    ctr_d      = ctr_q;
    bit_ctr_d  = bit_ctr_q;
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

          // Send flag detected
          if (send) begin
            data_d = data;
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
        tx_d = data_q[bit_ctr_q];

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
          state_d = IDLE;
        end

      end

      // Default to IDLE state
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

  end

endmodule



