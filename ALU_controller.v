module ALU_controller (opcode, alu_enable, ADD, SUB , MUL, DIV, MOD, MAX, MIN, NOT, NAND, XNOR, SHL, SHRL, ROL, ROR, SLT);
  input [4:0] opcode;
  input alu_enable;
  output ADD, SUB , MUL, DIV, MOD, MAX, MIN, NOT, NAND, XNOR, SHL, SHRL, ROL, ROR, SLT;

  assign ADD = (alu_enable && (opcode == 5'b00001 || opcode == 5'b10010)) ? 1'b1 : 1'b0;
  assign SUB = (alu_enable && (opcode == 5'b00010 || opcode == 5'b10011)) ? 1'b1 : 1'b0;
  assign MUL = (alu_enable && (opcode == 5'b00011 || opcode == 5'b10100)) ? 1'b1 : 1'b0;
  assign DIV = (alu_enable && (opcode == 5'b00100 || opcode == 5'b10101)) ? 1'b1 : 1'b0;
  assign MOD = (alu_enable && (opcode == 5'b00101)) ? 1'b1 : 1'b0;
  assign MAX = (alu_enable && (opcode == 5'b00110)) ? 1'b1 : 1'b0;
  assign MIN = (alu_enable && (opcode == 5'b00111)) ? 1'b1 : 1'b0;
  assign NOT = (alu_enable && (opcode == 5'b01000)) ? 1'b1 : 1'b0;
  assign NAND = (alu_enable && (opcode == 5'b01001 || opcode == 5'b10110)) ? 1'b1 : 1'b0;
  assign XNOR = (alu_enable && (opcode == 5'b01010 || opcode == 5'b10111)) ? 1'b1 : 1'b0;
  assign SHL = (alu_enable && (opcode == 5'b01011)) ? 1'b1 : 1'b0;
  assign SHRL = (alu_enable && (opcode == 5'b01100)) ? 1'b1 : 1'b0;
  assign ROL = (alu_enable && (opcode == 5'b01101)) ? 1'b1 : 1'b0;
  assign ROR = (alu_enable && (opcode == 5'b01110)) ? 1'b1 : 1'b0;
  assign SLT = (alu_enable && (opcode == 5'b01111)) ? 1'b1 : 1'b0;

endmodule
