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
// CREATED ON	"Wed Jul 22 16:32:52 2020"

module FPU(
	clk,
	seq_reset,
	seq_enable,
	reg_reset,
	ins0,
	ins1,
	mem_word_out,
	pc_in,
	ins_mem_clk,
	data_mem_clk,
	interrupt,
	mem_address,
	mem_read,
	mem_word_in,
	mem_write,
	pc
);


input	clk;
input	seq_reset;
input	seq_enable;
input	reg_reset;
input	[31:0] ins0;
input	[31:0] ins1;
input	[31:0] mem_word_out;
input	[31:0] pc_in;
output	ins_mem_clk;
output	data_mem_clk;
output	interrupt;
output	[31:0] mem_address;
output	[1:0] mem_read;
output	[31:0] mem_word_in;
output	[1:0] mem_write;
output	[31:0] pc;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[4:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_32;
wire	[31:0] SYNTHESIZED_WIRE_33;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	[31:0] SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	[4:0] SYNTHESIZED_WIRE_28;
wire	[4:0] SYNTHESIZED_WIRE_29;
wire	[4:0] SYNTHESIZED_WIRE_30;
wire	[31:0] SYNTHESIZED_WIRE_31;

assign	data_mem_clk = clk;
assign	ins_mem_clk = SYNTHESIZED_WIRE_18;
assign	mem_word_in = SYNTHESIZED_WIRE_31;




fpu_ALU	b2v_inst(
	.ADD(SYNTHESIZED_WIRE_0),
	.SUB(SYNTHESIZED_WIRE_1),
	.MUL(SYNTHESIZED_WIRE_2),
	.DIV(SYNTHESIZED_WIRE_3),
	.INV(SYNTHESIZED_WIRE_4),
	.ABS(SYNTHESIZED_WIRE_5),
	.COM(SYNTHESIZED_WIRE_6),
	.BLT(SYNTHESIZED_WIRE_7),
	.BEQ(SYNTHESIZED_WIRE_8),
	.BGT(SYNTHESIZED_WIRE_9),
	.clk(clk),
	.operand1(SYNTHESIZED_WIRE_10),
	.operand2(SYNTHESIZED_WIRE_11),
	.com_result(SYNTHESIZED_WIRE_17),
	.result(SYNTHESIZED_WIRE_23));


fpu_ALU_handler	b2v_inst1(
	.alu_opcode(SYNTHESIZED_WIRE_12),
	.imm(SYNTHESIZED_WIRE_13),
	.in_r1(SYNTHESIZED_WIRE_32),
	.in_r2(SYNTHESIZED_WIRE_33),
	.in_r3(SYNTHESIZED_WIRE_16),
	.ADD(SYNTHESIZED_WIRE_0),
	.SUB(SYNTHESIZED_WIRE_1),
	.MUL(SYNTHESIZED_WIRE_2),
	.DIV(SYNTHESIZED_WIRE_3),
	.INV(SYNTHESIZED_WIRE_4),
	.ABS(SYNTHESIZED_WIRE_5),
	.COM(SYNTHESIZED_WIRE_6),
	.BLT(SYNTHESIZED_WIRE_7),
	.BEQ(SYNTHESIZED_WIRE_8),
	.BGT(SYNTHESIZED_WIRE_9),
	.out1(SYNTHESIZED_WIRE_10),
	.out2(SYNTHESIZED_WIRE_11));


fpu_CU	b2v_inst2(
	.condition_bit(SYNTHESIZED_WIRE_17),
	.IF_clk(SYNTHESIZED_WIRE_18),
	.ID_clk(SYNTHESIZED_WIRE_19),
	.ALU_clk(SYNTHESIZED_WIRE_20),
	.MEM_clk(SYNTHESIZED_WIRE_21),
	.RB_clk(SYNTHESIZED_WIRE_22),
	.alu_result(SYNTHESIZED_WIRE_23),
	.ins0(ins0),
	.ins1(ins1),
	.mem_out(mem_word_out),
	.pc_in(pc_in),
	.reg_file_opr1(SYNTHESIZED_WIRE_32),
	.reg_file_opr2(SYNTHESIZED_WIRE_33),
	.interrupt(interrupt),
	.reg_read(SYNTHESIZED_WIRE_26),
	.reg_write(SYNTHESIZED_WIRE_27),
	.alu_opcode(SYNTHESIZED_WIRE_12),
	.imm(SYNTHESIZED_WIRE_13),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.offset(mem_address),
	.pc(pc),
	.reg1(SYNTHESIZED_WIRE_28),
	.reg2(SYNTHESIZED_WIRE_29),
	.reg3(SYNTHESIZED_WIRE_30),
	.write_data(SYNTHESIZED_WIRE_31));


fpu_register_file	b2v_inst3(
	.reg_read(SYNTHESIZED_WIRE_26),
	.reg_write(SYNTHESIZED_WIRE_27),
	.reg_reset(reg_reset),
	.clk(clk),
	.reg1(SYNTHESIZED_WIRE_28),
	.reg2(SYNTHESIZED_WIRE_29),
	.reg3(SYNTHESIZED_WIRE_30),
	.write_data(SYNTHESIZED_WIRE_31),
	.operand1(SYNTHESIZED_WIRE_32),
	.operand2(SYNTHESIZED_WIRE_33),
	.operand3(SYNTHESIZED_WIRE_16));


sequencer	b2v_inst4(
	.clk(clk),
	.reset(seq_reset),
	.enable(seq_enable),
	.IF_clk(SYNTHESIZED_WIRE_18),
	.ID_clk(SYNTHESIZED_WIRE_19),
	.ALU_clk(SYNTHESIZED_WIRE_20),
	.MEM_clk(SYNTHESIZED_WIRE_21),
	.BR_clk(SYNTHESIZED_WIRE_22));


endmodule
