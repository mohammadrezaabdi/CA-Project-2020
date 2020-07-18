module write_back (select, mem_out, alu_out, imm, reg_write_data);
  input [1:0] select;
  input [31:0] mem_out, alu_out, imm;
  output [31:0] reg_write_data;
  reg [31:0] reg_write_data;

  always @ (select) begin
    case (select)
      2'b01: reg_write_data = mem_out;
      2'b10: reg_write_data = alu_out;
      2'b11: reg_write_data = imm;
      default: ;//nothing
    endcase
  end

endmodule
