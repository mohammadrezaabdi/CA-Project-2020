module instruction_memory(pc, ins0, ins1, clk_en);

	parameter  instructions_size = 256;

	input clk_en;
	input [31:0] pc;
	output [31:0] ins0, ins1;
	reg [31:0] instructions_data [instructions_size-1:0];
	reg [31:0] temp0;
	reg [7:0] temp1 [15:0];
	reg [2:0] temp2;
	reg [31:0] ins0, ins1;

	initial begin
		$readmemb("tests/in/instruction_memory.mem", instructions_data);
	end

	always @ (posedge clk_en) begin
		temp0 = pc >> 2;
		temp2 = {1'b0, pc[1:0]};
		temp1[0] = instructions_data[temp0][31:24];
		temp1[1] = instructions_data[temp0][23:16];
		temp1[2] = instructions_data[temp0][15:8];
		temp1[3] = instructions_data[temp0][7:0];
		temp1[4] = instructions_data[temp0 + 1][31:24];
		temp1[5] = instructions_data[temp0 + 1][23:16];
		temp1[6] = instructions_data[temp0 + 1][15:8];
		temp1[7] = instructions_data[temp0 + 1][7:0];
		temp1[8] = instructions_data[temp0 + 2][31:24];
		temp1[9] = instructions_data[temp0 + 2][23:16];
		temp1[10] = instructions_data[temp0 + 2][15:8];
		temp1[11] = instructions_data[temp0 + 2][7:0];
		temp1[12] = instructions_data[temp0 + 3][31:24];
		temp1[13] = instructions_data[temp0 + 3][23:16];
		temp1[14] = instructions_data[temp0 + 3][15:8];
		temp1[15] = instructions_data[temp0 + 3][7:0];

		ins0 = {temp1[temp2], temp1[temp2 + 1], temp1[temp2 + 2], temp1[temp2 + 3]};
		ins1 = {temp1[temp2 + 4], temp1[temp2 + 5], temp1[temp2 + 6], temp1[temp2 + 7]};

		//test
		$display($time, " pc=%d	ins0=%b ins1=%b", pc, ins0, ins1);
	end

endmodule
