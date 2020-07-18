module pc_controller (opcode, halt, jreg, addr, condition_bit, pc, clk);

  input clk, halt, condition_bit;
  input [2:0] opcode;
  input [31:0] jreg;
  input [15:0] addr;
  output [31:0] pc;
  reg [31:0] pc;

  always @ (posedge clk) begin
    if (!halt) begin
      case (opcode)
        3'b100: pc = {pc[31:18], addr[15:0], 2'b00};
        3'b101: pc = jreg;
        3'b110: pc = (condition_bit) ? pc + {{14{addr[15]}}, addr[15:0], 2'b00} : pc + 1;
        3'b111: pc = (condition_bit) ? pc + {{14{addr[15]}}, addr[15:0], 2'b00} : pc + 1;
        default: pc = pc + 1;
      endcase
    end
  end

endmodule
