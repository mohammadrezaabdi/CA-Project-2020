module ALU (operand1, operand2, sr_amount, ADD_e, SUB_e , MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e, BEQ_e, BLT_e, result, zero_less_condition);

  input [31:0] operand1, operand2;
  input [4:0] sr_amount;
  input ADD_e, SUB_e , MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e, BEQ_e, BLT_e;
  output [31:0] result;
  output zero_less_condition;
  reg [31:0] result;
  reg [63:0] temp;
  reg [5:0] i;
  reg zero_less_condition;

  always @ (operand1, operand2, sr_amount, ADD_e, SUB_e , MUL_e, DIV_e, MOD_e, MAX_e, MIN_e, NOT_e, NAND_e, XNOR_e, SHL_e, SHRL_e, ROL_e, ROR_e, SLT_e, BEQ_e, BLT_e) begin

    zero_less_condition = ((BEQ_e && operand1 == operand2) || (BLT_e && operand1 < operand2));

    if (ADD_e) begin
      result = operand1 + operand2;
    end
    if (SUB_e) begin
      result = operand1 - operand2;
    end
    if (MUL_e) begin
      result = operand1 * operand2;
    end
    if (DIV_e) begin
      result = operand1 / operand2;
    end
    if (MOD_e) begin
      result = operand1 % operand2;
    end
    if (MAX_e) begin
      result = (operand1 > operand2) ? operand1 : operand2;
    end
    if (MIN_e) begin
      result = (operand1 > operand2) ? operand2 : operand1;
    end
    if (NOT_e) begin
      result = ~operand1;
    end
    if (NAND_e) begin
      result = ~(operand1 & operand2);
    end
    if (XNOR_e) begin
      result = operand1 ~^ operand2;
    end
    if (SHL_e) begin
      result = operand1 << sr_amount;
    end
    if (SHRL_e) begin
      result = operand1 >> sr_amount;
    end
    if (ROL_e) begin
      temp[31:0] = operand1;
      temp[63:32] = 32'b0;
      temp = temp << sr_amount;
      for(i = 0; i < sr_amount; i = i + 1) begin
        temp[i] = temp[i + 32];
      end
      result = temp[31:0];
    end
    if (ROR_e) begin
      temp[63:32] = operand1;
      temp[31:0] = 32'b0;
      temp = temp >> sr_amount;
      for(i = 0; i < sr_amount; i = i + 1) begin
        temp[63 - i] = temp[32 - i];
      end
      result = temp[63:32];
    end
    if (SLT_e) begin
      result = (operand1 < operand2) ? 32'b01 : 32'b0;
    end

    //test
    $display($time, " ALU: result=%d, oper1=%d, oper2=%d, con=%d", result, operand1, operand2, zero_less_condition);
  end

endmodule
