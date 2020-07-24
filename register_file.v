module register_file(reg_read, reg_write, reg_reset, write_data, opcode, reg1, reg2, reg3, imm,  operand0, operand1, operand2, clk);

  input reg_read, reg_write, reg_reset, clk;
  input [31:0] write_data, imm;
  input  [5:0] opcode;
  input   [4:0] reg1, reg2, reg3;
  output [31:0] operand0, operand1, operand2;
  reg [31:0] operand0, operand1, operand2;
  reg [5:0] i;

  // 32 registers
  reg [31:0] register_file [31:0];

  // reset register file
  always @ (posedge reg_reset) begin
	for (i=0; i<32; i=i+1) begin
		register_file[i] = 32'b0;
	end

    //test
    $writememb("tests/cpu_register_file.mem", register_file);
  end

  // write into register file
  always @ (posedge clk) begin
    if (reg_write && !reg_read && !reg_reset) begin
      case (opcode)
        6'b010000: register_file[reg1][15:0] = write_data[15:0]; //LDI
        6'b010001: register_file[reg1][31:16] = write_data[15:0]; // LUI
        6'b011010: register_file[reg1][7:0] = write_data[7:0]; // LB
        default: register_file[reg1] = write_data;
      endcase

      //test
      $writememb("tests/cpu_register_file.mem", register_file);
    end
  end

  // read from register file
  always @ (posedge clk) begin
    if (reg_read && !reg_write && !reg_reset) begin
      operand0 = register_file[reg1];
      if(opcode[5:1] == 5'b01111) begin // BEQ & BLT
        operand1 = register_file[reg1];
        operand2 = register_file[reg2];
      end
      else begin
        operand1 = register_file[reg2];
        operand2 = (|opcode && opcode[4] == 1'b0) ? register_file[reg3] : imm;
      end
    end
  end

endmodule
