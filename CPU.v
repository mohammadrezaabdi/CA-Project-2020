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
// CREATED ON	"Mon Jul 20 11:57:53 2020"

module CPU(
	clock,
	sequencer_reset,
	registers_reset,
	pc_reset
);


input	clock;
input	sequencer_reset;
input	registers_reset;
input	pc_reset;

wire	SYNTHESIZED_WIRE_0;
wire	[4:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_51;
wire	[31:0] SYNTHESIZED_WIRE_52;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[1:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_53;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[1:0] SYNTHESIZED_WIRE_10;
wire	[1:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_55;
wire	[2:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	[5:0] SYNTHESIZED_WIRE_56;
wire	[4:0] SYNTHESIZED_WIRE_23;
wire	[4:0] SYNTHESIZED_WIRE_24;
wire	[4:0] SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	[31:0] SYNTHESIZED_WIRE_42;
wire	[31:0] SYNTHESIZED_WIRE_43;
wire	[4:0] SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;





ALU_controller	b2v_inst(
	.alu_enable(SYNTHESIZED_WIRE_0),
	.opcode(SYNTHESIZED_WIRE_1),
	.ADD_e(SYNTHESIZED_WIRE_27),
	.SUB_e(SYNTHESIZED_WIRE_28),
	.MUL_e(SYNTHESIZED_WIRE_29),
	.DIV_e(SYNTHESIZED_WIRE_30),
	.MOD_e(SYNTHESIZED_WIRE_31),
	.MAX_e(SYNTHESIZED_WIRE_32),
	.MIN_e(SYNTHESIZED_WIRE_33),
	.NOT_e(SYNTHESIZED_WIRE_34),
	.NAND_e(SYNTHESIZED_WIRE_35),
	.XNOR_e(SYNTHESIZED_WIRE_36),
	.SHL_e(SYNTHESIZED_WIRE_37),
	.SHRL_e(SYNTHESIZED_WIRE_38),
	.ROL_e(SYNTHESIZED_WIRE_39),
	.ROR_e(SYNTHESIZED_WIRE_40),
	.SLT_e(SYNTHESIZED_WIRE_41));


CU_sequencer	b2v_inst10(
	.cpu_clk(clock),
	.reset(sequencer_reset),
	.IF_clk(SYNTHESIZED_WIRE_53),
	.ID_clk(SYNTHESIZED_WIRE_46),
	.ALU_clk(SYNTHESIZED_WIRE_47),
	.MEM_clk(SYNTHESIZED_WIRE_48),
	.BR_clk(SYNTHESIZED_WIRE_55));


write_back	b2v_inst11(
	.alu_out(SYNTHESIZED_WIRE_51),
	.imm(SYNTHESIZED_WIRE_52),
	.mem_out(SYNTHESIZED_WIRE_4),
	.select(SYNTHESIZED_WIRE_5),
	.reg_write_data(SYNTHESIZED_WIRE_26));


instruction_memory	b2v_inst14(
	.clk(SYNTHESIZED_WIRE_53),
	.pc(SYNTHESIZED_WIRE_7),
	.ins(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst14.instructions_size = 256;


instruction_decoder	b2v_inst2(
	.ins(SYNTHESIZED_WIRE_8),
	.imm(SYNTHESIZED_WIRE_52),
	.opcode(SYNTHESIZED_WIRE_56),
	.reg1(SYNTHESIZED_WIRE_23),
	.reg2(SYNTHESIZED_WIRE_24),
	.reg3(SYNTHESIZED_WIRE_25),
	.sr_amount(SYNTHESIZED_WIRE_44));


memory	b2v_inst4(
	.clk(clock),
	.address(SYNTHESIZED_WIRE_51),
	.mem_read(SYNTHESIZED_WIRE_10),
	.mem_write(SYNTHESIZED_WIRE_11),
	.word_in(SYNTHESIZED_WIRE_54),
	.word_out(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst4.word_size = 64;


pc_controller	b2v_inst5(
	.halt(SYNTHESIZED_WIRE_13),
	.condition_bit(SYNTHESIZED_WIRE_14),
	.reset(pc_reset),
	.clk(SYNTHESIZED_WIRE_55),
	.addr(SYNTHESIZED_WIRE_52),
	.jreg(SYNTHESIZED_WIRE_54),
	.opcode(SYNTHESIZED_WIRE_18),
	.pc(SYNTHESIZED_WIRE_7));


register_file	b2v_inst7(
	.reg_read(SYNTHESIZED_WIRE_19),
	.reg_write(SYNTHESIZED_WIRE_20),
	.reg_reset(registers_reset),
	.clk(clock),
	.imm(SYNTHESIZED_WIRE_52),
	.opcode(SYNTHESIZED_WIRE_56),
	.reg1(SYNTHESIZED_WIRE_23),
	.reg2(SYNTHESIZED_WIRE_24),
	.reg3(SYNTHESIZED_WIRE_25),
	.write_data(SYNTHESIZED_WIRE_26),
	.operand0(SYNTHESIZED_WIRE_54),
	.operand1(SYNTHESIZED_WIRE_42),
	.operand2(SYNTHESIZED_WIRE_43));


ALU	b2v_inst8(
	.ADD_e(SYNTHESIZED_WIRE_27),
	.SUB_e(SYNTHESIZED_WIRE_28),
	.MUL_e(SYNTHESIZED_WIRE_29),
	.DIV_e(SYNTHESIZED_WIRE_30),
	.MOD_e(SYNTHESIZED_WIRE_31),
	.MAX_e(SYNTHESIZED_WIRE_32),
	.MIN_e(SYNTHESIZED_WIRE_33),
	.NOT_e(SYNTHESIZED_WIRE_34),
	.NAND_e(SYNTHESIZED_WIRE_35),
	.XNOR_e(SYNTHESIZED_WIRE_36),
	.SHL_e(SYNTHESIZED_WIRE_37),
	.SHRL_e(SYNTHESIZED_WIRE_38),
	.ROL_e(SYNTHESIZED_WIRE_39),
	.ROR_e(SYNTHESIZED_WIRE_40),
	.SLT_e(SYNTHESIZED_WIRE_41),
	.operand1(SYNTHESIZED_WIRE_42),
	.operand2(SYNTHESIZED_WIRE_43),
	.sr_amount(SYNTHESIZED_WIRE_44),
	.zero_less_condition(SYNTHESIZED_WIRE_14),
	.result(SYNTHESIZED_WIRE_51));


CU_logic	b2v_inst9(
	.IF_clk(SYNTHESIZED_WIRE_53),
	.ID_clk(SYNTHESIZED_WIRE_46),
	.ALU_clk(SYNTHESIZED_WIRE_47),
	.MEM_clk(SYNTHESIZED_WIRE_48),
	.RB_BR_clk(SYNTHESIZED_WIRE_55),
	.opcode(SYNTHESIZED_WIRE_56),
	.halt(SYNTHESIZED_WIRE_13),
	.reg_read(SYNTHESIZED_WIRE_19),
	.reg_write(SYNTHESIZED_WIRE_20),
	.alu_enable(SYNTHESIZED_WIRE_0),
	.alu_opcode(SYNTHESIZED_WIRE_1),
	.branch_opcode(SYNTHESIZED_WIRE_18),
	.mem_read(SYNTHESIZED_WIRE_10),
	.mem_write(SYNTHESIZED_WIRE_11),
	.mux_opcode(SYNTHESIZED_WIRE_5));


endmodule
