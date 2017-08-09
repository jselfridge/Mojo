
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// double_to_float.v
// Converts an IEEE floating point value into an integer with
// double precision.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module double_to_float
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

  output [31:0] output_z;
  output output_z_stb;
  input  output_z_ack;

  // Output registers
  reg s_output_z_stb;
  reg [31:0] s_output_z;
  reg s_input_a_ack;

  // State machine parameters
  reg [1:0] state;
  parameter
    get_a        = 3'd0,
    unpack       = 3'd1,
    denormalise  = 3'd2,
    put_z        = 3'd3;

  // Internal registers
  reg [63:0] a;
  reg [31:0] z;
  reg [10:0] z_e;
  reg [23:0] z_m;
  reg guard;
  reg round;
  reg sticky;

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

      // Unpack the value
      unpack : begin

        // Pull sign bit
        z[31] <= a[63];

        // Move to next state
        state <= put_z;

        // Exponent is exactly zero
        if ( a[62:52] == 0 ) begin
          z[30:23] <= 0;
          z[22:0] <= 0;
        end

        // Exponent term is too small
        else if ( a[62:52] < 897 ) begin
          z[30:23] <= 0;
          z_m <= { 1'd1, a[51:29] };
          z_e <= a[62:52];
          guard <= a[28];
          round <= a[27];
          sticky <= a[26:0] != 0;
          state <= denormalise;
        end

        // Exponent term is max capacity
        else if ( a[62:52] == 2047 ) begin
          z[30:23] <= 255;
          z[22:0] <= 0;
          if (a[51:0]) begin
            z[22] <= 1;
          end
        end

        // Exponent term is too large
        else if ( a[62:52] > 1150 ) begin
          z[30:23] <= 255;
          z[22:0] <= 0;
        end

        // Assign exponent term after adjusting bias
        else begin
          z[30:23] <= ( a[62:52] - 1023 ) + 127;
          if ( a[28] && ( a[27] || a[26:0] ) ) begin
            z[22:0] <= a[51:29] + 1;
          end else begin
            z[22:0] <= a[51:29];
          end
        end

      end

      // Run denormalization process
      denormalise : begin

        // Exponent has maxed out
        if ( z_e == 897 || ( z_m == 0 && guard == 0 ) ) begin
          state <= put_z;
          z[22:0] <= z_m;
          if (guard && (round || sticky)) begin
            z[22:0] <= z_m + 1;
          end
        end

        // Apply shift process
        else begin
          z_e <= z_e + 1;
          z_m <= { 1'd0, z_m[23:1] };
          guard <= z_m[0];
          round <= guard;
          sticky <= sticky | round;
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



