
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// single_to_int_small.v
// Converts floating single (single) to signed fixed single (int).
// This module has a smaller hardware footprint than the piped version.
// But it runs more slowly, over 35+ clock cycles at its worst case.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module single_to_int_small (
  input clk,
  input rst,
  input [31:0] single_val,
  input single_cont,
  input int_cont,
  output [31:0] int_val,
  output single_ready,
  output int_ready
  );

  // Output registers
  reg [31:0] int_val_s;
  reg single_ready_s;
  reg int_ready_s;

  // Assign output values
  assign int_val = int_val_s;
  assign single_ready = single_ready_s;
  assign int_ready = int_ready_s;

  // State machine parameters
  reg [2:0] state;
  parameter
    getin    = 3'd0,
    special  = 3'd1,
    unpack   = 3'd2,
    convert  = 3'd3,
    putout   = 3'd4;

  // Internal registers
  reg [31:0] a_m, a, z;
  reg [8:0] a_e;
  reg a_s;

  // Synchronous logic
  always @( posedge clk ) begin

    // Begin FSM
    case (state)

      // Obtain single float input value
      getin : begin
        single_ready_s <= 1'b1;
        if ( single_ready_s && single_cont ) begin
          a <= single_val;
          single_ready_s <= 1'b0;
          state <= unpack;
        end
      end

      // Demux the single float value components
      unpack : begin
        a_m[31:8] <= { 1'b1, a[22:0] };
        a_m[7:0] <= 0;
        a_e <= a[30:23] - 127;
        a_s <= a[31];
        state <= special;
      end

      // Evaluate special cases
      special : begin
        if ( $signed(a_e) == -127 ) begin
          z <= 0;
          state <= putout;
        end else if ( $signed(a_e) > 31 ) begin
          z <= 32'h80000000;
          state <= putout;
        end else begin
          state <= convert;
        end
      end

      // Convert single float to single int
      convert : begin
        if ( $signed(a_e) < 31 && a_m ) begin
          a_e <= a_e + 1;
          a_m <= a_m >> 1;
        end else begin
          if (a_m[31]) begin
            z <= 32'h80000000;
          end else begin
            z <= a_s ? -a_m : a_m;
          end
          state <= putout;
        end
      end

      // Pass the integer value into the output register
      putout : begin
        int_ready_s <= 1'b1;
        int_val_s <= z;
        if ( int_ready_s && int_cont ) begin
          int_ready_s <= 1'b0;
          state <= getin;
        end
      end

    // Exit FSM
    endcase

    // Specify reset conditions
    if ( rst == 1 ) begin
      state <= getin;
      int_val_s = 32'b0;
      single_ready_s <= 1'b0;
      int_ready_s <= 1'b0;
    end

  end

endmodule



