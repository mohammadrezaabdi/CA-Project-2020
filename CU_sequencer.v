module CU_sequencer(cpu_clk, reset, IF_clk, ID_clk, ALU_clk, MEM_clk, BR_clk);

  input cpu_clk, reset;
  output IF_clk, ID_clk, ALU_clk, MEM_clk, BR_clk;
  reg IF_clk, ID_clk, ALU_clk, MEM_clk, BR_clk;

  always @ (posedge cpu_clk) begin
    if (reset) begin
      IF_clk <= 1;
      ID_clk <= 0;
      ALU_clk <= 0;
      MEM_clk <= 0;
      BR_clk <= 0;
    end else begin
      IF_clk <= BR_clk;
      ID_clk <= IF_clk;
      ALU_clk <= ID_clk;
      MEM_clk <= ALU_clk;
      BR_clk <= MEM_clk;
    end
  end

endmodule
