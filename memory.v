module memory (mem_read, mem_write, word_in, word_out, address, clk);

  parameter word_size = 65536; // 2^16

  input mem_read, mem_write, clk;
  input [31:0] address, word_in;
  output [31:0] word_out;
  reg [31:0] word_out;

  // memory entries
  reg [7:0] entries [word_size-1:0];

  // read
  always @ (posedge clk) begin
    if (mem_read && !mem_write) begin
      word_out = entries[address];
    end
  end

  // write
  always @ (posedge clk) begin
    if (mem_write && !mem_read) begin
      entries[address] = word_in;
    end
  end

endmodule
