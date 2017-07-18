
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// flags.v
// Module monitors radio stick commands and aplies logic flags.
// 5-bit 'ctr' has 32 values at 10 hz requires a 3.2 sec hold.
// Down-and-in arms/disarms the motors.
// Down-and-out starts/stops the data log.
// Up-and-out resets the entire system.
// Up-and-in powers down the system.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
`include "../../Util/resize/VEC_ARR_2D/VEC_ARR_2D.v"

module flags
  (
  input tmr_10hz,
  input [39:0] radio_val,
  output motor_flag,
  output data_flag,
  output reset_flag,
  output power_flag
  );

  // Demux radio channel values
  wire [9:0] ch [3:0];
  `VEC_ARR_2D( radio_val, 4, 10, ch );

  // Internal registers
  reg [4:0] motor_ctr_d, motor_ctr_q;
  reg [4:0] data_ctr_d,  data_ctr_q;
  reg [4:0] reset_ctr_d, reset_ctr_q;
  reg [4:0] power_ctr_d, power_ctr_q;

  // Connect output signal
  assign motor_flag = ( motor_ctr_q == { 5{1'b1} } );
  assign data_flag  = ( data_ctr_q  == { 5{1'b1} } );
  assign reset_flag = ( reset_ctr_q == { 5{1'b1} } );
  assign power_flag = ( power_ctr_q == { 5{1'b1} } );

  // Combinational logic
  always @(*) begin

    // Initial assignments
    motor_ctr_d = motor_ctr_q;
    data_ctr_d  = data_ctr_q;
    reset_ctr_d = reset_ctr_q;
    power_ctr_d = power_ctr_q;

    // Throttle (ch0) and elevator (ch2) are low
    if ( ( ch[0] < 10'd12 ) && ( ch[2] > 10'd1012 ) ) begin

      // If roll (ch1) and yaw (ch3) are pointed inward
      if( ( ch[1] < 10'd12 ) && ( ch[3] > 10'd1012 ) ) begin

        // Increment motor counter
        motor_ctr_d = motor_ctr_q + 1'b1;

        // Saturate motor counter if needed
        if ( motor_ctr_q == { 5{1'b1} } ) begin
          motor_ctr_d = motor_ctr_q;
        end

      end

      // Reset motor counter o/w
      else begin
        motor_ctr_d = { 5{1'b0} };
      end

      // If roll (ch1) and yaw (ch3) are pointed outward
      if( ( ch[1] > 10'd1012 ) && ( ch[3] < 10'd12 ) ) begin

        // Increment data counter
        data_ctr_d = data_ctr_q + 1'b1;

        // Saturate data counter if needed
        if ( data_ctr_q == { 5{1'b1} } ) begin
          data_ctr_d = data_ctr_q;
        end

      end

      // Reset data counter o/w
      else begin
        data_ctr_d = { 5{1'b0} };
      end

    end

    // Throttle (ch0) and elevator (ch2) are high
    if ( ( ch[0] > 10'd1012 ) && ( ch[2] < 10'd12 ) ) begin

      // If roll (ch1) and yaw (ch3) are pointed inward
      if( ( ch[1] < 10'd12 ) && ( ch[3] > 10'd1012 ) ) begin

        // Increment power counter
        power_ctr_d = power_ctr_q + 1'b1;

        // Saturate power counter if needed
        if ( power_ctr_q == { 5{1'b1} } ) begin
          power_ctr_d = power_ctr_q;
        end

      end

      // Reset power counter o/w
      else begin
        power_ctr_d = { 5{1'b0} };
      end

      // If roll (ch1) and yaw (ch3) are pointed outward
      if( ( ch[1] > 10'd1012 ) && ( ch[3] < 10'd12 ) ) begin

        // Increment reset counter
        reset_ctr_d = reset_ctr_q + 1'b1;

        // Saturate reset counter if needed
        if ( reset_ctr_q == { 5{1'b1} } ) begin
          reset_ctr_d = reset_ctr_q;
        end

      end

      // Reset reset counter o/w
      else begin
        reset_ctr_d = { 5{1'b0} };
      end

    end

  end

  // Synchronous logic
  always @( posedge tmr_10hz ) begin
    motor_ctr_q  <= motor_ctr_d;
    data_ctr_q   <= data_ctr_d;
    reset_ctr_q  <= reset_ctr_d;
    power_ctr_q  <= power_ctr_d;
  end

endmodule



