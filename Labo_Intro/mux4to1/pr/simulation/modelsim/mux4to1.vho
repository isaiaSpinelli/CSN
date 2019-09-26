-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.0.0 Build 595 04/25/2017 SJ Standard Edition"

-- DATE "09/19/2019 17:14:52"

-- 
-- Device: Altera 5M570ZF256C5 Package FBGA256
-- 

-- 
-- This VHDL file should be used for QuestaSim (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	mux4to1 IS
    PORT (
	sel_i : IN std_logic_vector(1 DOWNTO 0);
	a_i : IN std_logic;
	b_i : IN std_logic;
	c_i : IN std_logic;
	d_i : IN std_logic;
	y_o : OUT std_logic
	);
END mux4to1;

-- Design Ports Information


ARCHITECTURE structure OF mux4to1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sel_i : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_a_i : std_logic;
SIGNAL ww_b_i : std_logic;
SIGNAL ww_c_i : std_logic;
SIGNAL ww_d_i : std_logic;
SIGNAL ww_y_o : std_logic;
SIGNAL \d_i~combout\ : std_logic;
SIGNAL \c_i~combout\ : std_logic;
SIGNAL \a_i~combout\ : std_logic;
SIGNAL \b_i~combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \sel_i~combout\ : std_logic_vector(1 DOWNTO 0);

BEGIN

ww_sel_i <= sel_i;
ww_a_i <= a_i;
ww_b_i <= b_i;
ww_c_i <= c_i;
ww_d_i <= d_i;
y_o <= ww_y_o;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_R1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\d_i~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_d_i,
	combout => \d_i~combout\);

-- Location: PIN_K3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sel_i[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_sel_i(1),
	combout => \sel_i~combout\(1));

-- Location: PIN_J5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\c_i~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_c_i,
	combout => \c_i~combout\);

-- Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a_i~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a_i,
	combout => \a_i~combout\);

-- Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b_i~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b_i,
	combout => \b_i~combout\);

-- Location: PIN_K14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sel_i[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_sel_i(0),
	combout => \sel_i~combout\(0));

-- Location: LC_X2_Y5_N2
\Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Mux0~0_combout\ = (\sel_i~combout\(1) & (((\sel_i~combout\(0))))) # (!\sel_i~combout\(1) & ((\sel_i~combout\(0) & ((\b_i~combout\))) # (!\sel_i~combout\(0) & (\a_i~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fc0a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a_i~combout\,
	datab => \b_i~combout\,
	datac => \sel_i~combout\(1),
	datad => \sel_i~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~0_combout\);

-- Location: LC_X2_Y5_N4
\Mux0~1\ : maxv_lcell
-- Equation(s):
-- \Mux0~1_combout\ = (\sel_i~combout\(1) & ((\Mux0~0_combout\ & (\d_i~combout\)) # (!\Mux0~0_combout\ & ((\c_i~combout\))))) # (!\sel_i~combout\(1) & (((\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "bbc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \d_i~combout\,
	datab => \sel_i~combout\(1),
	datac => \c_i~combout\,
	datad => \Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~1_combout\);

-- Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\y_o~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Mux0~1_combout\,
	oe => VCC,
	padio => ww_y_o);
END structure;


