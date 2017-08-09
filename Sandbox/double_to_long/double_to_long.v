
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// double_to_long.v
// Converts IEEE floating point value into an integer with
// double precision.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module double_to_long
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

  input  [63:0] input_a;
  input  input_a_stb;
  output input_a_ack;

  output [63:0] output_z;
  output output_z_stb;
  input  output_z_ack;

  // Output registers
  reg s_output_z_stb;
  reg [63:0] s_output_z;
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
  reg [63:0] a_m, a, z;
  reg [11:0] a_e;
  reg a_s;

  // Synchronous logic
  always @( posedge clk ) begin

    // Begin FSM
    case (state)

      // Obtain input value
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

      // Demux the input value
      unpack : begin

        // Assign known values
        a_m[63:11] <= { 1'b1, a[51:0] };

        // Populate remaining placeholders
        a_m[10:0] <= 0;

        // Apply exponent bias
        a_e <= a[62:52] - 1023;

        // Obtain sign bit
        a_s <= a[63];

        // Move to next state
        state <= special_cases;

      end

      // Consider special cases
      special_cases : begin

        // Exponent is smallest value
        if ( $signed(a_e) == -1023 ) begin

          // Assign value of zero
          z <= 0;

          // Move to next state
          state <= put_z;

        end

        // Exponent is maximum value
        else if ( $signed(a_e) == 1024 && a[51:0] != 0 ) begin

          // Assign value of nan
          z <= 64'h8000000000000000;

          // Move to next state
          state <= put_z;

        end

        // Exponent is too large
        else if ( $signed(a_e) > 63 ) begin

          // Assign extereme values based on sign bit
          if (a_s) begin
            z <= 64'h8000000000000000;
          end else begin
            z <= 64'h0000000000000000;
          end

          // Move to next state
          state <= put_z;

        end

        // Any other condition
        else begin

          // Move to next state
          state <= convert;

        end

      end

      // Apply shift process
      convert : begin

        // Keep shifting until exponent is maxed out
        if ( $signed(a_e) < 63 && a_m ) begin

          // Increment exponent
          a_e <= a_e + 1;

          // Shift mantissa
          a_m <= a_m >> 1;

        end

        // Exponent reached maximum value
        else begin

          // Apply special condition
          if (a_m[63] && a_s) begin
            z <= 64'h8000000000000000;
          end

          // Apply sign bit
          else begin
            z <= a_s ? -a_m : a_m;
          end

          // Move on to next state
          state <= put_z;

        end

      end

      // Pass value to the output registers
      put_z : begin

        // Toggle flag indicator
        s_output_z_stb <= 1;

        // Pass output to register
        s_output_z <= z;

        // Check for exit condition
        if ( s_output_z_stb && output_z_ack ) begin

          // Reset start condition flag
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



