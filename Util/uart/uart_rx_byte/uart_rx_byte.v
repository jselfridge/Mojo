
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// uart_rx_byte.v
// Module receives a single byte of UART serial data.
// Baud rates:
//   115,200 => 434
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module uart_rx_byte
  #(
  parameter CLK_PER_BIT = 50
  )(
  input clk,
  input rst,
  input rx,
  output [7:0] data,
  output new_data
  );

  // Determine number of bits for counter
  parameter CTR_BITS = $clog2(CLK_PER_BIT);

  // Declare module states
  localparam STATE_BITS = 2;
  localparam
    IDLE      = 2'd0,
    WAIT_HALF = 2'd1,
    WAIT_FULL = 2'd2,
    WAIT_HIGH = 2'd3;

  // Input/Output registers
  reg rx_d, rx_q;
  reg [7:0] data_d, data_q;
  reg new_data_d, new_data_q;

  // Internal registers
  reg [CTR_BITS-1:0] ctr_d, ctr_q;
  reg [2:0] bit_ctr_d, bit_ctr_q;
  reg [STATE_BITS-1:0] state_d, state_q = IDLE;

  // Connect output signals
  assign data = data_q;
  assign new_data = new_data_q;

  // Combinational logic
  always @(*) begin

    // Preallocate reisters
    rx_d        = rx;
    data_d      = data_q;
    new_data_d  = 1'b0;
    ctr_d       = ctr_q;
    bit_ctr_d   = bit_ctr_q;
    state_d     = state_q;

    // State machine
    case (state_q)

      // No current transmissions
      IDLE: begin

        // Reset counters
        ctr_d = 1'b0;
        bit_ctr_d = 3'b0;

        // Starting new transmission
        if ( rx_q == 1'b0 ) begin
          state_d = WAIT_HALF;
        end

      end

      // Wait half period during start bit
      WAIT_HALF: begin

        // Increment counter
        ctr_d = ctr_q + 1'b1;

        // Reached half period
        if ( ctr_q == ( CLK_PER_BIT >> 1 ) ) begin
          ctr_d = 1'b0;
          state_d = WAIT_FULL;
        end

      end

      // Wait full period for data bits
      WAIT_FULL: begin

        // Increment counter
        ctr_d = ctr_q + 1'b1;

        // Reached full period
        if ( ctr_q == CLK_PER_BIT - 1 ) begin

          // Reset counter
          ctr_d = 1'b0;

          // Increment bit counter
          bit_ctr_d = bit_ctr_q + 1'b1;

          // Shift existing data
          data_d = { rx_q, data_q[7:1] } ;

          // Reached last bit
          if ( bit_ctr_q == 3'd7 ) begin
            new_data_d = 1'b1;
            state_d = WAIT_HIGH;
          end

        end

      end

      // Listen for stop bit
      WAIT_HIGH: begin

        // High RX line indicates stop bit
        if ( rx_q == 1'b1 ) begin
          state_d = IDLE;
        end

      end

      // Default to IDLE state
      default: begin
        state_d = IDLE;
      end

    endcase

  end

  // Synchronous logic
  always @(posedge clk) begin

    // Reset conditions
    if (rst) begin
      data_q      <= 8'b0;
      new_data_q  <= 1'b0;
      ctr_q       <= 1'b0;
      bit_ctr_q   <= 3'b0;
      state_q     <= IDLE;
    end else begin
      data_q      <= data_d;
      new_data_q  <= new_data_d;
      ctr_q       <= ctr_d;
      bit_ctr_q   <= bit_ctr_d;
      state_q     <= state_d;
    end

    // Non-reset conditions
    rx_q  <= rx_d;

  end

endmodule



