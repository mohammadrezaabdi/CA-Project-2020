module pc_controller (opcode, halt, jreg, addr, condition_bit, reset, pc, clk);

  input clk, halt, condition_bit, reset;
  input [2:0] opcode;
  input [31:0] jreg;
  input [31:0] addr;
  output [31:0] pc;
  reg [31:0] pc;

  always @ (posedge clk) begin

        //test
        $display($time, " branch opcode = %b   address = %b   final address = %b", opcode, addr, {addr[29:0], 2'b00} + pc);

    if (halt !== 1'b1 && !reset) begin
      case (opcode)
        3'b100: pc = {pc[31:18], addr[15:0], 2'b00};
        3'b101: pc = jreg;
        3'b110: pc = (condition_bit) ? pc + {addr[29:0], 2'b00} : pc + 4;
        3'b111: pc = (condition_bit) ? pc + {addr[29:0], 2'b00} : pc + 4;
        default: pc = pc + 4;
      endcase
    end
  end

  always @ (posedge reset) begin
    if (reset) begin
      pc = 32'b0;
    end
  end

endmodule
