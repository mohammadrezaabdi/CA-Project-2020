module testbench ();

	parameter PERIOD = 1;

	reg clock, reg_file_reset, sequencer_reset, pc_reset;

  CPU test(
  	.clock(clock),
  	.sequencer_reset(sequencer_reset),
  	.registers_reset(reg_file_reset),
		.pc_reset(pc_reset)
  );

	always #PERIOD clock = ~clock;

	initial begin
	  					clock = 0;
    #PERIOD  	reg_file_reset = 1; sequencer_reset = 1; pc_reset = 1;
		#PERIOD		reg_file_reset = 0; sequencer_reset = 0; pc_reset = 0;
    #200  		$stop;
	end

endmodule
