
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// long_to_double_small.v
// Converts signed fixed double (long) to floating double (double).
// This module has a smaller hardware footprint than the piped version.
// But it runs more slowly, over 120+ clock cycles at its worst case.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module long_to_double_small (
  input clk,
  input rst,
  input [63:0] long_val,
  input long_cont,
  input double_cont,
  output [63:0] double_val,
  output long_ready,
  output double_ready
  );

  // Output registers
  reg [63:0] double_val_s;
  reg long_ready_s;
  reg double_ready_s;

  // Assign output values
  assign double_val = double_val_s;
  assign long_ready = long_ready_s;
  assign double_ready = double_ready_s;

  // State machine parameters
  reg [2:0] state;
  parameter
    getin   = 3'd0,
    step0   = 3'd1,
    step1   = 3'd2,
    step2   = 3'd3,
    round   = 3'd4,
    pack    = 3'd5,
    putout  = 3'd6;

  // Internal registers
  reg [63:0] a, z, value;
  reg [52:0] z_m;
  reg [10:0] z_r;
  reg [10:0] z_e;
  reg z_s;
  reg guard, round_bit, sticky;

  // Synchronous logic
  always @( posedge clk ) begin

    // Begin FSM
    case (state)

      // Obtain signed long input value
      getin : begin
        long_ready_s <= 1'b1;
        if ( long_ready_s && long_cont ) begin
          a <= long_val;
          long_ready_s <= 1'b0;
          state <= step0;
        end
      end

      // Check for zero value, or obtain sign bit
      step0 : begin
        if ( a == 0 ) begin
          z_s <= 0;
          z_m <= 0;
          z_e <= -1023;
          state <= pack;
        end else begin
          value <= a[63] ? -a : a;
          z_s <= a[63];
          state <= step1;
        end
      end

      // Demux the absolute value of integer
      step1 : begin
        z_e <= 63;
        z_m <= value[63:11];
        z_r <= value[10:0];
        state <= step2;
      end

      // Shift bits until there is a nonzero MSB
      step2 : begin
        if (!z_m[52]) begin
          z_e <= z_e - 1;
          z_m <= z_m << 1;
          z_m[0] <= z_r[10];
          z_r <= z_r << 1;
        end else begin
          guard <= z_r[10];
          round_bit <= z_r[9];
          sticky <= z_r[8:0] != 0;
          state <= round;
        end
      end

      // Check if rounding is needed
      round : begin
        if ( guard && ( round_bit || sticky || z_m[0] ) ) begin
          z_m <= z_m + 1;
          if ( z_m == 53'h1fffffffffffff ) begin
            z_e <= z_e + 1;
          end
        end
        state <= pack;
      end

      // Assemble the float double output value
      pack : begin
        z[51:0] <= z_m[51:0];
        z[62:52] <= z_e + 1023;
        z[63] <= z_s;
        state <= putout;
      end

      // Pass the float double value to the output register
      putout : begin
        double_ready_s <= 1'b1;
        double_val_s <= z;
        if ( double_ready_s && double_cont ) begin
          double_ready_s <= 1'b0;
          state <= getin;
        end
      end

    // Exit FSM
    endcase

    // Specify reset conditions
    if ( rst == 1 ) begin
      state <= getin;
      double_val_s <= 64'b0;
      long_ready_s <= 1'b0;
      double_ready_s <= 1'b0;
    end

  end

endmodule



