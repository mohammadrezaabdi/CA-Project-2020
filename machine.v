// Copyright (C) 1991-2009 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II"
// VERSION		"Version 9.0 Build 132 02/25/2009 SJ Web Edition"
// CREATED ON	"Mon Jul 27 03:42:37 2020"

module machine(
	reg_file_reset,
	pc_reset,
	clk,
	seq_reset,
	interrupt_reset,
	QNaN,
	SNaN,
	inexact,
	overflow,
	underflow,
	div_by_zero
);


input	reg_file_reset;
input	pc_reset;
input	clk;
input	seq_reset;
input	interrupt_reset;
output	QNaN;
output	SNaN;
output	inexact;
output	overflow;
output	underflow;
output	div_by_zero;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_30;
wire	[31:0] SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[1:0] SYNTHESIZED_WIRE_17;
wire	[1:0] SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_33;
wire	[31:0] SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_21;
wire	[1:0] SYNTHESIZED_WIRE_22;
wire	[1:0] SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_34;
wire	[31:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;





CPU	b2v_inst(
	.clk(clk),
	.seq_reset(SYNTHESIZED_WIRE_0),
	.seq_enable(SYNTHESIZED_WIRE_1),
	.reg_reset(reg_file_reset),
	.ins(SYNTHESIZED_WIRE_30),
	.mem_word_out(SYNTHESIZED_WIRE_31),
	.pc_in(SYNTHESIZED_WIRE_32),
	.interrupt(SYNTHESIZED_WIRE_26),
	.data_mem_clk(SYNTHESIZED_WIRE_12),
	.ins_mem_clk(SYNTHESIZED_WIRE_13),
	.mem_address(SYNTHESIZED_WIRE_16),
	.mem_read(SYNTHESIZED_WIRE_17),
	.mem_word_in(SYNTHESIZED_WIRE_20),
	.mem_write(SYNTHESIZED_WIRE_18),
	.pc(SYNTHESIZED_WIRE_33));


FPU	b2v_inst1(
	.clk(clk),
	.seq_reset(SYNTHESIZED_WIRE_5),
	.seq_enable(SYNTHESIZED_WIRE_6),
	.reg_reset(reg_file_reset),
	.ins0(SYNTHESIZED_WIRE_30),
	.ins1(SYNTHESIZED_WIRE_8),
	.mem_word_out(SYNTHESIZED_WIRE_31),
	.pc_in(SYNTHESIZED_WIRE_32),
	.interrupt(SYNTHESIZED_WIRE_27),
	.data_mem_clk(SYNTHESIZED_WIRE_14),
	.ins_mem_clk(SYNTHESIZED_WIRE_15),
	.DIVZ(div_by_zero),
	.QNAN(QNaN),
	.SNAN(SNaN),
	.INEX(inexact),
	.UNFL(overflow),
	.OVFL(underflow),
	.mem_address(SYNTHESIZED_WIRE_21),
	.mem_read(SYNTHESIZED_WIRE_22),
	.mem_word_in(SYNTHESIZED_WIRE_25),
	.mem_write(SYNTHESIZED_WIRE_23),
	.pc(SYNTHESIZED_WIRE_34));


memory	b2v_inst2(
	.bus_control(SYNTHESIZED_WIRE_11),
	.cpu_data_clk(SYNTHESIZED_WIRE_12),
	.cpu_ins_clk(SYNTHESIZED_WIRE_13),
	.fpu_data_clk(SYNTHESIZED_WIRE_14),
	.fpu_ins_clk(SYNTHESIZED_WIRE_15),
	.cpu_address(SYNTHESIZED_WIRE_16),
	.cpu_mem_read(SYNTHESIZED_WIRE_17),
	.cpu_mem_write(SYNTHESIZED_WIRE_18),
	.cpu_pc(SYNTHESIZED_WIRE_33),
	.cpu_word_in(SYNTHESIZED_WIRE_20),
	.fpu_address(SYNTHESIZED_WIRE_21),
	.fpu_mem_read(SYNTHESIZED_WIRE_22),
	.fpu_mem_write(SYNTHESIZED_WIRE_23),
	.fpu_pc(SYNTHESIZED_WIRE_34),
	.fpu_word_in(SYNTHESIZED_WIRE_25),
	.ins0(SYNTHESIZED_WIRE_30),
	.ins1(SYNTHESIZED_WIRE_8),
	.word_out(SYNTHESIZED_WIRE_31));


interrupt_handler	b2v_inst3(
	.interrupt_reset(interrupt_reset),
	.seq_reset(seq_reset),
	.pc_reset(pc_reset),
	.cpu_int(SYNTHESIZED_WIRE_26),
	.fpu_int(SYNTHESIZED_WIRE_27),
	.clk(clk),
	.cpu_pc(SYNTHESIZED_WIRE_33),
	.fpu_pc(SYNTHESIZED_WIRE_34),
	.cpu_seq_en(SYNTHESIZED_WIRE_1),
	.cpu_seq_reset(SYNTHESIZED_WIRE_0),
	.fpu_seq_en(SYNTHESIZED_WIRE_6),
	.fpu_seq_reset(SYNTHESIZED_WIRE_5),
	.bus_control(SYNTHESIZED_WIRE_11),
	.pc_out(SYNTHESIZED_WIRE_32));


endmodule
