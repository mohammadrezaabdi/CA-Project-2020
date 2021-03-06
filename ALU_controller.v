module ALU_controller (opcode, ADD_e, SUB_e , MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e, BEQ_e, BLT_e);
  input [4:0] opcode;
  output ADD_e, SUB_e, MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e, BEQ_e, BLT_e;

  assign ADD_e = (opcode == 5'b00001 || opcode == 5'b10010) ? 1'b1 : 1'b0;
  assign SUB_e = (opcode == 5'b00010 || opcode == 5'b10011) ? 1'b1 : 1'b0;
  assign MUL_e = (opcode == 5'b00011 || opcode == 5'b10100) ? 1'b1 : 1'b0;
  assign DIV_e = (opcode == 5'b00100 || opcode == 5'b10101) ? 1'b1 : 1'b0;
  assign MOD_e = (opcode == 5'b00101) ? 1'b1 : 1'b0;
  assign MAX_e = (opcode == 5'b00110) ? 1'b1 : 1'b0;
  assign MIN_e = (opcode == 5'b00111) ? 1'b1 : 1'b0;
  assign NOT_e = (opcode == 5'b01000) ? 1'b1 : 1'b0;
  assign NAND_e = (opcode == 5'b01001 || opcode == 5'b10110) ? 1'b1 : 1'b0;
  assign XNOR_e = (opcode == 5'b01010 || opcode == 5'b10111) ? 1'b1 : 1'b0;
  assign SHL_e = (opcode == 5'b01011) ? 1'b1 : 1'b0;
  assign SHRL_e = (opcode == 5'b01100) ? 1'b1 : 1'b0;
  assign ROL_e = (opcode == 5'b01101) ? 1'b1 : 1'b0;
  assign ROR_e = (opcode == 5'b01110) ? 1'b1 : 1'b0;
  assign SLT_e = (opcode == 5'b01111) ? 1'b1 : 1'b0;
  assign BEQ_e = (opcode == 5'b11110) ? 1'b1 : 1'b0;
  assign BLT_e = (opcode == 5'b11111) ? 1'b1 : 1'b0;

endmodule
