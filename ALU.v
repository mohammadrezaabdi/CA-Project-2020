module ALU (operand1, operand2, sr_amount, ADD_e, SUB_e , MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e, BEQ_e, BLT_e, result, zero_less_condition);

  input [31:0] operand1, operand2;
  input [4:0] sr_amount;
  input ADD_e, SUB_e , MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e, BEQ_e, BLT_e;
  output [31:0] result;
  output zero_less_condition;
  reg [31:0] result;

  assign zero_less_condition = ((BEQ_e && result == 32'b0) || (BLT_e && result == 32'b01)) ? 1'b1 : 1'b0;


  always @ (operand1, operand2, sr_amount, ADD_e, SUB_e , MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e) begin
    if (ADD_e) begin
      result = operand1 + operand2;
    end
    if (SUB_e) begin
      result = operand1 - operand2;
    end
    if (SLT_e) begin
      result = (operand1 < operand2) ? 32'b01 : 32'b0;
    end
  end

endmodule
