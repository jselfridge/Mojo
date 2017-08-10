
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// float_to_int.v
// Converts an IEEE floating point value into an integer with
// single precision.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module float_to_int
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

  output [31:0] output_z;
  output output_z_stb;
  input  output_z_ack;

  // Output registers
  reg s_output_z_stb;
  reg [31:0] s_output_z;
  reg s_input_a_ack;

  // State machine parameters
  reg [2:0] state;
  parameter
    get_a          = 3'd0,
    special_cases  = 3'd1,
    unpack         = 3'd2,
    convert        = 3'd3,
    put_z          = 3'd4;

  // Internal registers
  reg [31:0] a_m, a, z;
  reg [8:0] a_e;
  reg a_s;

  // Synchronous logic
  always @( posedge clk ) begin

    // Begin FSM
    case (state)

      // Obtain float input value
      get_a : begin

        // Set ‘ack’ flag condition
        s_input_a_ack <= 1;

        // Look for start condition
        if ( s_input_a_ack && input_a_stb ) begin

          // Transfer input register
          a <= input_a;

          // Reset ‘ack’ flag condition
          s_input_a_ack <= 0;

          // Move to next state
          state <= unpack;

        end

      end

      // Demux the floating point value components
      unpack : begin

        // Create mantissa and add leading unity bit
        a_m[31:8] <= { 1'b1, a[22:0] };

        // Assign remaining placeholders
        a_m[7:0] <= 0;

        // Extract exponent term and remove bias
        a_e <= a[30:23] - 127;

        // Obtain sign bit
        a_s <= a[31];

        // Move on to next state
        state <= special_cases;

      end

      // Evaluate special cases
      special_cases : begin

        // Smallest possible exponent
        if ( $signed(a_e) == -127 ) begin

          // Assign a value of zero
          z <= 0;

          // Move to next state
          state <= put_z;

        end

        // Largest exponent that can be stored as an integer
        else if ( $signed(a_e) > 31 ) begin

          // Assign initial value for integer
          z <= 32'h80000000;

          // Move to next state
          state <= put_z;

        end

        // Apply standard conversion process
        else begin
          state <= convert;
        end

      end

      // Convert float to integer
      convert : begin

        // Exponent is below maximum, and mantissa has nonzero bits
        if ( $signed(a_e) < 31 && a_m ) begin

          // Increment exponent
          a_e <= a_e + 1;

          // SHift mantissa bits
          a_m <= a_m >> 1;

        end

        // Exponent has reached maximum value
        else begin

          // Leading bit is high
          if (a_m[31]) begin
            z <= 32'h80000000;
          end

          // Apply correction for sign bit
          else begin
            z <= a_s ? -a_m : a_m;
          end

          // Move to next state
          state <= put_z;

        end

      end

      // Pass the integer value into the output registers
      put_z : begin

        // Set flag indicator
        s_output_z_stb <= 1;

        // Pass output to register
        s_output_z <= z;

        // Check for exit condition
        if ( s_output_z_stb && output_z_ack ) begin

          // Reset start condition
          s_output_z_stb <= 0;

          // Move on to original state
          state <= get_a;

        end

      end

    // Exit FSM
    endcase

    // Specify reset conditions
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



