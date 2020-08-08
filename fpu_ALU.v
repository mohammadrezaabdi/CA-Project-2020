module fpu_ALU (operand1, operand2, ADD, SUB, MUL, DIV, INV, ABS, COM, BLT, BEQ, BGT, result, com_result, DIVZ, QNAN, SNAN, INEX, UNFL, OVFL, clk);

  input [31:0] operand1, operand2;
  input ADD, SUB, MUL, DIV, INV, ABS, COM, BLT, BEQ, BGT, clk;
  output [31:0] result;
  output com_result, DIVZ, QNAN, SNAN, INEX, UNFL, OVFL;
  reg [31:0] result;
  reg DIVZ, QNAN, SNAN, INEX, UNFL, OVFL;

  assign com_result = ((BLT && &result) || (BEQ && !(|result)) || (BGT && result == 32'b01)) ? 1'b1 : 1'b0;

  always @ (operand1, operand2, ADD, SUB, MUL, DIV, INV, ABS, COM) begin
    if (ADD) begin
      result = operand1 + operand2;
    end
    if (SUB) begin
      result = operand1 - operand2;
    end
    if (MUL) begin
      result = operand1 * operand2;
    end
    if (DIV) begin
      result = operand1 / operand2;
    end
    if (INV) begin
      result = operand1;
    end
    if (ABS) begin
      result = operand1;
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

  initial begin
    DIVZ = 1'b0; QNAN = 1'b0; SNAN = 1'b0; INEX = 1'b0; UNFL = 1'b0; OVFL = 1'b0;
  end

endmodule
