
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// int_to_single_small.v
// Converts signed fixed single (int) to floating single (single).
// This module has a smaller hardware footprint than the piped version.
// But it runs more slowly, over 60+ clock cycles at its worst case.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module int_to_single_small (
  input clk,
  input rst,
  input [31:0] int_val,
  input int_cont,
  input single_cont,
  output [31:0] single_val,
  output int_ready,
  output single_ready
  );

  // Output registers
  reg [31:0] single_val_s;
  reg int_ready_s;
  reg single_ready_s;

  // Assign output values
  assign single_val = single_val_s;
  assign int_ready = int_ready_s;
  assign single_ready = single_ready_s;

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
      getin : begin
        int_ready_s <= 1'b1;
        if ( int_ready_s && int_cont ) begin
          a <= int_val;
          int_ready_s <= 1'b0;
          state <= step0;
        end
      end

      // Check for zero value, or obtain sign bit
      step0 : begin
        if ( a == 0 ) begin
          z_s <= 0;
          z_m <= 0;
          z_e <= -127;
          state <= pack;
        end else begin
          value <= a[31] ? -a : a;
          z_s <= a[31];
          state <= step1;
        end
      end

      // Demux the absolute value of integer
      step1 : begin
        z_e <= 31;
        z_m <= value[31:8];
        z_r <= value[7:0];
        state <= step2;
      end

      // Shift bits until there is a nonzero MSB
      step2 : begin
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
        state <= putout;
      end

      // Pass the float single value to the output register
      putout : begin
        single_ready_s <= 1'b1;
        single_val_s <= z;
        if ( single_ready_s && single_cont ) begin
          single_ready_s <= 1'b0;
          state <= getin;
        end
      end

    // Exit FSM
    endcase

    // Specify reset conditions
    if ( rst == 1 ) begin
      state <= getin;
      single_val_s <= 32'b0;
      int_ready_s <= 1'b0;
      single_ready_s <= 1'b0;
    end

  end

endmodule



