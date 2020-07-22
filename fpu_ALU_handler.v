module fpu_ALU_handler (alu_opcode, in_r1 ,in_r2, in_r3, imm, out1, out2, ADD, SUB, MUL, DIV, INV, ABS, COM, BLT, BEQ, BGT);

  input [4:0] alu_opcode;
  input [31:0] in_r1 ,in_r2, in_r3, imm;
  output [31:0] out1, out2;
  output ADD, SUB, MUL, DIV, INV, ABS, COM, BLT, BEQ, BGT;
  reg [31:0] out1, out2;

  assign ADD = (alu_opcode[3:0] == 4'b0001) ? 1'b1 : 1'b0;
  assign SUB = (alu_opcode[3:0] == 4'b0010) ? 1'b1 : 1'b0;
  assign MUL = (alu_opcode[3:0] == 4'b0011) ? 1'b1 : 1'b0;
  assign DIV = (alu_opcode[3:0] == 4'b0100) ? 1'b1 : 1'b0;
  assign INV = (alu_opcode[3:0] == 4'b0101) ? 1'b1 : 1'b0;
  assign ABS = (alu_opcode[3:0] == 4'b0110) ? 1'b1 : 1'b0;
  assign COM = (alu_opcode[3:0] == 4'b0111 || alu_opcode[3:2] == 2'b11) ? 1'b1 : 1'b0;
  assign BLT = (alu_opcode == 5'b11101) ? 1'b1 : 1'b0;
  assign BEQ = (alu_opcode == 5'b11100) ? 1'b1 : 1'b0;
  assign BGT = (alu_opcode == 5'b11110) ? 1'b1 : 1'b0;


  always @ (alu_opcode) begin
    if (|alu_opcode) begin
      if ((INV || ABS) && alu_opcode[4] == 1'b1) begin // INIF , ABSIF
        out1 = imm;
      end
      else if (COM) begin // COM , BLT , BEQ, BGT
        out1 = in_r1;
      end
      else begin
        out1 = in_r2;
      end

      if (alu_opcode[4:3] == 2'b10) begin // ADDIF , SUBIF , MULIF , DIVIF , INVIF , , ABSIF
        out2 = imm;
      end
      else if (COM) begin // BLT , BEQ , BGT
        out2 = in_r2;
      end
      else begin
        out2 = in_r3;
      end
    end
  end


endmodule
