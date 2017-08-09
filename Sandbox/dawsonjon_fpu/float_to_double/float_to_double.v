
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// float_to_double.v
// Converts an integer into IEEE floating point value with 
// double precision.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module float_to_double
  (
  input_a,
  input_a_stb,
  output_z_ack,
  clk,
  rst,
  output_z,
  output_z_stb,
  input_a_ack
  );

  input  clk;
  input  rst;

  input  [31:0] input_a;
  input  input_a_stb;
  output input_a_ack;

  output [63:0] output_z;
  output output_z_stb;
  input  output_z_ack;

  // Output registers
  reg s_output_z_stb;
  reg [63:0] s_output_z;
  reg s_input_a_ack;
  //reg s_input_b_ack;

  // State machine parameters
  reg [1:0] state;
  parameter
    get_a        = 3'd0,
    convert_0    = 3'd1,
    normalise_0  = 3'd2,
    put_z        = 3'd3;

  // Internal registers
  reg [63:0] z;
  reg [10:0] z_e;
  reg [52:0] z_m;
  reg [31:0] a;

  // Synchronous logic
  always @(posedge clk) begin

    // Begin FSM
    case (state)

      // Obtain input value
      get_a : begin

        // Set ‘ack’ flag condition
        s_input_a_ack <= 1;

        // Look for start condition
        if ( s_input_a_ack && input_a_stb ) begin

          //  Transfer input register
          a <= input_a;

          // Reset ‘ack’ flag condition
          s_input_a_ack <= 0;

          // Move to next state
          state <= convert_0;

        end

      end

      // Apply transformation
      convert_0 : begin

        // Transfer sign bit
        z[63] <= a[31];

        // Adjust exponent bias and transfer
        z[62:52] <= ( a[30:23] - 127 ) + 1023;

        // Transfer mantissa and populate remaining placeholders
        z[51:0] <= { a[22:0], 29'd0 };

        // Correction for completely full exponent term
        if ( a[30:23] == 255 ) begin
            z[62:52] <= 2047;
        end

        // Move to next state
        state <= put_z;

        // Check for exponent with a value of zero
        if ( a[30:23] == 0 ) begin

          // Check if mantissa is non zero
          if (a[23:0]) begin

            // Move to next state
            state <= normalise_0;

            // Adjust exponent term
            z_e <= 897;

            // Adjust mantissa term
            z_m <= { 1'd0, a[22:0], 29'd0 };

          end

          // Revise exponent value
          z[62:52] <= 0;

        end

      end

      // Apply normalization process
      normalise_0 : begin

        // Look for high bit
        if (z_m[52]) begin

          // Apply exponent term
          z[62:52] <= z_e;

          // Apply mantissa term
          z[51:0] <= z_m[51:0];

          // Move to next state
          state <= put_z;

        end

        // Bit is low (repeat until high bit is found)
        else begin

          // Shift mantissa value
          z_m <= { z_m[51:0], 1'd0 };

          // Decrement exponent term
          z_e <= z_e - 1;

        end

      end

      // Pass the value to the output registers
      put_z : begin

        // Toggle flag indicator
        s_output_z_stb <= 1;

        // Pass output to register
        s_output_z <= z;

        // Check for exit condition
        if ( s_output_z_stb && output_z_ack ) begin

          // Reset start condition flag
          s_output_z_stb <= 0;

          // Move to original state
          state <= get_a;

        end

      end

    // Exit FSM
    endcase

    // Specifiy reset conditions
    if ( rst == 1 ) begin
      state <= get_a;
      s_input_a_ack <= 0;
      s_output_z_stb <= 0;
    end

  end

  // Assign output values
  assign input_a_ack = s_input_a_ack;
  assign output_z_stb = s_output_z_stb;
  assign output_z = s_output_z;

endmodule



