module instruction_bus (bus_control, cpu_pc, cpu_en, fpu_pc, fpu_en, pc, clk_en);

  input cpu_en, fpu_en, bus_control;
  input [31:0] cpu_pc, fpu_pc;
  output [31:0] pc;
  output clk_en;

  assign pc = (bus_control) ? fpu_pc : cpu_pc;
  assign clk_en = (bus_control) ? fpu_en : cpu_en;

endmodule
