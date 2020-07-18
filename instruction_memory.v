module instruction_memory(pc, ins, clk);

	parameter  instructions_size = 256;

	input clk;
	input [31:0] pc;
	output reg [31:0] ins;

	reg [31:0] instructions_data [instructions_size-1:0];

	initial begin
		$readmemb("instruction.mem", instructions_data);
	end

	always @ (posedge clk) begin
		ins = instructions_data[pc];
	end

endmodule
