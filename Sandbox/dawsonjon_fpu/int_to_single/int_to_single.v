
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// int_to_single.v
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module int_to_single (
  input  clk,
  input  rst,
  input  [31:0] int_val,
  input  int_stb,
  input  single_ack,
  output [31:0] single_val,
  output single_stb,
  output int_ack
  );

  // Output registers
  reg [31:0] s_single_val;
  reg s_single_stb;
  reg s_int_ack;

  // Assign output values
  assign single_val = s_single_val;
  assign single_stb = s_single_stb;
  assign int_ack = s_int_ack;

  // State machine parameters
  reg [2:0] state;
  parameter
    get_int     = 3'd0,
    convert_0   = 3'd1,
    convert_1   = 3'd2,
    convert_2   = 3'd3,
    round       = 3'd4,
    pack        = 3'd5,
    put_single  = 3'd6;

  // Internal registers
  reg [31:0] a, z, value;
  reg [23:0] z_m;
  reg [7:0] z_r;
  reg [7:0] z_e;
  reg z_s;
  reg guard, round_bit, sticky;

  // Synchronous logic
  always @( posedge clk ) begin

    // Begin FSM
    case (state)

      // Obtain signed integer input value
      get_int : begin
        s_int_ack <= 1;
        if ( s_int_ack && int_stb ) begin
          a <= int_val;
          s_int_ack <= 0;
          state <= convert_0;
        end
      end

      // Check for zero value, or obtain sign bit
      convert_0 : begin
        if ( a == 0 ) begin
          z_s <= 0;
          z_m <= 0;
          z_e <= -127;
          state <= pack;
        end else begin
          value <= a[31] ? -a : a;
          z_s <= a[31];
          state <= convert_1;
        end
      end

      // Demux the absolute value of integer
      convert_1 : begin
        z_e <= 31;
        z_m <= value[31:8];
        z_r <= value[7:0];
        state <= convert_2;
      end

      // Shift bits until there is a nonzero MSB
      convert_2 : begin
        if (!z_m[23]) begin
          z_e <= z_e - 1;
          z_m <= z_m << 1;
          z_m[0] <= z_r[7];
          z_r <= z_r << 1;
        end else begin
          guard <= z_r[7];
          round_bit <= z_r[6];
          sticky <= z_r[5:0] != 0;
          state <= round;
        end
      end

      // Check if rounding is needed
      round : begin
        if ( guard && ( round_bit || sticky || z_m[0] ) ) begin
          z_m <= z_m + 1;
          if ( z_m == 24'hffffff ) begin
            z_e <= z_e + 1;
          end
        end
        state <= pack;
      end

      // Assemble the float single output value
      pack : begin
        z[22:0] <= z_m[22:0];
        z[30:23] <= z_e + 127;
        z[31] <= z_s;
        state <= put_single;
      end

      // Pass the float single value to the output registers
      put_single : begin
        s_single_stb <= 1;
        s_single_val <= z;
        if ( s_single_stb && single_ack ) begin
          s_single_stb <= 0;
          state <= get_a;
        end
      end

    // Exit FSM
    endcase

    // Specify reset conditions
    if ( rst == 1 ) begin
      state <= get_int;
      s_int_ack <= 0;
      s_single_stb <= 0;
    end

  end

endmodule



