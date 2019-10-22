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

-- DATE "10/03/2019 17:28:55"

-- 
-- Device: Altera 10M02DCU324A6G Package UFBGA324
-- 

-- 
-- This VHDL file should be used for QuestaSim (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_J7,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_J8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_H3,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_H8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	enc_prio_4in IS
    PORT (
	en_i : IN std_logic;
	in0_i : IN std_logic;
	in1_i : IN std_logic;
	in2_i : IN std_logic;
	in3_i : IN std_logic;
	detect_o : OUT std_logic;
	en_o : OUT std_logic;
	num0_o : OUT std_logic;
	num1_o : OUT std_logic
	);
END enc_prio_4in;

-- Design Ports Information
-- detect_o	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en_o	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num0_o	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num1_o	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in2_i	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in3_i	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in0_i	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in1_i	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en_i	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF enc_prio_4in IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_en_i : std_logic;
SIGNAL ww_in0_i : std_logic;
SIGNAL ww_in1_i : std_logic;
SIGNAL ww_in2_i : std_logic;
SIGNAL ww_in3_i : std_logic;
SIGNAL ww_detect_o : std_logic;
SIGNAL ww_en_o : std_logic;
SIGNAL ww_num0_o : std_logic;
SIGNAL ww_num1_o : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \detect_o~output_o\ : std_logic;
SIGNAL \en_o~output_o\ : std_logic;
SIGNAL \num0_o~output_o\ : std_logic;
SIGNAL \num1_o~output_o\ : std_logic;
SIGNAL \in0_i~input_o\ : std_logic;
SIGNAL \in1_i~input_o\ : std_logic;
SIGNAL \en_i~input_o\ : std_logic;
SIGNAL \in3_i~input_o\ : std_logic;
SIGNAL \in2_i~input_o\ : std_logic;
SIGNAL \num_s~0_combout\ : std_logic;
SIGNAL \detect_s~0_combout\ : std_logic;
SIGNAL \en_s~0_combout\ : std_logic;
SIGNAL \num_s~1_combout\ : std_logic;
SIGNAL \ALT_INV_detect_s~0_combout\ : std_logic;
SIGNAL \ALT_INV_num_s~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_en_i <= en_i;
ww_in0_i <= in0_i;
ww_in1_i <= in1_i;
ww_in2_i <= in2_i;
ww_in3_i <= in3_i;
detect_o <= ww_detect_o;
en_o <= ww_en_o;
num0_o <= ww_num0_o;
num1_o <= ww_num1_o;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_detect_s~0_combout\ <= NOT \detect_s~0_combout\;
\ALT_INV_num_s~0_combout\ <= NOT \num_s~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X11_Y8_N0
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X6_Y7_N23
\detect_o~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_detect_s~0_combout\,
	devoe => ww_devoe,
	o => \detect_o~output_o\);

-- Location: IOOBUF_X6_Y0_N16
\en_o~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \en_s~0_combout\,
	devoe => ww_devoe,
	o => \en_o~output_o\);

-- Location: IOOBUF_X1_Y7_N16
\num0_o~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \num_s~1_combout\,
	devoe => ww_devoe,
	o => \num0_o~output_o\);

-- Location: IOOBUF_X1_Y7_N9
\num1_o~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_num_s~0_combout\,
	devoe => ww_devoe,
	o => \num1_o~output_o\);

-- Location: IOIBUF_X6_Y7_N15
\in0_i~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in0_i,
	o => \in0_i~input_o\);

-- Location: IOIBUF_X0_Y4_N1
\in1_i~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in1_i,
	o => \in1_i~input_o\);

-- Location: IOIBUF_X3_Y7_N29
\en_i~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en_i,
	o => \en_i~input_o\);

-- Location: IOIBUF_X1_Y7_N29
\in3_i~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in3_i,
	o => \in3_i~input_o\);

-- Location: IOIBUF_X10_Y12_N1
\in2_i~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in2_i,
	o => \in2_i~input_o\);

-- Location: LCCOMB_X7_Y6_N0
\num_s~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \num_s~0_combout\ = (!\in3_i~input_o\ & !\in2_i~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \in3_i~input_o\,
	datad => \in2_i~input_o\,
	combout => \num_s~0_combout\);

-- Location: LCCOMB_X7_Y6_N10
\detect_s~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \detect_s~0_combout\ = ((!\in0_i~input_o\ & (!\in1_i~input_o\ & \num_s~0_combout\))) # (!\en_i~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in0_i~input_o\,
	datab => \in1_i~input_o\,
	datac => \en_i~input_o\,
	datad => \num_s~0_combout\,
	combout => \detect_s~0_combout\);

-- Location: LCCOMB_X7_Y6_N20
\en_s~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \en_s~0_combout\ = (!\in0_i~input_o\ & (!\in1_i~input_o\ & (\en_i~input_o\ & \num_s~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in0_i~input_o\,
	datab => \in1_i~input_o\,
	datac => \en_i~input_o\,
	datad => \num_s~0_combout\,
	combout => \en_s~0_combout\);

-- Location: LCCOMB_X7_Y6_N14
\num_s~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \num_s~1_combout\ = (\in3_i~input_o\) # ((!\in2_i~input_o\ & \in1_i~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in2_i~input_o\,
	datab => \in1_i~input_o\,
	datad => \in3_i~input_o\,
	combout => \num_s~1_combout\);

-- Location: UNVM_X0_Y8_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

ww_detect_o <= \detect_o~output_o\;

ww_en_o <= \en_o~output_o\;

ww_num0_o <= \num0_o~output_o\;

ww_num1_o <= \num1_o~output_o\;
END structure;


