
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// flags.v
// Module monitors radio commands and aplies logic flags.
// 5-bit counter has 32 values at 10 hz requires a 3.2 sec hold.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module flags (
  input tmr_10hz,
  input [9:0] thrl_val_i,
  input [9:0] elev_val_i,
  output motor_flag_o,
  output data_flag_o
  );

  // Internal registers
  reg [4:0] motor_ctr_d, motor_ctr_q;
  reg [4:0] data_ctr_d, data_ctr_q;

  // Connect output signal
  assign motor_flag_o = ( motor_ctr_q == {5{1'b1}} );
  assign data_flag_o  = ( data_ctr_q  == {5{1'b1}} );

  // Combinational logic
  always @(*) begin

    // Initial assignments
    motor_ctr_d = motor_ctr_q;
    data_ctr_d = data_ctr_q;

    // Throttle stick is low
    if ( thrl_val_i < 10'd12 ) begin

      // Elevator stick is low (with reversed direction)
      if( elev_val_i > 10'd1012 ) begin

        // Increment motor counter
        motor_ctr_d = motor_ctr_q + 1'b1;

        // Saturate motor counter if needed
        if ( motor_ctr_q == {5{1'b1}} ) begin
          motor_ctr_d = motor_ctr_q;
        end

      end

      // Reset motor counter
      else begin
        motor_ctr_d = {5{1'b0}};
      end

      // Elevator stick is high (with reversed direction)
      if( elev_val_i < 10'd12 ) begin

        // Increment data counter
        data_ctr_d = data_ctr_q + 1'b1;

        // Saturate data counter if needed
        if ( data_ctr_q == {5{1'b1}} ) begin
          data_ctr_d = data_ctr_q;
        end

      end

      // Reset data counter
      else begin
        data_ctr_d = {5{1'b0}};
      end

    end

  end

  // Synchronous logic
  always @( posedge tmr_10hz ) begin
    motor_ctr_q  <= motor_ctr_d;
    data_ctr_q   <= data_ctr_d;
  end

endmodule



