// megafunction wizard: %LPM_COMPARE%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_compare 

// ============================================================
// File Name: cmp.v
// Megafunction Name(s):
// 			lpm_compare
//
// Simulation Library Files(s):
// 			lpm
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

module cmp (
	dataa,
	datab,
	agb);

	input	[31:0]  dataa;
	input	[31:0]  datab;
	output	  agb;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: AeqB NUMERIC "0"
// Retrieval info: PRIVATE: AgeB NUMERIC "0"
// Retrieval info: PRIVATE: AgtB NUMERIC "1"
// Retrieval info: PRIVATE: AleB NUMERIC "0"
// Retrieval info: PRIVATE: AltB NUMERIC "0"
// Retrieval info: PRIVATE: AneB NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
// Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
// Retrieval info: PRIVATE: Latency NUMERIC "0"
// Retrieval info: PRIVATE: PortBValue NUMERIC "0"
// Retrieval info: PRIVATE: Radix NUMERIC "10"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: SignedCompare NUMERIC "0"
// Retrieval info: PRIVATE: aclr NUMERIC "0"
// Retrieval info: PRIVATE: clken NUMERIC "0"
// Retrieval info: PRIVATE: isPortBConstant NUMERIC "0"
// Retrieval info: PRIVATE: nBit NUMERIC "32"
// Retrieval info: CONSTANT: LPM_REPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_COMPARE"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "32"
// Retrieval info: USED_PORT: AgB 0 0 0 0 OUTPUT NODEFVAL AgB
// Retrieval info: USED_PORT: dataa 0 0 32 0 INPUT NODEFVAL dataa[31..0]
// Retrieval info: USED_PORT: datab 0 0 32 0 INPUT NODEFVAL datab[31..0]
// Retrieval info: CONNECT: AgB 0 0 0 0 @AgB 0 0 0 0
// Retrieval info: CONNECT: @dataa 0 0 32 0 dataa 0 0 32 0
// Retrieval info: CONNECT: @datab 0 0 32 0 datab 0 0 32 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL cmp.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL cmp.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL cmp.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL cmp.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL cmp_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL cmp_bb.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL cmp_waveforms.html TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL cmp_wave*.jpg FALSE
// Retrieval info: LIB_FILE: lpm
