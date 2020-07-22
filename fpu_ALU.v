module fpu_ALU (operand1, operand2, ADD, SUB, MUL, DIV, INV, ABS, COM, BLT, BEQ, BGT, result, com_result, clk);

  input [31:0] operand1, operand2;
  input ADD, SUB, MUL, DIV, INV, ABS, COM, BLT, BEQ, BGT, clk;
  output [31:0] result;
  output com_result;
  reg [31:0] result;

  assign com_result = ((BLT && &result) || (BEQ && !(|result)) || (BGT && result == 32'b01)) ? 1'b1 : 1'b0;

  always @ (operand1, operand2, ADD, SUB, MUL, DIV, INV, ABS, COM) begin
    if (ADD) begin
      result = operand1 + operand2;
    end
    if (SUB) begin
      result = operand1 - operand2;
    end
    if (COM) begin
      if (operand1 < operand2) begin
        result = 32'b1;
      end else if (operand1 > operand2) begin
        result = 32'b01;
      end else begin
        result = 32'b0;
      end
    end
  end

endmodule
