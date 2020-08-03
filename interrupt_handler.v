module interrupt_handler (interrupt_reset, seq_reset, pc_reset, cpu_pc, cpu_int, fpu_pc, fpu_int, cpu_seq_en, cpu_seq_reset, fpu_seq_en, fpu_seq_reset, pc_out, bus_control, clk);

  input cpu_int, fpu_int, interrupt_reset, seq_reset, pc_reset, clk;
  input [31:0] cpu_pc, fpu_pc;
  output cpu_seq_en, cpu_seq_reset, fpu_seq_en, fpu_seq_reset, bus_control;
  output [31:0] pc_out;
  reg cpu_seq_en, cpu_seq_reset, fpu_seq_en, fpu_seq_reset, bus_control;
  reg [31:0] pc_out;

  always @ (cpu_pc) begin
    pc_out = cpu_pc;
  end

  always @ (fpu_pc) begin
    pc_out = fpu_pc;
  end

  always @ (posedge cpu_int) begin // move to fpu
    if (!pc_reset && !interrupt_reset && !fpu_int) begin
      cpu_seq_en = 0;
      cpu_seq_reset = 1;
      fpu_seq_en = 1;
      fpu_seq_reset = 0;
      pc_out = cpu_pc;
      bus_control = 1;
    end

    // test
    $display($time, " cpu_seq_en = %b  cpu_seq_reset = %b  fpu_seq_en = %b  fpu_seq_reset = %b  bus_control = %b EPC = %d", cpu_seq_en, cpu_seq_reset, fpu_seq_en, fpu_seq_reset, bus_control, pc_out);
  end

  always @ (posedge fpu_int) begin // move to cpu
    if (!pc_reset && !interrupt_reset && !cpu_int) begin
      cpu_seq_en = 1;
      cpu_seq_reset = 0;
      fpu_seq_en = 0;
      fpu_seq_reset = 1;
      pc_out = fpu_pc;
      bus_control = 0;
    end

    // test
    $display($time, " cpu_seq_en = %b  cpu_seq_reset = %b  fpu_seq_en = %b  fpu_seq_reset = %b  bus_control = %b EPC = %d", cpu_seq_en, cpu_seq_reset, fpu_seq_en, fpu_seq_reset, bus_control, pc_out);
  end

  always @ (posedge interrupt_reset) begin
    bus_control = 0;
    cpu_seq_en = 1;
    fpu_seq_en = 0;
  end

  always @ (posedge pc_reset) begin
    pc_out = 0;
  end

  always @ (seq_reset) begin
    if (seq_reset) begin
      cpu_seq_reset = 1;
      fpu_seq_reset = 1;
    end
    else begin
      cpu_seq_reset = 0;
      cpu_seq_reset = 0;
    end
  end

endmodule
