module pc_controller (opcode, pc_in, jreg, addr, condition_bit, pc, clk);

  input [31:0] pc_in;
  input clk, condition_bit;
  input [2:0] opcode;
  input [31:0] jreg;
  input [31:0] addr;
  output [31:0] pc;
  reg [31:0] pc;

  always @ (pc_in) begin
     pc = pc_in;
  end

  always @ (posedge clk) begin

        //test
        $display($time, " branch opcode = %b   address = %d   final address = %d", opcode, addr, {addr[29:0], 2'b00} + pc);

      case (opcode)
        3'b011: pc = pc + 4;
        3'b100: pc = {pc[31:18], addr[15:0], 2'b00};
        3'b101: pc = jreg;
        3'b110: pc = (condition_bit) ? pc + {addr[29:0], 2'b00} : pc + 4;
        3'b111: pc = (condition_bit) ? pc + {addr[29:0], 2'b00} : pc + 4;
        default: ; // do nothing
      endcase
  end

endmodule
