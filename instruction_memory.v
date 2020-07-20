module instruction_memory(pc, ins, clk);

	parameter  instructions_size = 256;

	input clk;
	input [31:0] pc;
	output reg [31:0] ins;

	reg [31:0] instructions_data [instructions_size-1:0];
	reg [31:0] temp0;
	reg [7:0] temp1 [7:0];
	reg [2:0] temp2;

	initial begin
		$readmemb("tests/validtest.mem", instructions_data);
	end

	always @ (posedge clk) begin
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
		ins = {temp1[temp2], temp1[temp2 + 1], temp1[temp2 + 2], temp1[temp2 + 3]};

		//test
		$display($time, " pc=%d	ins=%b", pc, ins);
	end

endmodule
