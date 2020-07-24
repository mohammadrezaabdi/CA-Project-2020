module sequencer(clk, reset, enable, IF_clk, ID_clk, ALU_clk, MEM_clk, BR_clk);

  input clk, reset, enable;
  output IF_clk, ID_clk, ALU_clk, MEM_clk, BR_clk;
  reg IF_clk, ID_clk, ALU_clk, MEM_clk, BR_clk;

  always @ (posedge clk) begin
    if (enable && !reset) begin
      IF_clk <= BR_clk;
      ID_clk <= IF_clk;
      ALU_clk <= ID_clk;
      MEM_clk <= ALU_clk;
      BR_clk <= MEM_clk;
    end
  end

  always @ (posedge reset) begin
    if (reset) begin
      IF_clk <= 1;
      ID_clk <= 0;
      ALU_clk <= 0;
      MEM_clk <= 0;
      BR_clk <= 0;
    end
  end

endmodule
