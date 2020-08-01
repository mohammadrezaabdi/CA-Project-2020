// megafunction wizard: %PARALLEL_ADD%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: parallel_add 

// ============================================================
// File Name: parallel_add0.v
// Megafunction Name(s):
// 			parallel_add
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.0 Build 132 02/25/2009 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module parallel_add0 (
	data0x,
	data1x,
	result);

	input	[31:0]  data0x;
	input	[31:0]  data1x;
	output	[31:0]  result;

	wire [31:0] sub_wire0;
	wire [31:0] sub_wire3 = data1x[31:0];
	wire [31:0] result = sub_wire0[31:0];
	wire [31:0] sub_wire1 = data0x[31:0];
	wire [63:0] sub_wire2 = {sub_wire3, sub_wire1};

	parallel_add	parallel_add_component (
				.data (sub_wire2),
				.result (sub_wire0)
				// synopsys translate_off
				,
				.aclr (),
				.clken (),
				.clock ()
				// synopsys translate_on
				);
	defparam
		parallel_add_component.msw_subtract = "NO",
		parallel_add_component.pipeline = 0,
		parallel_add_component.representation = "UNSIGNED",
		parallel_add_component.result_alignment = "LSB",
		parallel_add_component.shift = 0,
		parallel_add_component.size = 2,
		parallel_add_component.width = 32,
		parallel_add_component.widthr = 32;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: MSW_SUBTRACT STRING "NO"
// Retrieval info: CONSTANT: PIPELINE NUMERIC "0"
// Retrieval info: CONSTANT: REPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: RESULT_ALIGNMENT STRING "LSB"
// Retrieval info: CONSTANT: SHIFT NUMERIC "0"
// Retrieval info: CONSTANT: SIZE NUMERIC "2"
// Retrieval info: CONSTANT: WIDTH NUMERIC "32"
// Retrieval info: CONSTANT: WIDTHR NUMERIC "32"
// Retrieval info: USED_PORT: data0x 0 0 32 0 INPUT NODEFVAL "data0x[31..0]"
// Retrieval info: USED_PORT: data1x 0 0 32 0 INPUT NODEFVAL "data1x[31..0]"
// Retrieval info: USED_PORT: result 0 0 32 0 OUTPUT NODEFVAL "result[31..0]"
// Retrieval info: CONNECT: @data 0 0 32 32 data1x 0 0 32 0
// Retrieval info: CONNECT: @data 0 0 32 0 data0x 0 0 32 0
// Retrieval info: CONNECT: result 0 0 32 0 @result 0 0 32 0
// Retrieval info: GEN_FILE: TYPE_NORMAL parallel_add0.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL parallel_add0.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL parallel_add0.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL parallel_add0.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL parallel_add0_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL parallel_add0_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
