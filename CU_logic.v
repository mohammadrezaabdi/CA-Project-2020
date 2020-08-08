module CU_logic (interrupt, opcode, IF_clk, ID_clk, ALU_clk, MEM_clk, RB_BR_clk, branch_opcode, reg_read, reg_write, mem_read, mem_write, alu_opcode, RB_mux_opcode);

  input [5:0] opcode;
  input IF_clk, ID_clk, ALU_clk, MEM_clk, RB_BR_clk;
  output interrupt;
  output reg_read, reg_write;
  output [4:0] alu_opcode;
  output [2:0] branch_opcode;
  output [1:0] RB_mux_opcode, mem_write, mem_read;
  reg reg_read, reg_write, interrupt;
  reg [4:0] alu_opcode;
  reg [2:0] branch_opcode;
  reg [1:0] RB_mux_opcode, mem_write, mem_read;

  // conditions
  wire HLT = (opcode == 6'b000000) ? 1'b1 : 1'b0;
  wire MTC = (opcode == 6'b100000) ? 1'b1 : 1'b0;
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
  wire ALU = (ALU_TO_REG || BEQ || BLT || MEMORY);
  wire IMM_TO_REG = (LDI || LUI) ? 1'b1 : 1'b0;
  wire INVALID = (!HLT && !MEMORY && !ALU && !IMM_TO_REG && !BRANCH && !MTC || opcode == 6'b111111) ? 1'b1 : 1'b0;

  always @ (posedge IF_clk) begin // signals Initialization
    branch_opcode = 3'b011;
    reg_read = 1'b0;
    reg_write = 1'b0;
    mem_read = 2'b0;
    mem_write = 2'b0;
    alu_opcode = 5'b0;
    RB_mux_opcode = 2'b0;
    interrupt = 1'b0;

    //Test
      $display($time, " IF");
  end

  always @ (posedge ID_clk) begin // register file reading
    if(!INVALID) begin
      if (MTC) begin   // sending interrupt
        interrupt = 1'b1;
      end
      else if (!HLT) begin
        reg_read = 1'b1;
        reg_write = 1'b0;
      end
    end
    //Test
      $display($time, " ID : reg_read=%b interrupt=%b", reg_read, interrupt);
  end

  always @ (posedge ALU_clk) begin // ALU opcodes & branch handling
    if (!INVALID) begin
      if (!HLT && !IMM_TO_REG && !JMP && !JR) begin
        if (MEMORY) begin
          alu_opcode = 5'b10010; // ADDI
        end
        else begin // arithmatic & immediate format
          alu_opcode = opcode[4:0];
        end
      end

      if (HLT) begin // halt checking
        branch_opcode = 3'b0;
      end
      else if (BRANCH) begin // branch opcode handling
        branch_opcode = {1'b1, opcode[1:0]};
      end
    end
    //Test
      $display($time, " ALU : opcode=%b   halt=%b", alu_opcode, HLT);
  end

  always @ (posedge MEM_clk) begin // memory handling
    if (!INVALID) begin
      if (MEM_LOAD) begin
        mem_write = 2'b0;
        if (LB) begin
          mem_read = 2'b01;
        end else begin
          mem_read = 2'b11;
        end
      end
      else if (MEM_STORE) begin
        mem_read = 2'b0;
        if (SB) begin
          mem_write = 2'b01;
        end else begin
          mem_write = 2'b11;
        end
      end
    end

    //Test
      $display($time, " MEM : read=%b write=%b", mem_read, mem_write);
  end

  always @ (posedge RB_BR_clk) begin // register file writing
    if (!INVALID) begin
      if (!(HLT || BRANCH || MEM_STORE)) begin
        reg_read = 1'b0;
        reg_write = 1'b1;
        if (MEM_LOAD) begin // memory -> reg instruction
          RB_mux_opcode = 2'b01;
        end
        else if (IMM_TO_REG) begin // immidiate -> reg instruction
          RB_mux_opcode = 2'b11;
        end
        else if (ALU_TO_REG) begin // alu -> reg instruction
          RB_mux_opcode = 2'b10;
        end
      end
    end

    //Test
      $display($time, " RB BR : write=%b read=%b", reg_write, reg_read);
  end

endmodule
