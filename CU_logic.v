module CU_logic (opcode, IF_clk, ID_clk, ALU_clk, MEM_clk, RB_BR_clk, branch_opcode, halt, reg_read, reg_write, mem_read, mem_write, alu_opcode, alu_enable, mux_opcode);

  input [5:0] opcode;
  input IF_clk, ID_clk, ALU_clk, MEM_clk, RB_BR_clk;
  output halt, reg_read, reg_write, mem_read, mem_write, alu_enable;
  output [4:0] alu_opcode;
  output [3:0] branch_opcode;
  output [1:0] mux_opcode;
  reg halt, reg_read, reg_write, mem_read, mem_write;
  reg [4:0] alu_opcode;
  reg [3:0] branch_opcode;
  reg alu_enable;
  reg [1:0] mux_opcode;

  // conditions
  wire HLT = (opcode == 6'b000000) ? 1'b1 : 1'b0;
  wire LDI = (opcode == 6'b010000) ? 1'b1 : 1'b0;
  wire LUI = (opcode == 6'b010001) ? 1'b1 : 1'b0;
  wire JMP = (opcode == 6'b011100) ? 1'b1 : 1'b0;
  wire JR = (opcode == 6'b011101) ? 1'b1 : 1'b0;
  wire BEQ = (opcode == 6'b011110) ? 1'b1 : 1'b0;
  wire BLT = (opcode == 6'b011111) ? 1'b1 : 1'b0;
  wire LW = (opcode == 6'b011000) ? 1'b1 : 1'b0;
  wire SW = (opcode == 6'b011001) ? 1'b1 : 1'b0;
  wire LB = (opcode == 6'b011010) ? 1'b1 : 1'b0;
  wire SB = (opcode == 6'b011011) ? 1'b1 : 1'b0;
  wire BRANCH = (JMP || JR || BEQ || BLT) ? 1'b1 : 1'b0;
  wire MEM_LOAD = (LW || LB) ? 1'b1 : 1'b0;
  wire MEM_STORE = (SW || SB) ? 1'b1 : 1'b0;
  wire MEMORY = (MEM_LOAD || MEM_STORE) ? 1'b1 : 1'b0;
  wire ALU_TO_REG = (!HLT && !LDI && !LUI && opcode[5:3] < 3'b011) ? 1'b1 : 1'b0;
  wire IMM_TO_REG = (LDI || LUI) ? 1'b1 : 1'b0;


  always @ (posedge IF_clk) begin // signals Initialization
    branch_opcode = 3'b0;
    halt = 1'b0;
    reg_read = 1'b0;
    reg_write = 1'b0;
    mem_read = 1'b0;
    mem_write = 1'b0;
    alu_opcode = 5'b0;
    alu_enable = 1'b0;
    mux_opcode = 2'b0;
  end

  always @ (posedge ID_clk) begin // register file reading
    if (!HLT) begin
      reg_read = 1'b1;
      reg_write = 1'b0;
    end
  end

  always @ (posedge ALU_clk) begin // ALU handling
    if (HLT || IMM_TO_REG || JMP || JR) begin
      alu_enable = 1'b0;
    end
    else begin
      alu_enable = 1'b1;
      if (BEQ) begin
        alu_opcode = 5'b00010; // SUB
      end
      else if (BLT) begin
        alu_opcode = 5'b01111; // SLT
      end
      else if (MEMORY) begin
        alu_opcode = 5'b10010; // ADDI
      end
      else begin // arithmatic & immediate format
        alu_opcode = opcode[4:0];
      end
    end
  end

  always @ (posedge MEM_clk) begin // memory handling
    if (MEM_LOAD) begin
      mem_read = 1'b1;
      mem_write = 1'b0;
    end
    else if (MEM_STORE) begin
      mem_read = 1'b0;
      mem_write = 1'b1;
    end
  end

  always @ (posedge RB_BR_clk) begin // branching handling & register file writing
    if (HLT) begin
      halt = 1'b1;
    end
    else if (BRANCH) begin
      branch_opcode = {1'b1, opcode[1:0]};
    end

    if (!(HLT || BRANCH || MEM_STORE)) begin
      reg_read = 1'b0;
      reg_write = 1'b1;
      if (MEM_LOAD) begin // memory -> reg instruction
        mux_opcode = 2'b01;
      end
      else if (IMM_TO_REG) begin // immidiate -> reg instruction
      mux_opcode = 2'b11;
      end
      else if (ALU_TO_REG) begin // alu -> reg instruction
        mux_opcode = 2'b10;
      end
    end
  end

endmodule
