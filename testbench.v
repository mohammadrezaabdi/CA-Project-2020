module testbench ();

	parameter PERIOD = 1;

	reg clock, reg_file_reset, sequencer_reset, pc_reset, interrupt_reset;

  machine test(
  	.clk(clock),
  	.seq_reset(sequencer_reset),
  	.reg_file_reset(reg_file_reset),
		.pc_reset(pc_reset),
		.interrupt_reset(interrupt_reset)
  );

	always #PERIOD clock = ~clock;

	initial begin
	  					clock = 0;
    #PERIOD  	reg_file_reset = 1; sequencer_reset = 1; pc_reset = 1; interrupt_reset = 1;
		#PERIOD		reg_file_reset = 0; sequencer_reset = 0; pc_reset = 0; interrupt_reset = 0;
    #400  		$stop;
	end

endmodule
