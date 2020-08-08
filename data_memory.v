module data_memory (mem_read, mem_write, word_in, word_out, address, clk);

  parameter word_size = 64;

  input clk;
  input [1:0] mem_write, mem_read;
  input [31:0] address, word_in;
  output [31:0] word_out;
  reg [31:0] word_out;

  // memory entries
  reg [7:0] entries [word_size-1:0];

  // read
  always @ (posedge clk) begin
    if (|mem_read && !(|mem_write)) begin
      if (mem_read == 2'b01) begin // LB
        word_out = {24'b0, entries[address]};
      end else if (mem_read == 2'b11) begin // LW
        word_out = {entries[address] , entries[address + 1], entries[address + 2], entries[address + 3]};
      end
    end
  end

  // write
  always @ (posedge clk) begin
    if (|mem_write && !(|mem_read)) begin
      if (mem_write == 2'b01) begin // SB
        entries[address] = word_in[7:0];
      end else if (mem_write == 2'b11) begin // SW
        entries[address + 3] = word_in[7:0];
        entries[address + 2] = word_in[15:8];
        entries[address + 1] = word_in[23:16];
        entries[address] = word_in[31:24];
      end
    end

    //test
    $writememb("tests/out/memory.mem", entries);
  end

  initial begin
    $readmemb("tests/initial_data_memory.mem", entries);
  end

endmodule
