module memory_bus (bus_control, cpu_mem_read, cpu_mem_write, cpu_word_in, cpu_address, cpu_clk, fpu_mem_read, fpu_mem_write, fpu_word_in, fpu_address, fpu_clk, mem_read, mem_write, word_in, address, clk);

  input cpu_clk, fpu_clk, bus_control;
  input [1:0] cpu_mem_write, cpu_mem_read, fpu_mem_write, fpu_mem_read;
  input [31:0] cpu_address, cpu_word_in, fpu_address, fpu_word_in;
  output clk;
  output [1:0] mem_write, mem_read;
  output [31:0] address, word_in;

  assign mem_write = (bus_control) ? fpu_mem_write : cpu_mem_write;
  assign mem_read = (bus_control) ? fpu_mem_read : cpu_mem_read;
  assign address = (bus_control) ? fpu_address : cpu_address;
  assign word_in = (bus_control) ? fpu_word_in : cpu_word_in;
  assign clk = (bus_control) ? fpu_clk : cpu_clk;


endmodule
