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
// CREATED ON	"Wed Jul 22 16:40:09 2020"

module CPU(
	clk,
	seq_reset,
	seq_enable,
	reg_reset,
	ins,
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
input	[31:0] ins;
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

wire	[4:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_41;
wire	[1:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_42;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	[2:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[5:0] SYNTHESIZED_WIRE_43;
wire	[4:0] SYNTHESIZED_WIRE_13;
wire	[4:0] SYNTHESIZED_WIRE_14;
wire	[4:0] SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_32;
wire	[31:0] SYNTHESIZED_WIRE_33;
wire	[4:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;

assign	data_mem_clk = clk;
assign	ins_mem_clk = SYNTHESIZED_WIRE_35;
assign	mem_address = SYNTHESIZED_WIRE_1;
assign	mem_word_in = SYNTHESIZED_WIRE_7;




ALU_controller	b2v_inst(
	.opcode(SYNTHESIZED_WIRE_0),
	.ADD_e(SYNTHESIZED_WIRE_17),
	.SUB_e(SYNTHESIZED_WIRE_18),
	.MUL_e(SYNTHESIZED_WIRE_19),
	.DIV_e(SYNTHESIZED_WIRE_20),
	.MOD_e(SYNTHESIZED_WIRE_21),
	.MAX_e(SYNTHESIZED_WIRE_22),
	.MIN_e(SYNTHESIZED_WIRE_23),
	.NOT_e(SYNTHESIZED_WIRE_24),
	.NAND_e(SYNTHESIZED_WIRE_25),
	.XNOR_e(SYNTHESIZED_WIRE_26),
	.SHL_e(SYNTHESIZED_WIRE_27),
	.SHRL_e(SYNTHESIZED_WIRE_28),
	.ROL_e(SYNTHESIZED_WIRE_29),
	.ROR_e(SYNTHESIZED_WIRE_30),
	.SLT_e(SYNTHESIZED_WIRE_31));


sequencer	b2v_inst1(
	.clk(clk),
	.reset(seq_reset),
	.enable(seq_enable),
	.IF_clk(SYNTHESIZED_WIRE_35),
	.ID_clk(SYNTHESIZED_WIRE_36),
	.ALU_clk(SYNTHESIZED_WIRE_37),
	.MEM_clk(SYNTHESIZED_WIRE_38),
	.BR_clk(SYNTHESIZED_WIRE_42));


write_back	b2v_inst11(
	.alu_out(SYNTHESIZED_WIRE_1),
	.imm(SYNTHESIZED_WIRE_41),
	.mem_out(mem_word_out),
	.select(SYNTHESIZED_WIRE_3),
	.reg_write_data(SYNTHESIZED_WIRE_16));


instruction_decoder	b2v_inst2(
	.ins(ins),
	.imm(SYNTHESIZED_WIRE_41),
	.opcode(SYNTHESIZED_WIRE_43),
	.reg1(SYNTHESIZED_WIRE_13),
	.reg2(SYNTHESIZED_WIRE_14),
	.reg3(SYNTHESIZED_WIRE_15),
	.sr_amount(SYNTHESIZED_WIRE_34));


pc_controller	b2v_inst5(
	.condition_bit(SYNTHESIZED_WIRE_4),
	.clk(SYNTHESIZED_WIRE_42),
	.addr(SYNTHESIZED_WIRE_41),
	.jreg(SYNTHESIZED_WIRE_7),
	.opcode(SYNTHESIZED_WIRE_8),
	.pc_in(pc_in),
	.pc(pc));


register_file	b2v_inst7(
	.reg_read(SYNTHESIZED_WIRE_9),
	.reg_write(SYNTHESIZED_WIRE_10),
	.reg_reset(reg_reset),
	.clk(clk),
	.imm(SYNTHESIZED_WIRE_41),
	.opcode(SYNTHESIZED_WIRE_43),
	.reg1(SYNTHESIZED_WIRE_13),
	.reg2(SYNTHESIZED_WIRE_14),
	.reg3(SYNTHESIZED_WIRE_15),
	.write_data(SYNTHESIZED_WIRE_16),
	.operand0(SYNTHESIZED_WIRE_7),
	.operand1(SYNTHESIZED_WIRE_32),
	.operand2(SYNTHESIZED_WIRE_33));


ALU	b2v_inst8(
	.ADD_e(SYNTHESIZED_WIRE_17),
	.SUB_e(SYNTHESIZED_WIRE_18),
	.MUL_e(SYNTHESIZED_WIRE_19),
	.DIV_e(SYNTHESIZED_WIRE_20),
	.MOD_e(SYNTHESIZED_WIRE_21),
	.MAX_e(SYNTHESIZED_WIRE_22),
	.MIN_e(SYNTHESIZED_WIRE_23),
	.NOT_e(SYNTHESIZED_WIRE_24),
	.NAND_e(SYNTHESIZED_WIRE_25),
	.XNOR_e(SYNTHESIZED_WIRE_26),
	.SHL_e(SYNTHESIZED_WIRE_27),
	.SHRL_e(SYNTHESIZED_WIRE_28),
	.ROL_e(SYNTHESIZED_WIRE_29),
	.ROR_e(SYNTHESIZED_WIRE_30),
	.SLT_e(SYNTHESIZED_WIRE_31),
	.operand1(SYNTHESIZED_WIRE_32),
	.operand2(SYNTHESIZED_WIRE_33),
	.sr_amount(SYNTHESIZED_WIRE_34),
	.zero_less_condition(SYNTHESIZED_WIRE_4),
	.result(SYNTHESIZED_WIRE_1));


CU_logic	b2v_inst9(
	.IF_clk(SYNTHESIZED_WIRE_35),
	.ID_clk(SYNTHESIZED_WIRE_36),
	.ALU_clk(SYNTHESIZED_WIRE_37),
	.MEM_clk(SYNTHESIZED_WIRE_38),
	.RB_BR_clk(SYNTHESIZED_WIRE_42),
	.opcode(SYNTHESIZED_WIRE_43),
	.interrupt(interrupt),
	.reg_read(SYNTHESIZED_WIRE_9),
	.reg_write(SYNTHESIZED_WIRE_10),
	.alu_opcode(SYNTHESIZED_WIRE_0),
	.branch_opcode(SYNTHESIZED_WIRE_8),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.RB_mux_opcode(SYNTHESIZED_WIRE_3));


endmodule
