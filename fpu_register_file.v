module fpu_register_file(reg1, reg2, reg3, reg_read, reg_write, write_data, reg_reset, operand1, operand2, operand3, clk);

  input reg_read, reg_write, reg_reset, clk;
  input [31:0] write_data;
  input   [4:0] reg1, reg2, reg3;
  output [31:0] operand1, operand2, operand3;
  reg [31:0] operand1, operand2, operand3;
  reg [5:0] i;

  // 32 registers
  reg [31:0] register_file [31:0];

  // reset register file
  always @ (posedge reg_reset) begin
    for (i=0; i<32; i=i+1) begin
      register_file[i] = 32'b0;
    end

    //test
    $writememb("tests/fpu_register_file.mem", register_file);
  end

  // write into register file
  always @ (posedge clk) begin
    if (reg_write && !reg_read && !reg_reset) begin
        register_file[reg1] = write_data;

      //test
      $writememb("tests/fpu_register_file.mem", register_file);
    end
  end

  // read from register file
  always @ (posedge clk) begin
    if (reg_read && !reg_write && !reg_reset) begin
		    operand1 = register_file[reg1];
        operand2 = register_file[reg2];
        operand3 = register_file[reg3];
    end
  end

endmodule
