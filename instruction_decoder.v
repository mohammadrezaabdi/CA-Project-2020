module instruction_decoder(ins, opcode, reg1, reg2, reg3, imm, sr_amount);

  input [31:0] ins;
  output [5:0] opcode;
  output  [4:0] reg1, reg2, reg3, sr_amount;
  output  [31:0] imm;

  assign opcode = ins[31:26];
  assign reg1 = ins[25:21];
  assign reg2 = ins[20:16];
  assign reg3 = (|ins && ins[30] == 1'b0) ? ins[15:11] : 5'b0;
  assign sr_amount = (|ins && ins[30] == 1'b0) ? ins[10:6] : 5'b0;
  //wire reserved = (|ins && ins[30] == 1'b0) ? ins[5:0] : 6'b0;
  assign imm = (ins[30] == 1'b1) ? {{16{ins[15]}}, ins[15:0]} : 32'b0;

endmodule
