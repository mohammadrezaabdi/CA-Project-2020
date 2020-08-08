module testbench ();

	parameter PERIOD = 1;

	reg clock, reg_file_reset, sequencer_reset, pc_reset, interrupt_reset;
	wire DIVZ, QNAN, SNAN, INEX, OVFL, UNFL;

  machine test(
  	.clk(clock),
  	.seq_reset(sequencer_reset),
  	.reg_file_reset(reg_file_reset),
		.pc_reset(pc_reset),
		.interrupt_reset(interrupt_reset),
		.QNaN(QNAN),
		.SNaN(SNAN),
		.inexact(INEX),
		.overflow(OVFL),
		.underflow(UNFL),
		.div_by_zero(DIVZ)
  );

	always #PERIOD clock = ~clock;

	initial begin
	  					clock = 0;
    #PERIOD  	reg_file_reset = 1; sequencer_reset = 1; pc_reset = 1; interrupt_reset = 1;
		#PERIOD		reg_file_reset = 0; sequencer_reset = 0; pc_reset = 0; interrupt_reset = 0;
    #1000  		$stop;
	end

	always @ (DIVZ or QNAN or SNAN or INEX or OVFL or UNFL) begin
		$display($time, " div_by_zero=%b  QNaN=%b  SNaN=%b  inexact=%b  overflow=%b  underflow=%b", DIVZ, QNAN, SNAN, INEX, OVFL, UNFL);
	end

endmodule
