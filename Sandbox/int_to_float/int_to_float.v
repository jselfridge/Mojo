
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// int_to_float.v
// Converts an integer into IEEE floating point value with 
// single precision.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module int_to_float
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
  //reg s_input_b_ack;

  // State machine parameters
  reg [2:0] state;
  parameter
    get_a      = 3'd0,
    convert_0  = 3'd1,
    convert_1  = 3'd2,
    convert_2  = 3'd3,
    round      = 3'd4,
    pack       = 3'd5,
    put_z      = 3'd6;

  // Internal registers
  reg [31:0] a, z, value;
  reg [23:0] z_m;
  reg [7:0] z_r;
  reg [7:0] z_e;
  reg z_s;
  reg guard, round_bit, sticky;

  // Synchronous logic
  always @(posedge clk) begin

    // Begin FSM
    case (state)

      // Obtain integer input value
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
          state <= convert_0;

        end

      end

      // Check for zero value, or obtain sign bit
      convert_0 : begin

        // Integer is exactly zero
        if ( a == 0 ) begin

          // Specify components
          z_s <= 0;
          z_m <= 0;
          z_e <= -127;

          // Move on to next state
          state <= pack;

        // Integer in not exactly zero
        end else begin

          // Obtain absolute value of integer
          value <= a[31] ? -a : a;

          // Store sign bit
          z_s <= a[31];

          // Move to next state
          state <= convert_1;

        end

      end

      // Demux the absolute value of integer
      convert_1 : begin

        // Assume the largest possible exponent
        z_e <= 31;

        // Initialize mantissa with MSB
        z_m <= value[31:8];

        // Save the remaining bits for later
        z_r <= value[7:0];

        // Move on to next state
        state <= convert_2;

      end

      // Shift bits until there is a nonzero MSB
      convert_2 : begin

        // Leading bit is zero (repeat shift until a ‘one’ is obtained)
        if (!z_m[23]) begin

          // Decrement exponential value
          z_e <= z_e - 1;

          // Shift all mantissa bits to the left
          z_m <= z_m << 1;

          // Move remainder MSB into mantissa LSB
          z_m[0] <= z_r[7];

          // Shift all remainder bits
          z_r <= z_r << 1;

        // Leading bit has finally become unity 
        end else begin

          // Store MSB of remainder
          guard <= z_r[7];

          // Tie breaker is next most bit
          round_bit <= z_r[6];

          // Some of the LSBs are nonzero
          sticky <= z_r[5:0] != 0;

          // Check if rounding is needed
          state <= round;

        end

      end

      // Check if rounding is needed
      round : begin

        // Rounding up is required
        if ( guard && ( round_bit || sticky || z_m[0] ) ) begin

          // Increment mantissa
          z_m <= z_m + 1;

          // Increment exponent when a rollover occurs
          if ( z_m == 24'hffffff ) begin
            z_e <= z_e + 1;
          end

        end

        // Move on to next state
        state <= pack;

      end

      // Assemble the floating point output value
      pack : begin

        // Assign mantissa value     
        z[22:0] <= z_m[22:0];

        // Assign exponent with shift
        z[30:23] <= z_e + 127;

        // Assign sign bit
        z[31] <= z_s;

        // Move to next state
        state <= put_z;

      end

      // Pass the floating point value to the output registers
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
    if (rst == 1) begin
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



