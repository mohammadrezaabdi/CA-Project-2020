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
// CREATED ON	"Wed Jul 22 16:12:36 2020"

module memory(
	cpu_ins_clk,
	cpu_data_clk,
	fpu_ins_clk,
	fpu_data_clk,
	bus_control,
	cpu_address,
	cpu_mem_read,
	cpu_mem_write,
	cpu_pc,
	cpu_word_in,
	fpu_address,
	fpu_mem_read,
	fpu_mem_write,
	fpu_pc,
	fpu_word_in,
	ins0,
	ins1,
	word_out
);


input	cpu_ins_clk;
input	cpu_data_clk;
input	fpu_ins_clk;
input	fpu_data_clk;
input	bus_control;
input	[31:0] cpu_address;
input	[1:0] cpu_mem_read;
input	[1:0] cpu_mem_write;
input	[31:0] cpu_pc;
input	[31:0] cpu_word_in;
input	[31:0] fpu_address;
input	[1:0] fpu_mem_read;
input	[1:0] fpu_mem_write;
input	[31:0] fpu_pc;
input	[31:0] fpu_word_in;
output	[31:0] ins0;
output	[31:0] ins1;
output	[31:0] word_out;

wire	SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[1:0] SYNTHESIZED_WIRE_4;
wire	[1:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;





instruction_bus	b2v_inst1(
	.bus_control(bus_control),
	.cpu_en(cpu_ins_clk),
	.fpu_en(fpu_ins_clk),
	.cpu_pc(cpu_pc),
	.fpu_pc(fpu_pc),
	.clk_en(SYNTHESIZED_WIRE_0),
	.pc(SYNTHESIZED_WIRE_1));


instruction_memory	b2v_inst14(
	.clk_en(SYNTHESIZED_WIRE_0),
	.pc(SYNTHESIZED_WIRE_1),
	.ins0(ins0),
	.ins1(ins1));
	defparam	b2v_inst14.instructions_size = 256;


memory_bus	b2v_inst3(
	.bus_control(bus_control),
	.cpu_clk(cpu_data_clk),
	.fpu_clk(fpu_data_clk),
	.cpu_address(cpu_address),
	.cpu_mem_read(cpu_mem_read),
	.cpu_mem_write(cpu_mem_write),
	.cpu_word_in(cpu_word_in),
	.fpu_address(fpu_address),
	.fpu_mem_read(fpu_mem_read),
	.fpu_mem_write(fpu_mem_write),
	.fpu_word_in(fpu_word_in),
	.clk(SYNTHESIZED_WIRE_2),
	.address(SYNTHESIZED_WIRE_3),
	.mem_read(SYNTHESIZED_WIRE_4),
	.mem_write(SYNTHESIZED_WIRE_5),
	.word_in(SYNTHESIZED_WIRE_6));


data_memory	b2v_inst6(
	.clk(SYNTHESIZED_WIRE_2),
	.address(SYNTHESIZED_WIRE_3),
	.mem_read(SYNTHESIZED_WIRE_4),
	.mem_write(SYNTHESIZED_WIRE_5),
	.word_in(SYNTHESIZED_WIRE_6),
	.word_out(word_out));
	defparam	b2v_inst6.word_size = 64;


endmodule
