module ALU_controller (opcode, alu_enable, ADD_e, SUB_e , MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e);
  input [4:0] opcode;
  input alu_enable;
  output ADD_e, SUB_e, MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e;

  assign ADD_e = (alu_enable && (opcode == 5'b00001 || opcode == 5'b10010)) ? 1'b1 : 1'b0;
  assign SUB_e = (alu_enable && (opcode == 5'b00010 || opcode == 5'b10011)) ? 1'b1 : 1'b0;
  assign MUL_e = (alu_enable && (opcode == 5'b00011 || opcode == 5'b10100)) ? 1'b1 : 1'b0;
  assign DIV_e = (alu_enable && (opcode == 5'b00100 || opcode == 5'b10101)) ? 1'b1 : 1'b0;
  assign MOD_e = (alu_enable && (opcode == 5'b00101)) ? 1'b1 : 1'b0;
  assign MAX_e = (alu_enable && (opcode == 5'b00110)) ? 1'b1 : 1'b0;
  assign MIN_e = (alu_enable && (opcode == 5'b00111)) ? 1'b1 : 1'b0;
  assign NOT_e = (alu_enable && (opcode == 5'b01000)) ? 1'b1 : 1'b0;
  assign NAND_e = (alu_enable && (opcode == 5'b01001 || opcode == 5'b10110)) ? 1'b1 : 1'b0;
  assign XNOR_e = (alu_enable && (opcode == 5'b01010 || opcode == 5'b10111)) ? 1'b1 : 1'b0;
  assign SHL_e = (alu_enable && (opcode == 5'b01011)) ? 1'b1 : 1'b0;
  assign SHRL_e = (alu_enable && (opcode == 5'b01100)) ? 1'b1 : 1'b0;
  assign ROL_e = (alu_enable && (opcode == 5'b01101)) ? 1'b1 : 1'b0;
  assign ROR_e = (alu_enable && (opcode == 5'b01110)) ? 1'b1 : 1'b0;
  assign SLT_e = (alu_enable && (opcode == 5'b01111)) ? 1'b1 : 1'b0;

endmodule
