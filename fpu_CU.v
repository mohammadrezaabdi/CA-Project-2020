module fpu_CU (interrupt, pc, ins0, ins1, alu_result, condition_bit, mem_out, reg_file_opr1, reg_file_opr2, pc_in, offset, mem_read, mem_write, alu_opcode, reg1, reg2, reg3, reg_read, reg_write, write_data, IF_clk, ID_clk, ALU_clk, MEM_clk, RB_clk, imm);

  input condition_bit, IF_clk, ID_clk, ALU_clk, MEM_clk, RB_clk;
  input [31:0] ins0, ins1, alu_result, reg_file_opr1, reg_file_opr2, mem_out, pc_in;
  output reg_write, reg_read, interrupt;
  output [1:0] mem_write, mem_read;
  output [4:0] alu_opcode;
  output [4:0] reg1, reg2, reg3;
  output [31:0] write_data, offset, imm, pc;
  reg reg_write, reg_read, interrupt;
  reg [1:0] mem_write, mem_read;
  reg [31:0] write_data, offset, pc;
  reg [4:0] alu_opcode;

  // instruction decoding
  wire [5:0] opcode = ins0[31:26];
  wire [4:0] reg1 = ins0[25:21];
  wire [4:0] reg2 = ins0[20:16];
  wire [4:0] reg3 = ins0[15:11];
  wire [31:0] addr = {{16{ins0[15]}}, ins0[15:0]};
  assign imm = ins1;

  // conditions
  wire MFC = (opcode == 6'b111111) ? 1'b1 : 1'b0;
  wire HLT = (opcode == 6'b0) ? 1'b1 : 1'b0;
  wire REG = (opcode[5:4] == 2'b10 && (|opcode[4:0])) ? 1'b1 : 1'b0;
  wire IMM = (opcode[5:3] == 3'b110) ? 1'b1 : 1'b0;
  wire LOAD_IMM = (opcode == 6'b110000) ? 1'b1 : 1'b0;
  wire BRANCH = (opcode[5:2] == 4'b1111 && !MFC) ? 1'b1 : 1'b0;
  wire MEMORY = (opcode[5:2] == 4'b1110) ? 1'b1 : 1'b0;
  wire ALU = ((REG || IMM || BRANCH) && !MEMORY && !LOAD_IMM) ? 1'b1 : 1'b0;
  wire INVALID = (!ALU && !MEMORY && !HLT && !MFC && !LOAD_IMM || opcode == 6'b100000) ? 1'b1 : 1'b0;

  always @ (pc_in) begin
    pc = pc_in;
  end

  //test
  always @ (ins0 or ins1) begin
    $display($time, " opcode=%b reg1=%d reg2=%d reg3=%d addr=%d imm=%b", opcode, reg1, reg2, reg3, addr, imm);
  end

  always @ (posedge IF_clk) begin
    reg_write = 1'b0;
    reg_read = 1'b0;
    mem_read = 2'b0;
    mem_write = 2'b0;
    alu_opcode = 5'b0;
    interrupt = 1'b0;

      //test
      $display($time, " fpu IF");
  end

  always @ (posedge ID_clk) begin
    if (MFC) begin
      interrupt = 1'b1;
    end
    if (!INVALID && !MFC && !HLT && !LOAD_IMM) begin
      reg_read = 1'b1;
      reg_write = 1'b0;
    end

    //test
    $display($time, " fpu ID : reg read = %b interrupt = %b", reg_read, interrupt);
  end

  always @ (posedge ALU_clk) begin
    if (ALU) begin
      alu_opcode = opcode[4:0];
    end

    //test
    $display($time, " fpu ALU : alu opcode = %b", alu_opcode);
  end

  always @ (posedge MEM_clk) begin
    if (MEMORY) begin // memory instructions
      if (opcode[0]==1'b0) begin // read
        offset = reg_file_opr2 + addr;
        mem_read = 2'b11;
        mem_write = 2'b00;
      end
      else if (opcode[0]==1'b1) begin // write
        offset = reg_file_opr2 + addr;
        write_data = reg_file_opr1;
        mem_read = 2'b00;
        mem_write = 2'b11;
      end
    end

    //test
    $display($time, " fpu MEM : mem read = %b  mem write = %b", mem_read, mem_write);
  end

  always @ (posedge RB_clk) begin
    if (!INVALID && !MFC && !HLT && !BRANCH && opcode != 6'b111001) begin
      reg_write = 1'b1;
      reg_read = 1'b0;
      if (ALU) begin // writing register file
        write_data = alu_result;
      end
      if (LOAD_IMM) begin
        write_data = imm;
      end
      if (opcode == 6'b111000) begin
        write_data = mem_out;
      end
    end

    if (BRANCH) begin // branch handling
      pc = (condition_bit) ? pc + {addr[29:0], 2'b00} : pc + 4;
    end else if (IMM) begin
      pc = pc + 8;
    end else if (!HLT) begin
      pc = pc + 4;
    end

    //test
    $display($time, " fpu RB : reg write = %b", reg_write);
    $display($time, " fpu RB : next_pc = %d", pc);
  end

endmodule
