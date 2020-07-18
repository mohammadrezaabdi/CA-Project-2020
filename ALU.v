module ALU (operand1, operand2, sr_amount, ADD, SUB , MUL, DIV, MOD, MAX, MIN, NOT, NAND, XNOR, SHL, SHRL, ROL, ROR, SLT, result, zero_less_condition, clk);

input [31:0] operand1, operand2;
input [4:0] sr_amount;
input ADD, SUB , MUL, DIV, MOD, MAX, MIN, NOT, NAND, XNOR, SHL, SHRL, ROL, ROR, SLT, clk;
output [31:0] result;
output zero_less_condition;

// zero_less_condition is for SLT & SUB instructions

endmodule
