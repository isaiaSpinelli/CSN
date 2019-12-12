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

-- DATE "12/12/2019 17:46:02"

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

ENTITY 	maxv_top IS
    PORT (
	Clk_Gen_i : IN std_logic;
	Clk_Main_i : IN std_logic;
	Con_25p_io : INOUT std_logic_vector(25 DOWNTO 1);
	Con_80p_io : INOUT std_logic_vector(79 DOWNTO 2);
	Mezzanine_io : INOUT std_logic_vector(20 DOWNTO 5);
	Encoder_A_i : IN std_logic;
	Encoder_B_i : IN std_logic;
	nButton_i : IN std_logic_vector(8 DOWNTO 1);
	nReset_i : IN std_logic;
	Switch_i : IN std_logic_vector(7 DOWNTO 0);
	nLed_o : OUT std_logic_vector(7 DOWNTO 0);
	Led_RGB_o : OUT std_logic_vector(2 DOWNTO 0);
	nSeven_Seg_o : OUT std_logic_vector(7 DOWNTO 0)
	);
END maxv_top;

-- Design Ports Information


ARCHITECTURE structure OF maxv_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk_Gen_i : std_logic;
SIGNAL ww_Clk_Main_i : std_logic;
SIGNAL ww_Encoder_A_i : std_logic;
SIGNAL ww_Encoder_B_i : std_logic;
SIGNAL ww_nButton_i : std_logic_vector(8 DOWNTO 1);
SIGNAL ww_nReset_i : std_logic;
SIGNAL ww_Switch_i : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_nLed_o : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Led_RGB_o : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_nSeven_Seg_o : std_logic_vector(7 DOWNTO 0);
SIGNAL \Con_80p_io[2]~2\ : std_logic;
SIGNAL \Con_80p_io[39]~39\ : std_logic;
SIGNAL \Con_80p_io[40]~40\ : std_logic;
SIGNAL \Clk_Main_i~combout\ : std_logic;
SIGNAL \nReset_i~combout\ : std_logic;
SIGNAL \U1|capt_a_i_s~regout\ : std_logic;
SIGNAL \U1|MSS1|Mux4~4_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux4~3_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux4~18_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux4~10_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux4~19_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux4~16_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux4~17_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux4~15_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux4~13_combout\ : std_logic;
SIGNAL \U1|capt_b_i_s~regout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~10_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~9_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~16_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~8_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux5~0_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~6\ : std_logic;
SIGNAL \U1|MSS1|Mux3~7_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux7~0_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux7~4_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux7~3_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux7~5_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux7~2_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux7~6_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux7~1_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~5_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~2_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~3_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~17\ : std_logic;
SIGNAL \U1|MSS1|Mux3~18_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~4_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux6~0_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~13_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~14_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~11_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~12_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux3~15_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux1~0_combout\ : std_logic;
SIGNAL \U1|MSS1|Mux1~1_combout\ : std_logic;
SIGNAL \U1|FLIPFLOP_RS_ERR|Q_pres~0_combout\ : std_logic;
SIGNAL \U1|FLIPFLOP_RS_ERR|Q_pres~regout\ : std_logic;
SIGNAL \Cpt_s[1]~37\ : std_logic;
SIGNAL \Cpt_s[1]~37COUT1_40\ : std_logic;
SIGNAL \Cpt_s[2]~35\ : std_logic;
SIGNAL \Cpt_s[2]~35COUT1_41\ : std_logic;
SIGNAL \Cpt_s[3]~33\ : std_logic;
SIGNAL \Cpt_s[3]~33COUT1_42\ : std_logic;
SIGNAL \Cpt_s[4]~31\ : std_logic;
SIGNAL \Cpt_s[5]~29\ : std_logic;
SIGNAL \Cpt_s[5]~29COUT1_43\ : std_logic;
SIGNAL \Cpt_s[6]~27\ : std_logic;
SIGNAL \Cpt_s[6]~27COUT1_44\ : std_logic;
SIGNAL \Cpt_s[7]~25\ : std_logic;
SIGNAL \Cpt_s[7]~25COUT1_45\ : std_logic;
SIGNAL \Cpt_s[8]~23\ : std_logic;
SIGNAL \Cpt_s[8]~23COUT1_46\ : std_logic;
SIGNAL \Cpt_s[9]~21\ : std_logic;
SIGNAL \Cpt_s[10]~19\ : std_logic;
SIGNAL \Cpt_s[10]~19COUT1_47\ : std_logic;
SIGNAL \Cpt_s[11]~17\ : std_logic;
SIGNAL \Cpt_s[11]~17COUT1_48\ : std_logic;
SIGNAL \Cpt_s[12]~15\ : std_logic;
SIGNAL \Cpt_s[12]~15COUT1_49\ : std_logic;
SIGNAL \Cpt_s[13]~13\ : std_logic;
SIGNAL \Cpt_s[13]~13COUT1_50\ : std_logic;
SIGNAL \Cpt_s[14]~11\ : std_logic;
SIGNAL \Cpt_s[15]~9\ : std_logic;
SIGNAL \Cpt_s[15]~9COUT1_51\ : std_logic;
SIGNAL \Cpt_s[16]~7\ : std_logic;
SIGNAL \Cpt_s[16]~7COUT1_52\ : std_logic;
SIGNAL \Cpt_s[17]~5\ : std_logic;
SIGNAL \Cpt_s[17]~5COUT1_53\ : std_logic;
SIGNAL \Cpt_s[18]~3\ : std_logic;
SIGNAL \Cpt_s[18]~3COUT1_54\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~0_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~0_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|position_next_s[0]~0_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~2\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~2COUT1_81\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~5_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~2\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~2COUT1_81\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~5_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~7\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~7COUT1_82\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~10_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~7\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~7COUT1_82\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~10_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~12\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~15_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~12\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~15_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~17\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~17COUT1_83\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~20_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~17\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~17COUT1_83\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~20_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~22\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~22COUT1_84\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~25_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~22\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~22COUT1_84\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~25_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~27\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~27COUT1_85\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~30_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~27\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~27COUT1_85\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~30_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~32\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~32COUT1_86\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~35_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~32\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~32COUT1_86\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~35_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~37\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~40_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~37\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~40_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~42\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~42COUT1_87\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~45_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~42\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~42COUT1_87\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~45_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~47\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~47COUT1_88\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~50_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~47\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~47COUT1_88\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~50_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~52\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~52COUT1_89\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~55_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~52\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~52COUT1_89\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~55_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~57\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~57COUT1_90\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~60_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~57\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~57COUT1_90\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~60_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~62\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~65_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~62\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~65_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~67\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~67COUT1_91\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~70_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~67\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~67COUT1_91\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~70_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~72\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~72COUT1_92\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add1~75_combout\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~72\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~72COUT1_92\ : std_logic;
SIGNAL \U1|COMPTEUR_POS|Add0~75_combout\ : std_logic;
SIGNAL \Switch_i~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \U1|COMPTEUR_POS|position_s\ : std_logic_vector(15 DOWNTO 0);
SIGNAL Cpt_s : std_logic_vector(19 DOWNTO 0);
SIGNAL \nButton_i~combout\ : std_logic_vector(8 DOWNTO 1);
SIGNAL \U1|MSS1|Etat_Present\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_nReset_i~combout\ : std_logic;
SIGNAL ALT_INV_Cpt_s : std_logic_vector(19 DOWNTO 19);
SIGNAL \ALT_INV_nButton_i~combout\ : std_logic_vector(8 DOWNTO 8);
SIGNAL \U1|FLIPFLOP_RS_ERR|ALT_INV_Q_pres~regout\ : std_logic;
SIGNAL \U1|MSS1|ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \ALT_INV_Con_80p_io[2]~2\ : std_logic;

BEGIN

ww_Clk_Gen_i <= Clk_Gen_i;
ww_Clk_Main_i <= Clk_Main_i;
ww_Encoder_A_i <= Encoder_A_i;
ww_Encoder_B_i <= Encoder_B_i;
ww_nButton_i <= nButton_i;
ww_nReset_i <= nReset_i;
ww_Switch_i <= Switch_i;
nLed_o <= ww_nLed_o;
Led_RGB_o <= ww_Led_RGB_o;
nSeven_Seg_o <= ww_nSeven_Seg_o;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_nReset_i~combout\ <= NOT \nReset_i~combout\;
ALT_INV_Cpt_s(19) <= NOT Cpt_s(19);
\ALT_INV_nButton_i~combout\(8) <= NOT \nButton_i~combout\(8);
\U1|FLIPFLOP_RS_ERR|ALT_INV_Q_pres~regout\ <= NOT \U1|FLIPFLOP_RS_ERR|Q_pres~regout\;
\U1|MSS1|ALT_INV_Mux1~1_combout\ <= NOT \U1|MSS1|Mux1~1_combout\;
\ALT_INV_Con_80p_io[2]~2\ <= NOT \Con_80p_io[2]~2\;

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(2),
	combout => \Con_80p_io[2]~2\);

-- Location: PIN_N15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[39]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(39),
	combout => \Con_80p_io[39]~39\);

-- Location: PIN_N13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[40]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(40),
	combout => \Con_80p_io[40]~40\);

-- Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Clk_Main_i~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Clk_Main_i,
	combout => \Clk_Main_i~combout\);

-- Location: PIN_M9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nReset_i~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_nReset_i,
	combout => \nReset_i~combout\);

-- Location: LC_X5_Y5_N7
\U1|capt_a_i_s\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~6\ = (\U1|MSS1|Etat_Present\(4) & (!\U1|MSS1|Etat_Present\(3) & (\U1|capt_b_i_s~regout\ $ (B1_capt_a_i_s)))) # (!\U1|MSS1|Etat_Present\(4) & (!\U1|capt_b_i_s~regout\ & (B1_capt_a_i_s)))
-- \U1|capt_a_i_s~regout\ = DFFEAS(\U1|MSS1|Mux3~6\, GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , \Con_80p_io[39]~39\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1058",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|MSS1|Etat_Present\(4),
	datac => \Con_80p_io[39]~39\,
	datad => \U1|MSS1|Etat_Present\(3),
	aclr => \ALT_INV_nReset_i~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~6\,
	regout => \U1|capt_a_i_s~regout\);

-- Location: LC_X5_Y6_N4
\U1|MSS1|Mux4~4\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux4~4_combout\ = (\U1|MSS1|Etat_Present\(0) & (!\U1|capt_b_i_s~regout\ & ((\U1|capt_a_i_s~regout\) # (!\U1|MSS1|Etat_Present\(1))))) # (!\U1|MSS1|Etat_Present\(0) & (\U1|capt_b_i_s~regout\ $ (((\U1|MSS1|Etat_Present\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5166",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|MSS1|Etat_Present\(0),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|MSS1|Etat_Present\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux4~4_combout\);

-- Location: LC_X5_Y6_N8
\U1|MSS1|Mux4~3\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux4~3_combout\ = (\U1|MSS1|Etat_Present\(0) & ((\U1|MSS1|Etat_Present\(1) & (\U1|capt_b_i_s~regout\)) # (!\U1|MSS1|Etat_Present\(1) & ((!\U1|capt_a_i_s~regout\))))) # (!\U1|MSS1|Etat_Present\(0) & ((\U1|capt_a_i_s~regout\ $ 
-- (\U1|MSS1|Etat_Present\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8b3c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|MSS1|Etat_Present\(0),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|MSS1|Etat_Present\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux4~3_combout\);

-- Location: LC_X5_Y6_N9
\U1|MSS1|Mux4~18\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux4~18_combout\ = (!\U1|MSS1|Etat_Present\(4) & ((\U1|MSS1|Etat_Present\(2) & (\U1|MSS1|Mux4~4_combout\)) # (!\U1|MSS1|Etat_Present\(2) & ((\U1|MSS1|Mux4~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3120",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(2),
	datab => \U1|MSS1|Etat_Present\(4),
	datac => \U1|MSS1|Mux4~4_combout\,
	datad => \U1|MSS1|Mux4~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux4~18_combout\);

-- Location: LC_X6_Y6_N5
\U1|MSS1|Mux4~10\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux4~10_combout\ = (\U1|MSS1|Etat_Present\(0) & ((\U1|MSS1|Etat_Present\(2) & ((\U1|capt_b_i_s~regout\) # (!\U1|MSS1|Etat_Present\(1)))) # (!\U1|MSS1|Etat_Present\(2) & ((\U1|MSS1|Etat_Present\(1)))))) # (!\U1|MSS1|Etat_Present\(0) & 
-- (\U1|MSS1|Etat_Present\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e6cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Etat_Present\(2),
	datac => \U1|capt_b_i_s~regout\,
	datad => \U1|MSS1|Etat_Present\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux4~10_combout\);

-- Location: LC_X6_Y6_N6
\U1|MSS1|Mux4~19\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux4~19_combout\ = ((\U1|capt_a_i_s~regout\ & ((\U1|MSS1|Etat_Present\(4)) # (\U1|MSS1|Mux4~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|MSS1|Etat_Present\(4),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|MSS1|Mux4~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux4~19_combout\);

-- Location: LC_X6_Y6_N9
\U1|MSS1|Mux4~16\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux4~16_combout\ = (\U1|MSS1|Etat_Present\(0) & ((\U1|MSS1|Etat_Present\(2) & ((!\U1|MSS1|Etat_Present\(4)))) # (!\U1|MSS1|Etat_Present\(2) & (!\U1|MSS1|Etat_Present\(1))))) # (!\U1|MSS1|Etat_Present\(0) & (\U1|MSS1|Etat_Present\(1) & 
-- ((!\U1|MSS1|Etat_Present\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "02e6",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Etat_Present\(1),
	datac => \U1|MSS1|Etat_Present\(2),
	datad => \U1|MSS1|Etat_Present\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux4~16_combout\);

-- Location: LC_X6_Y6_N4
\U1|MSS1|Mux4~17\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux4~17_combout\ = (\U1|MSS1|Etat_Present\(2)) # ((\U1|MSS1|Etat_Present\(1) & ((\U1|MSS1|Etat_Present\(0)) # (\U1|MSS1|Etat_Present\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fcec",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Etat_Present\(2),
	datac => \U1|MSS1|Etat_Present\(1),
	datad => \U1|MSS1|Etat_Present\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux4~17_combout\);

-- Location: LC_X6_Y6_N7
\U1|MSS1|Mux4~15\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux4~15_combout\ = (\U1|MSS1|Etat_Present\(1) & (\U1|MSS1|Etat_Present\(0) & ((!\U1|MSS1|Etat_Present\(4))))) # (!\U1|MSS1|Etat_Present\(1) & ((\U1|MSS1|Etat_Present\(2) & (!\U1|MSS1|Etat_Present\(0) & !\U1|MSS1|Etat_Present\(4))) # 
-- (!\U1|MSS1|Etat_Present\(2) & ((\U1|MSS1|Etat_Present\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "03a4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Etat_Present\(2),
	datac => \U1|MSS1|Etat_Present\(1),
	datad => \U1|MSS1|Etat_Present\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux4~15_combout\);

-- Location: LC_X6_Y6_N8
\U1|MSS1|Mux4~13\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux4~13_combout\ = (\U1|MSS1|Mux4~17_combout\ & (((!\U1|MSS1|Mux4~15_combout\)) # (!\U1|capt_b_i_s~regout\))) # (!\U1|MSS1|Mux4~17_combout\ & (\U1|capt_b_i_s~regout\ $ (((\U1|MSS1|Mux4~16_combout\ & \U1|MSS1|Mux4~15_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "56fa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|MSS1|Mux4~16_combout\,
	datac => \U1|MSS1|Mux4~17_combout\,
	datad => \U1|MSS1|Mux4~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux4~13_combout\);

-- Location: LC_X6_Y6_N0
\U1|MSS1|Etat_Present[3]\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Etat_Present\(3) = DFFEAS((\U1|MSS1|Etat_Present\(3) & (\U1|MSS1|Mux4~18_combout\)) # (!\U1|MSS1|Etat_Present\(3) & ((\U1|MSS1|Mux4~19_combout\ & ((!\U1|MSS1|Mux4~13_combout\))) # (!\U1|MSS1|Mux4~19_combout\ & (\U1|MSS1|Mux4~18_combout\ & 
-- \U1|MSS1|Mux4~13_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ab8",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|MSS1|Mux4~18_combout\,
	datab => \U1|MSS1|Etat_Present\(3),
	datac => \U1|MSS1|Mux4~19_combout\,
	datad => \U1|MSS1|Mux4~13_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|MSS1|Etat_Present\(3));

-- Location: LC_X5_Y5_N6
\U1|capt_b_i_s\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~17\ = (\U1|MSS1|Etat_Present\(4) & (!\U1|MSS1|Etat_Present\(2) & (B1_capt_b_i_s & !\U1|MSS1|Etat_Present\(3)))) # (!\U1|MSS1|Etat_Present\(4) & (B1_capt_b_i_s $ (((!\U1|MSS1|Etat_Present\(2) & !\U1|MSS1|Etat_Present\(3))))))
-- \U1|capt_b_i_s~regout\ = DFFEAS(\U1|MSS1|Mux3~17\, GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , \Con_80p_io[40]~40\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5061",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "qfbk",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|MSS1|Etat_Present\(4),
	datab => \U1|MSS1|Etat_Present\(2),
	datac => \Con_80p_io[40]~40\,
	datad => \U1|MSS1|Etat_Present\(3),
	aclr => \ALT_INV_nReset_i~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~17\,
	regout => \U1|capt_b_i_s~regout\);

-- Location: LC_X5_Y5_N2
\U1|MSS1|Mux3~10\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~10_combout\ = (!\U1|MSS1|Etat_Present\(4) & ((\U1|capt_b_i_s~regout\ & ((!\U1|MSS1|Etat_Present\(2)))) # (!\U1|capt_b_i_s~regout\ & (\U1|capt_a_i_s~regout\ & \U1|MSS1|Etat_Present\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1022",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|MSS1|Etat_Present\(4),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|MSS1|Etat_Present\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~10_combout\);

-- Location: LC_X5_Y5_N1
\U1|MSS1|Mux3~9\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~9_combout\ = (\U1|capt_b_i_s~regout\ & (!\U1|capt_a_i_s~regout\ & (!\U1|MSS1|Etat_Present\(4) & !\U1|MSS1|Etat_Present\(3)))) # (!\U1|capt_b_i_s~regout\ & (\U1|capt_a_i_s~regout\ & ((!\U1|MSS1|Etat_Present\(3)) # 
-- (!\U1|MSS1|Etat_Present\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0446",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|capt_a_i_s~regout\,
	datac => \U1|MSS1|Etat_Present\(4),
	datad => \U1|MSS1|Etat_Present\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~9_combout\);

-- Location: LC_X5_Y5_N4
\U1|MSS1|Mux3~16\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~16_combout\ = (\U1|MSS1|Etat_Present\(2) & (\U1|capt_b_i_s~regout\ & (!\U1|MSS1|Etat_Present\(4)))) # (!\U1|MSS1|Etat_Present\(2) & (((\U1|MSS1|Mux3~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3b08",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|MSS1|Etat_Present\(2),
	datac => \U1|MSS1|Etat_Present\(4),
	datad => \U1|MSS1|Mux3~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~16_combout\);

-- Location: LC_X5_Y5_N3
\U1|MSS1|Mux3~8\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~8_combout\ = (\U1|capt_a_i_s~regout\ & (!\U1|MSS1|Etat_Present\(4) & ((\U1|MSS1|Etat_Present\(2)) # (!\U1|capt_b_i_s~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00d0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|MSS1|Etat_Present\(2),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|MSS1|Etat_Present\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~8_combout\);

-- Location: LC_X5_Y5_N5
\U1|MSS1|Mux5~0\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux5~0_combout\ = (\U1|MSS1|Etat_Present\(0) & (\U1|MSS1|Etat_Present\(1))) # (!\U1|MSS1|Etat_Present\(0) & ((\U1|MSS1|Etat_Present\(1) & ((\U1|MSS1|Mux3~8_combout\))) # (!\U1|MSS1|Etat_Present\(1) & (\U1|MSS1|Mux3~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dc98",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Etat_Present\(1),
	datac => \U1|MSS1|Mux3~16_combout\,
	datad => \U1|MSS1|Mux3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux5~0_combout\);

-- Location: LC_X5_Y5_N8
\U1|MSS1|Mux3~7\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~7_combout\ = (\U1|MSS1|Etat_Present\(2) & (\U1|capt_a_i_s~regout\ & ((!\U1|MSS1|Etat_Present\(4))))) # (!\U1|MSS1|Etat_Present\(2) & (((\U1|MSS1|Mux3~6\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "30b8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_a_i_s~regout\,
	datab => \U1|MSS1|Etat_Present\(2),
	datac => \U1|MSS1|Mux3~6\,
	datad => \U1|MSS1|Etat_Present\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~7_combout\);

-- Location: LC_X5_Y5_N9
\U1|MSS1|Etat_Present[2]\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Etat_Present\(2) = DFFEAS((\U1|MSS1|Etat_Present\(0) & ((\U1|MSS1|Mux5~0_combout\ & (\U1|MSS1|Mux3~10_combout\)) # (!\U1|MSS1|Mux5~0_combout\ & ((\U1|MSS1|Mux3~7_combout\))))) # (!\U1|MSS1|Etat_Present\(0) & (((\U1|MSS1|Mux5~0_combout\)))), 
-- GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dad0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Mux3~10_combout\,
	datac => \U1|MSS1|Mux5~0_combout\,
	datad => \U1|MSS1|Mux3~7_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|MSS1|Etat_Present\(2));

-- Location: LC_X5_Y7_N3
\U1|MSS1|Mux7~0\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux7~0_combout\ = ((\U1|MSS1|Etat_Present\(4) & (!\U1|MSS1|Etat_Present\(2) & !\U1|MSS1|Etat_Present\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|MSS1|Etat_Present\(4),
	datac => \U1|MSS1|Etat_Present\(2),
	datad => \U1|MSS1|Etat_Present\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux7~0_combout\);

-- Location: LC_X5_Y6_N2
\U1|MSS1|Mux7~4\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux7~4_combout\ = (\U1|MSS1|Etat_Present\(0) & ((\U1|capt_a_i_s~regout\) # (\U1|capt_b_i_s~regout\ $ (\U1|MSS1|Etat_Present\(1))))) # (!\U1|MSS1|Etat_Present\(0) & (\U1|MSS1|Etat_Present\(1) & ((\U1|capt_b_i_s~regout\) # 
-- (\U1|capt_a_i_s~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f6c8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|MSS1|Etat_Present\(0),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|MSS1|Etat_Present\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux7~4_combout\);

-- Location: LC_X5_Y6_N1
\U1|MSS1|Mux7~3\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux7~3_combout\ = (\U1|MSS1|Etat_Present\(0) & ((\U1|capt_a_i_s~regout\) # (\U1|MSS1|Etat_Present\(1) $ (\U1|capt_b_i_s~regout\)))) # (!\U1|MSS1|Etat_Present\(0) & ((\U1|MSS1|Etat_Present\(1) & ((\U1|capt_a_i_s~regout\) # 
-- (\U1|capt_b_i_s~regout\))) # (!\U1|MSS1|Etat_Present\(1) & ((!\U1|capt_b_i_s~regout\) # (!\U1|capt_a_i_s~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e7f9",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Etat_Present\(1),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|capt_b_i_s~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux7~3_combout\);

-- Location: LC_X5_Y6_N5
\U1|MSS1|Mux7~5\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux7~5_combout\ = (\U1|MSS1|Etat_Present\(2) & (\U1|MSS1|Etat_Present\(3))) # (!\U1|MSS1|Etat_Present\(2) & ((\U1|MSS1|Etat_Present\(3) & ((\U1|MSS1|Mux7~3_combout\))) # (!\U1|MSS1|Etat_Present\(3) & (\U1|MSS1|Mux7~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dc98",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(2),
	datab => \U1|MSS1|Etat_Present\(3),
	datac => \U1|MSS1|Mux7~4_combout\,
	datad => \U1|MSS1|Mux7~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux7~5_combout\);

-- Location: LC_X5_Y6_N6
\U1|MSS1|Mux7~2\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux7~2_combout\ = (\U1|capt_b_i_s~regout\ & ((\U1|capt_a_i_s~regout\ & ((!\U1|MSS1|Etat_Present\(1)) # (!\U1|MSS1|Etat_Present\(0)))) # (!\U1|capt_a_i_s~regout\ & ((\U1|MSS1|Etat_Present\(0)) # (\U1|MSS1|Etat_Present\(1)))))) # 
-- (!\U1|capt_b_i_s~regout\ & ((\U1|MSS1|Etat_Present\(0) $ (!\U1|MSS1|Etat_Present\(1))) # (!\U1|capt_a_i_s~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7bbd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|capt_a_i_s~regout\,
	datac => \U1|MSS1|Etat_Present\(0),
	datad => \U1|MSS1|Etat_Present\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux7~2_combout\);

-- Location: LC_X5_Y6_N7
\U1|MSS1|Mux7~6\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux7~6_combout\ = (\U1|MSS1|Etat_Present\(2) & (((\U1|MSS1|Mux7~2_combout\)))) # (!\U1|MSS1|Etat_Present\(2) & (((\U1|MSS1|Mux7~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fa50",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(2),
	datac => \U1|MSS1|Mux7~5_combout\,
	datad => \U1|MSS1|Mux7~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux7~6_combout\);

-- Location: LC_X5_Y6_N3
\U1|MSS1|Mux7~1\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux7~1_combout\ = (!\U1|MSS1|Etat_Present\(0) & (!\U1|MSS1|Etat_Present\(1) & ((!\U1|capt_a_i_s~regout\) # (!\U1|capt_b_i_s~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0007",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|capt_a_i_s~regout\,
	datac => \U1|MSS1|Etat_Present\(0),
	datad => \U1|MSS1|Etat_Present\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux7~1_combout\);

-- Location: LC_X5_Y6_N0
\U1|MSS1|Etat_Present[0]\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Etat_Present\(0) = DFFEAS((\U1|MSS1|Mux7~0_combout\ & ((\U1|MSS1|Mux7~1_combout\) # ((!\U1|MSS1|Etat_Present\(4) & \U1|MSS1|Mux7~6_combout\)))) # (!\U1|MSS1|Mux7~0_combout\ & (!\U1|MSS1|Etat_Present\(4) & (\U1|MSS1|Mux7~6_combout\))), 
-- GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ba30",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|MSS1|Mux7~0_combout\,
	datab => \U1|MSS1|Etat_Present\(4),
	datac => \U1|MSS1|Mux7~6_combout\,
	datad => \U1|MSS1|Mux7~1_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|MSS1|Etat_Present\(0));

-- Location: LC_X5_Y7_N9
\U1|MSS1|Mux3~5\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~5_combout\ = (!\U1|MSS1|Etat_Present\(4) & (\U1|capt_b_i_s~regout\ & (\U1|MSS1|Etat_Present\(2) $ (\U1|capt_a_i_s~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1200",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(2),
	datab => \U1|MSS1|Etat_Present\(4),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|capt_b_i_s~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~5_combout\);

-- Location: LC_X6_Y7_N8
\U1|MSS1|Mux3~2\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~2_combout\ = (((\U1|MSS1|Etat_Present\(3)) # (\U1|capt_b_i_s~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1|MSS1|Etat_Present\(3),
	datad => \U1|capt_b_i_s~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~2_combout\);

-- Location: LC_X6_Y7_N9
\U1|MSS1|Mux3~3\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~3_combout\ = (\U1|MSS1|Etat_Present\(4) & (((!\U1|MSS1|Etat_Present\(2) & !\U1|MSS1|Mux3~2_combout\)))) # (!\U1|MSS1|Etat_Present\(4) & (\U1|capt_a_i_s~regout\ $ ((!\U1|MSS1|Etat_Present\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "414b",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(4),
	datab => \U1|capt_a_i_s~regout\,
	datac => \U1|MSS1|Etat_Present\(2),
	datad => \U1|MSS1|Mux3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~3_combout\);

-- Location: LC_X5_Y7_N5
\U1|MSS1|Mux3~18\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~18_combout\ = (\U1|MSS1|Mux3~17\ & (\U1|MSS1|Etat_Present\(2) $ (((!\U1|capt_a_i_s~regout\) # (!\U1|capt_b_i_s~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9300",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|MSS1|Etat_Present\(2),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|MSS1|Mux3~17\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~18_combout\);

-- Location: LC_X5_Y7_N8
\U1|MSS1|Mux3~4\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~4_combout\ = ((\U1|MSS1|Etat_Present\(4)) # (\U1|capt_a_i_s~regout\ $ (\U1|MSS1|Etat_Present\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cffc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|MSS1|Etat_Present\(4),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|MSS1|Etat_Present\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~4_combout\);

-- Location: LC_X5_Y7_N1
\U1|MSS1|Mux6~0\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux6~0_combout\ = (\U1|MSS1|Etat_Present\(0) & (\U1|MSS1|Etat_Present\(1))) # (!\U1|MSS1|Etat_Present\(0) & ((\U1|MSS1|Etat_Present\(1) & ((!\U1|MSS1|Mux3~4_combout\))) # (!\U1|MSS1|Etat_Present\(1) & (\U1|MSS1|Mux3~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "98dc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Etat_Present\(1),
	datac => \U1|MSS1|Mux3~18_combout\,
	datad => \U1|MSS1|Mux3~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux6~0_combout\);

-- Location: LC_X5_Y7_N6
\U1|MSS1|Etat_Present[1]\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Etat_Present\(1) = DFFEAS((\U1|MSS1|Etat_Present\(0) & ((\U1|MSS1|Mux6~0_combout\ & (\U1|MSS1|Mux3~5_combout\)) # (!\U1|MSS1|Mux6~0_combout\ & ((\U1|MSS1|Mux3~3_combout\))))) # (!\U1|MSS1|Etat_Present\(0) & (((\U1|MSS1|Mux6~0_combout\)))), 
-- GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dda0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Mux3~5_combout\,
	datac => \U1|MSS1|Mux3~3_combout\,
	datad => \U1|MSS1|Mux6~0_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|MSS1|Etat_Present\(1));

-- Location: LC_X6_Y7_N3
\U1|MSS1|Mux3~13\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~13_combout\ = (\U1|capt_b_i_s~regout\ & (\U1|MSS1|Etat_Present\(3) & (\U1|capt_a_i_s~regout\ & \U1|MSS1|Etat_Present\(2)))) # (!\U1|capt_b_i_s~regout\ & ((\U1|capt_a_i_s~regout\ $ (\U1|MSS1|Etat_Present\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "803c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(3),
	datab => \U1|capt_a_i_s~regout\,
	datac => \U1|MSS1|Etat_Present\(2),
	datad => \U1|capt_b_i_s~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~13_combout\);

-- Location: LC_X6_Y7_N4
\U1|MSS1|Mux3~14\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~14_combout\ = (!\U1|MSS1|Etat_Present\(4) & (((\U1|MSS1|Mux3~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5500",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(4),
	datad => \U1|MSS1|Mux3~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~14_combout\);

-- Location: LC_X5_Y7_N7
\U1|MSS1|Mux3~11\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~11_combout\ = (!\U1|MSS1|Etat_Present\(4) & ((\U1|capt_a_i_s~regout\ & ((\U1|MSS1|Etat_Present\(2)))) # (!\U1|capt_a_i_s~regout\ & (\U1|MSS1|Etat_Present\(3) & !\U1|MSS1|Etat_Present\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(3),
	datab => \U1|MSS1|Etat_Present\(4),
	datac => \U1|capt_a_i_s~regout\,
	datad => \U1|MSS1|Etat_Present\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~11_combout\);

-- Location: LC_X5_Y7_N2
\U1|MSS1|Mux3~12\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~12_combout\ = (\U1|capt_b_i_s~regout\ & (\U1|capt_a_i_s~regout\ & ((\U1|MSS1|Mux7~0_combout\)))) # (!\U1|capt_b_i_s~regout\ & ((\U1|MSS1|Mux3~11_combout\) # ((!\U1|capt_a_i_s~regout\ & \U1|MSS1|Mux7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d950",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|capt_b_i_s~regout\,
	datab => \U1|capt_a_i_s~regout\,
	datac => \U1|MSS1|Mux3~11_combout\,
	datad => \U1|MSS1|Mux7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~12_combout\);

-- Location: LC_X5_Y7_N4
\U1|MSS1|Mux3~15\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux3~15_combout\ = ((\U1|MSS1|Etat_Present\(1) $ (\U1|MSS1|Etat_Present\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1|MSS1|Etat_Present\(1),
	datad => \U1|MSS1|Etat_Present\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux3~15_combout\);

-- Location: LC_X5_Y7_N0
\U1|MSS1|Etat_Present[4]\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Etat_Present\(4) = DFFEAS((\U1|MSS1|Etat_Present\(1) & (\U1|MSS1|Mux3~14_combout\)) # (!\U1|MSS1|Etat_Present\(1) & (((\U1|MSS1|Mux3~12_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , \U1|MSS1|Mux3~5_combout\, , , 
-- \U1|MSS1|Mux3~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "dd88",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|MSS1|Etat_Present\(1),
	datab => \U1|MSS1|Mux3~14_combout\,
	datac => \U1|MSS1|Mux3~5_combout\,
	datad => \U1|MSS1|Mux3~12_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sload => \U1|MSS1|Mux3~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|MSS1|Etat_Present\(4));

-- Location: LC_X6_Y6_N2
\U1|MSS1|Mux1~0\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux1~0_combout\ = \U1|MSS1|Etat_Present\(3) $ (((\U1|MSS1|Etat_Present\(0)) # ((\U1|MSS1|Etat_Present\(2)) # (\U1|MSS1|Etat_Present\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3336",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(0),
	datab => \U1|MSS1|Etat_Present\(3),
	datac => \U1|MSS1|Etat_Present\(2),
	datad => \U1|MSS1|Etat_Present\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux1~0_combout\);

-- Location: LC_X6_Y6_N3
\U1|MSS1|Mux1~1\ : maxv_lcell
-- Equation(s):
-- \U1|MSS1|Mux1~1_combout\ = ((!\U1|MSS1|Etat_Present\(4) & ((\U1|MSS1|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3300",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|MSS1|Etat_Present\(4),
	datad => \U1|MSS1|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|MSS1|Mux1~1_combout\);

-- Location: LC_X6_Y7_N0
\U1|FLIPFLOP_RS_ERR|Q_pres~0\ : maxv_lcell
-- Equation(s):
-- \U1|FLIPFLOP_RS_ERR|Q_pres~0_combout\ = (\U1|MSS1|Etat_Present\(4) & (!\U1|MSS1|Etat_Present\(2) & (!\U1|MSS1|Etat_Present\(1) & !\U1|MSS1|Etat_Present\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(4),
	datab => \U1|MSS1|Etat_Present\(2),
	datac => \U1|MSS1|Etat_Present\(1),
	datad => \U1|MSS1|Etat_Present\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|FLIPFLOP_RS_ERR|Q_pres~0_combout\);

-- Location: LC_X6_Y7_N2
\U1|FLIPFLOP_RS_ERR|Q_pres\ : maxv_lcell
-- Equation(s):
-- \U1|FLIPFLOP_RS_ERR|Q_pres~regout\ = DFFEAS((!\Con_80p_io[2]~2\ & ((\U1|FLIPFLOP_RS_ERR|Q_pres~regout\) # ((\U1|FLIPFLOP_RS_ERR|Q_pres~0_combout\ & \U1|MSS1|Etat_Present\(0))))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3222",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|FLIPFLOP_RS_ERR|Q_pres~regout\,
	datab => \Con_80p_io[2]~2\,
	datac => \U1|FLIPFLOP_RS_ERR|Q_pres~0_combout\,
	datad => \U1|MSS1|Etat_Present\(0),
	aclr => \ALT_INV_nReset_i~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|FLIPFLOP_RS_ERR|Q_pres~regout\);

-- Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nButton_i[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_nButton_i(8),
	combout => \nButton_i~combout\(8));

-- Location: LC_X1_Y4_N0
\Cpt_s[0]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(0) = DFFEAS((((!Cpt_s(0)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datac => Cpt_s(0),
	aclr => \ALT_INV_nReset_i~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(0));

-- Location: LC_X1_Y4_N1
\Cpt_s[1]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(1) = DFFEAS(Cpt_s(0) $ ((Cpt_s(1))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[1]~37\ = CARRY((Cpt_s(0) & (Cpt_s(1))))
-- \Cpt_s[1]~37COUT1_40\ = CARRY((Cpt_s(0) & (Cpt_s(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "6688",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(0),
	datab => Cpt_s(1),
	aclr => \ALT_INV_nReset_i~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(1),
	cout0 => \Cpt_s[1]~37\,
	cout1 => \Cpt_s[1]~37COUT1_40\);

-- Location: LC_X1_Y4_N2
\Cpt_s[2]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(2) = DFFEAS((Cpt_s(2) $ ((\Cpt_s[1]~37\))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[2]~35\ = CARRY(((!\Cpt_s[1]~37\) # (!Cpt_s(2))))
-- \Cpt_s[2]~35COUT1_41\ = CARRY(((!\Cpt_s[1]~37COUT1_40\) # (!Cpt_s(2))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => Cpt_s(2),
	aclr => \ALT_INV_nReset_i~combout\,
	cin0 => \Cpt_s[1]~37\,
	cin1 => \Cpt_s[1]~37COUT1_40\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(2),
	cout0 => \Cpt_s[2]~35\,
	cout1 => \Cpt_s[2]~35COUT1_41\);

-- Location: LC_X1_Y4_N3
\Cpt_s[3]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(3) = DFFEAS(Cpt_s(3) $ ((((!\Cpt_s[2]~35\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[3]~33\ = CARRY((Cpt_s(3) & ((!\Cpt_s[2]~35\))))
-- \Cpt_s[3]~33COUT1_42\ = CARRY((Cpt_s(3) & ((!\Cpt_s[2]~35COUT1_41\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(3),
	aclr => \ALT_INV_nReset_i~combout\,
	cin0 => \Cpt_s[2]~35\,
	cin1 => \Cpt_s[2]~35COUT1_41\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(3),
	cout0 => \Cpt_s[3]~33\,
	cout1 => \Cpt_s[3]~33COUT1_42\);

-- Location: LC_X1_Y4_N4
\Cpt_s[4]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(4) = DFFEAS(Cpt_s(4) $ ((((\Cpt_s[3]~33\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[4]~31\ = CARRY(((!\Cpt_s[3]~33COUT1_42\)) # (!Cpt_s(4)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(4),
	aclr => \ALT_INV_nReset_i~combout\,
	cin0 => \Cpt_s[3]~33\,
	cin1 => \Cpt_s[3]~33COUT1_42\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(4),
	cout => \Cpt_s[4]~31\);

-- Location: LC_X1_Y4_N5
\Cpt_s[5]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(5) = DFFEAS(Cpt_s(5) $ ((((!\Cpt_s[4]~31\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[5]~29\ = CARRY((Cpt_s(5) & ((!\Cpt_s[4]~31\))))
-- \Cpt_s[5]~29COUT1_43\ = CARRY((Cpt_s(5) & ((!\Cpt_s[4]~31\))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(5),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[4]~31\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(5),
	cout0 => \Cpt_s[5]~29\,
	cout1 => \Cpt_s[5]~29COUT1_43\);

-- Location: LC_X1_Y4_N6
\Cpt_s[6]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(6) = DFFEAS(Cpt_s(6) $ (((((!\Cpt_s[4]~31\ & \Cpt_s[5]~29\) # (\Cpt_s[4]~31\ & \Cpt_s[5]~29COUT1_43\))))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[6]~27\ = CARRY(((!\Cpt_s[5]~29\)) # (!Cpt_s(6)))
-- \Cpt_s[6]~27COUT1_44\ = CARRY(((!\Cpt_s[5]~29COUT1_43\)) # (!Cpt_s(6)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(6),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[4]~31\,
	cin0 => \Cpt_s[5]~29\,
	cin1 => \Cpt_s[5]~29COUT1_43\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(6),
	cout0 => \Cpt_s[6]~27\,
	cout1 => \Cpt_s[6]~27COUT1_44\);

-- Location: LC_X1_Y4_N7
\Cpt_s[7]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(7) = DFFEAS((Cpt_s(7) $ ((!(!\Cpt_s[4]~31\ & \Cpt_s[6]~27\) # (\Cpt_s[4]~31\ & \Cpt_s[6]~27COUT1_44\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[7]~25\ = CARRY(((Cpt_s(7) & !\Cpt_s[6]~27\)))
-- \Cpt_s[7]~25COUT1_45\ = CARRY(((Cpt_s(7) & !\Cpt_s[6]~27COUT1_44\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => Cpt_s(7),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[4]~31\,
	cin0 => \Cpt_s[6]~27\,
	cin1 => \Cpt_s[6]~27COUT1_44\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(7),
	cout0 => \Cpt_s[7]~25\,
	cout1 => \Cpt_s[7]~25COUT1_45\);

-- Location: LC_X1_Y4_N8
\Cpt_s[8]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(8) = DFFEAS(Cpt_s(8) $ (((((!\Cpt_s[4]~31\ & \Cpt_s[7]~25\) # (\Cpt_s[4]~31\ & \Cpt_s[7]~25COUT1_45\))))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[8]~23\ = CARRY(((!\Cpt_s[7]~25\)) # (!Cpt_s(8)))
-- \Cpt_s[8]~23COUT1_46\ = CARRY(((!\Cpt_s[7]~25COUT1_45\)) # (!Cpt_s(8)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(8),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[4]~31\,
	cin0 => \Cpt_s[7]~25\,
	cin1 => \Cpt_s[7]~25COUT1_45\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(8),
	cout0 => \Cpt_s[8]~23\,
	cout1 => \Cpt_s[8]~23COUT1_46\);

-- Location: LC_X1_Y4_N9
\Cpt_s[9]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(9) = DFFEAS((Cpt_s(9) $ ((!(!\Cpt_s[4]~31\ & \Cpt_s[8]~23\) # (\Cpt_s[4]~31\ & \Cpt_s[8]~23COUT1_46\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[9]~21\ = CARRY(((Cpt_s(9) & !\Cpt_s[8]~23COUT1_46\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => Cpt_s(9),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[4]~31\,
	cin0 => \Cpt_s[8]~23\,
	cin1 => \Cpt_s[8]~23COUT1_46\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(9),
	cout => \Cpt_s[9]~21\);

-- Location: LC_X2_Y4_N0
\Cpt_s[10]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(10) = DFFEAS((Cpt_s(10) $ ((\Cpt_s[9]~21\))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[10]~19\ = CARRY(((!\Cpt_s[9]~21\) # (!Cpt_s(10))))
-- \Cpt_s[10]~19COUT1_47\ = CARRY(((!\Cpt_s[9]~21\) # (!Cpt_s(10))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => Cpt_s(10),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[9]~21\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(10),
	cout0 => \Cpt_s[10]~19\,
	cout1 => \Cpt_s[10]~19COUT1_47\);

-- Location: LC_X2_Y4_N1
\Cpt_s[11]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(11) = DFFEAS((Cpt_s(11) $ ((!(!\Cpt_s[9]~21\ & \Cpt_s[10]~19\) # (\Cpt_s[9]~21\ & \Cpt_s[10]~19COUT1_47\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[11]~17\ = CARRY(((Cpt_s(11) & !\Cpt_s[10]~19\)))
-- \Cpt_s[11]~17COUT1_48\ = CARRY(((Cpt_s(11) & !\Cpt_s[10]~19COUT1_47\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => Cpt_s(11),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[9]~21\,
	cin0 => \Cpt_s[10]~19\,
	cin1 => \Cpt_s[10]~19COUT1_47\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(11),
	cout0 => \Cpt_s[11]~17\,
	cout1 => \Cpt_s[11]~17COUT1_48\);

-- Location: LC_X2_Y4_N2
\Cpt_s[12]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(12) = DFFEAS((Cpt_s(12) $ (((!\Cpt_s[9]~21\ & \Cpt_s[11]~17\) # (\Cpt_s[9]~21\ & \Cpt_s[11]~17COUT1_48\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[12]~15\ = CARRY(((!\Cpt_s[11]~17\) # (!Cpt_s(12))))
-- \Cpt_s[12]~15COUT1_49\ = CARRY(((!\Cpt_s[11]~17COUT1_48\) # (!Cpt_s(12))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => Cpt_s(12),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[9]~21\,
	cin0 => \Cpt_s[11]~17\,
	cin1 => \Cpt_s[11]~17COUT1_48\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(12),
	cout0 => \Cpt_s[12]~15\,
	cout1 => \Cpt_s[12]~15COUT1_49\);

-- Location: LC_X2_Y4_N3
\Cpt_s[13]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(13) = DFFEAS(Cpt_s(13) $ ((((!(!\Cpt_s[9]~21\ & \Cpt_s[12]~15\) # (\Cpt_s[9]~21\ & \Cpt_s[12]~15COUT1_49\))))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[13]~13\ = CARRY((Cpt_s(13) & ((!\Cpt_s[12]~15\))))
-- \Cpt_s[13]~13COUT1_50\ = CARRY((Cpt_s(13) & ((!\Cpt_s[12]~15COUT1_49\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(13),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[9]~21\,
	cin0 => \Cpt_s[12]~15\,
	cin1 => \Cpt_s[12]~15COUT1_49\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(13),
	cout0 => \Cpt_s[13]~13\,
	cout1 => \Cpt_s[13]~13COUT1_50\);

-- Location: LC_X2_Y4_N4
\Cpt_s[14]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(14) = DFFEAS(Cpt_s(14) $ (((((!\Cpt_s[9]~21\ & \Cpt_s[13]~13\) # (\Cpt_s[9]~21\ & \Cpt_s[13]~13COUT1_50\))))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[14]~11\ = CARRY(((!\Cpt_s[13]~13COUT1_50\)) # (!Cpt_s(14)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(14),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[9]~21\,
	cin0 => \Cpt_s[13]~13\,
	cin1 => \Cpt_s[13]~13COUT1_50\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(14),
	cout => \Cpt_s[14]~11\);

-- Location: LC_X2_Y4_N5
\Cpt_s[15]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(15) = DFFEAS(Cpt_s(15) $ ((((!\Cpt_s[14]~11\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[15]~9\ = CARRY((Cpt_s(15) & ((!\Cpt_s[14]~11\))))
-- \Cpt_s[15]~9COUT1_51\ = CARRY((Cpt_s(15) & ((!\Cpt_s[14]~11\))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(15),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[14]~11\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(15),
	cout0 => \Cpt_s[15]~9\,
	cout1 => \Cpt_s[15]~9COUT1_51\);

-- Location: LC_X2_Y4_N6
\Cpt_s[16]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(16) = DFFEAS(Cpt_s(16) $ (((((!\Cpt_s[14]~11\ & \Cpt_s[15]~9\) # (\Cpt_s[14]~11\ & \Cpt_s[15]~9COUT1_51\))))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[16]~7\ = CARRY(((!\Cpt_s[15]~9\)) # (!Cpt_s(16)))
-- \Cpt_s[16]~7COUT1_52\ = CARRY(((!\Cpt_s[15]~9COUT1_51\)) # (!Cpt_s(16)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(16),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[14]~11\,
	cin0 => \Cpt_s[15]~9\,
	cin1 => \Cpt_s[15]~9COUT1_51\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(16),
	cout0 => \Cpt_s[16]~7\,
	cout1 => \Cpt_s[16]~7COUT1_52\);

-- Location: LC_X2_Y4_N7
\Cpt_s[17]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(17) = DFFEAS((Cpt_s(17) $ ((!(!\Cpt_s[14]~11\ & \Cpt_s[16]~7\) # (\Cpt_s[14]~11\ & \Cpt_s[16]~7COUT1_52\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[17]~5\ = CARRY(((Cpt_s(17) & !\Cpt_s[16]~7\)))
-- \Cpt_s[17]~5COUT1_53\ = CARRY(((Cpt_s(17) & !\Cpt_s[16]~7COUT1_52\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => Cpt_s(17),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[14]~11\,
	cin0 => \Cpt_s[16]~7\,
	cin1 => \Cpt_s[16]~7COUT1_52\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(17),
	cout0 => \Cpt_s[17]~5\,
	cout1 => \Cpt_s[17]~5COUT1_53\);

-- Location: LC_X2_Y4_N8
\Cpt_s[18]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(18) = DFFEAS(Cpt_s(18) $ (((((!\Cpt_s[14]~11\ & \Cpt_s[17]~5\) # (\Cpt_s[14]~11\ & \Cpt_s[17]~5COUT1_53\))))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )
-- \Cpt_s[18]~3\ = CARRY(((!\Cpt_s[17]~5\)) # (!Cpt_s(18)))
-- \Cpt_s[18]~3COUT1_54\ = CARRY(((!\Cpt_s[17]~5COUT1_53\)) # (!Cpt_s(18)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => Cpt_s(18),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[14]~11\,
	cin0 => \Cpt_s[17]~5\,
	cin1 => \Cpt_s[17]~5COUT1_53\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(18),
	cout0 => \Cpt_s[18]~3\,
	cout1 => \Cpt_s[18]~3COUT1_54\);

-- Location: LC_X2_Y4_N9
\Cpt_s[19]\ : maxv_lcell
-- Equation(s):
-- Cpt_s(19) = DFFEAS((((!\Cpt_s[14]~11\ & \Cpt_s[18]~3\) # (\Cpt_s[14]~11\ & \Cpt_s[18]~3COUT1_54\) $ (!Cpt_s(19)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , , , , , )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datad => Cpt_s(19),
	aclr => \ALT_INV_nReset_i~combout\,
	cin => \Cpt_s[14]~11\,
	cin0 => \Cpt_s[18]~3\,
	cin1 => \Cpt_s[18]~3COUT1_54\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Cpt_s(19));

-- Location: LC_X10_Y6_N2
\U1|COMPTEUR_POS|Add0~0\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~0_combout\ = ((!\U1|COMPTEUR_POS|position_s\(0)))
-- \U1|COMPTEUR_POS|Add0~2\ = CARRY(((\U1|COMPTEUR_POS|position_s\(0))))
-- \U1|COMPTEUR_POS|Add0~2COUT1_81\ = CARRY(((\U1|COMPTEUR_POS|position_s\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~0_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~2\,
	cout1 => \U1|COMPTEUR_POS|Add0~2COUT1_81\);

-- Location: LC_X7_Y6_N2
\U1|COMPTEUR_POS|Add1~0\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~0_combout\ = ((!\U1|COMPTEUR_POS|position_s\(0)))
-- \U1|COMPTEUR_POS|Add1~2\ = CARRY(((\U1|COMPTEUR_POS|position_s\(0))))
-- \U1|COMPTEUR_POS|Add1~2COUT1_81\ = CARRY(((\U1|COMPTEUR_POS|position_s\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "33cc",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~0_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~2\,
	cout1 => \U1|COMPTEUR_POS|Add1~2COUT1_81\);

-- Location: LC_X6_Y6_N1
\U1|COMPTEUR_POS|position_next_s[0]~0\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\ = ((\Con_80p_io[2]~2\) # ((\U1|MSS1|Etat_Present\(0) & !\U1|MSS1|Etat_Present\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0fa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|MSS1|Etat_Present\(0),
	datac => \Con_80p_io[2]~2\,
	datad => \U1|MSS1|Etat_Present\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\);

-- Location: LC_X7_Y6_N1
\U1|COMPTEUR_POS|position_s[0]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(0) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add1~0_combout\))) # (!\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add0~0_combout\))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fc30",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add0~0_combout\,
	datad => \U1|COMPTEUR_POS|Add1~0_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(0));

-- Location: LC_X10_Y6_N3
\U1|COMPTEUR_POS|Add0~5\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~5_combout\ = (\U1|COMPTEUR_POS|position_s\(1) $ ((!\U1|COMPTEUR_POS|Add0~2\)))
-- \U1|COMPTEUR_POS|Add0~7\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(1) & !\U1|COMPTEUR_POS|Add0~2\)))
-- \U1|COMPTEUR_POS|Add0~7COUT1_82\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(1) & !\U1|COMPTEUR_POS|Add0~2COUT1_81\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "c303",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(1),
	cin0 => \U1|COMPTEUR_POS|Add0~2\,
	cin1 => \U1|COMPTEUR_POS|Add0~2COUT1_81\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~5_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~7\,
	cout1 => \U1|COMPTEUR_POS|Add0~7COUT1_82\);

-- Location: LC_X7_Y6_N3
\U1|COMPTEUR_POS|Add1~5\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~5_combout\ = (\U1|COMPTEUR_POS|position_s\(1) $ ((\U1|COMPTEUR_POS|Add1~2\)))
-- \U1|COMPTEUR_POS|Add1~7\ = CARRY(((!\U1|COMPTEUR_POS|Add1~2\) # (!\U1|COMPTEUR_POS|position_s\(1))))
-- \U1|COMPTEUR_POS|Add1~7COUT1_82\ = CARRY(((!\U1|COMPTEUR_POS|Add1~2COUT1_81\) # (!\U1|COMPTEUR_POS|position_s\(1))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(1),
	cin0 => \U1|COMPTEUR_POS|Add1~2\,
	cin1 => \U1|COMPTEUR_POS|Add1~2COUT1_81\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~5_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~7\,
	cout1 => \U1|COMPTEUR_POS|Add1~7COUT1_82\);

-- Location: LC_X7_Y6_N0
\U1|COMPTEUR_POS|position_s[1]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(1) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add1~5_combout\))) # (!\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add0~5_combout\))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fc30",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add0~5_combout\,
	datad => \U1|COMPTEUR_POS|Add1~5_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(1));

-- Location: LC_X10_Y6_N4
\U1|COMPTEUR_POS|Add0~10\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~10_combout\ = (\U1|COMPTEUR_POS|position_s\(2) $ ((\U1|COMPTEUR_POS|Add0~7\)))
-- \U1|COMPTEUR_POS|Add0~12\ = CARRY(((\U1|COMPTEUR_POS|position_s\(2)) # (!\U1|COMPTEUR_POS|Add0~7COUT1_82\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "3ccf",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(2),
	cin0 => \U1|COMPTEUR_POS|Add0~7\,
	cin1 => \U1|COMPTEUR_POS|Add0~7COUT1_82\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~10_combout\,
	cout => \U1|COMPTEUR_POS|Add0~12\);

-- Location: LC_X7_Y6_N4
\U1|COMPTEUR_POS|Add1~10\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~10_combout\ = (\U1|COMPTEUR_POS|position_s\(2) $ ((!\U1|COMPTEUR_POS|Add1~7\)))
-- \U1|COMPTEUR_POS|Add1~12\ = CARRY(((\U1|COMPTEUR_POS|position_s\(2) & !\U1|COMPTEUR_POS|Add1~7COUT1_82\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(2),
	cin0 => \U1|COMPTEUR_POS|Add1~7\,
	cin1 => \U1|COMPTEUR_POS|Add1~7COUT1_82\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~10_combout\,
	cout => \U1|COMPTEUR_POS|Add1~12\);

-- Location: LC_X10_Y6_N1
\U1|COMPTEUR_POS|position_s[2]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(2) = DFFEAS((\U1|MSS1|Mux1~1_combout\ & (((\U1|COMPTEUR_POS|Add1~10_combout\)))) # (!\U1|MSS1|Mux1~1_combout\ & (((\U1|COMPTEUR_POS|Add0~10_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fa50",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add0~10_combout\,
	datad => \U1|COMPTEUR_POS|Add1~10_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(2));

-- Location: LC_X10_Y6_N5
\U1|COMPTEUR_POS|Add0~15\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~15_combout\ = (\U1|COMPTEUR_POS|position_s\(3) $ ((!\U1|COMPTEUR_POS|Add0~12\)))
-- \U1|COMPTEUR_POS|Add0~17\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(3) & !\U1|COMPTEUR_POS|Add0~12\)))
-- \U1|COMPTEUR_POS|Add0~17COUT1_83\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(3) & !\U1|COMPTEUR_POS|Add0~12\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c303",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(3),
	cin => \U1|COMPTEUR_POS|Add0~12\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~15_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~17\,
	cout1 => \U1|COMPTEUR_POS|Add0~17COUT1_83\);

-- Location: LC_X7_Y6_N5
\U1|COMPTEUR_POS|Add1~15\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~15_combout\ = (\U1|COMPTEUR_POS|position_s\(3) $ ((\U1|COMPTEUR_POS|Add1~12\)))
-- \U1|COMPTEUR_POS|Add1~17\ = CARRY(((!\U1|COMPTEUR_POS|Add1~12\) # (!\U1|COMPTEUR_POS|position_s\(3))))
-- \U1|COMPTEUR_POS|Add1~17COUT1_83\ = CARRY(((!\U1|COMPTEUR_POS|Add1~12\) # (!\U1|COMPTEUR_POS|position_s\(3))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(3),
	cin => \U1|COMPTEUR_POS|Add1~12\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~15_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~17\,
	cout1 => \U1|COMPTEUR_POS|Add1~17COUT1_83\);

-- Location: LC_X10_Y6_N0
\U1|COMPTEUR_POS|position_s[3]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(3) = DFFEAS((\U1|MSS1|Mux1~1_combout\ & (((\U1|COMPTEUR_POS|Add1~15_combout\)))) # (!\U1|MSS1|Mux1~1_combout\ & (((\U1|COMPTEUR_POS|Add0~15_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fa50",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	dataa => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add0~15_combout\,
	datad => \U1|COMPTEUR_POS|Add1~15_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(3));

-- Location: LC_X10_Y6_N6
\U1|COMPTEUR_POS|Add0~20\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~20_combout\ = (\U1|COMPTEUR_POS|position_s\(4) $ (((!\U1|COMPTEUR_POS|Add0~12\ & \U1|COMPTEUR_POS|Add0~17\) # (\U1|COMPTEUR_POS|Add0~12\ & \U1|COMPTEUR_POS|Add0~17COUT1_83\))))
-- \U1|COMPTEUR_POS|Add0~22\ = CARRY(((\U1|COMPTEUR_POS|position_s\(4)) # (!\U1|COMPTEUR_POS|Add0~17\)))
-- \U1|COMPTEUR_POS|Add0~22COUT1_84\ = CARRY(((\U1|COMPTEUR_POS|position_s\(4)) # (!\U1|COMPTEUR_POS|Add0~17COUT1_83\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3ccf",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(4),
	cin => \U1|COMPTEUR_POS|Add0~12\,
	cin0 => \U1|COMPTEUR_POS|Add0~17\,
	cin1 => \U1|COMPTEUR_POS|Add0~17COUT1_83\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~20_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~22\,
	cout1 => \U1|COMPTEUR_POS|Add0~22COUT1_84\);

-- Location: LC_X7_Y6_N6
\U1|COMPTEUR_POS|Add1~20\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~20_combout\ = (\U1|COMPTEUR_POS|position_s\(4) $ ((!(!\U1|COMPTEUR_POS|Add1~12\ & \U1|COMPTEUR_POS|Add1~17\) # (\U1|COMPTEUR_POS|Add1~12\ & \U1|COMPTEUR_POS|Add1~17COUT1_83\))))
-- \U1|COMPTEUR_POS|Add1~22\ = CARRY(((\U1|COMPTEUR_POS|position_s\(4) & !\U1|COMPTEUR_POS|Add1~17\)))
-- \U1|COMPTEUR_POS|Add1~22COUT1_84\ = CARRY(((\U1|COMPTEUR_POS|position_s\(4) & !\U1|COMPTEUR_POS|Add1~17COUT1_83\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(4),
	cin => \U1|COMPTEUR_POS|Add1~12\,
	cin0 => \U1|COMPTEUR_POS|Add1~17\,
	cin1 => \U1|COMPTEUR_POS|Add1~17COUT1_83\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~20_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~22\,
	cout1 => \U1|COMPTEUR_POS|Add1~22COUT1_84\);

-- Location: LC_X9_Y6_N7
\U1|COMPTEUR_POS|position_s[4]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(4) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add1~20_combout\))) # (!\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add0~20_combout\))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fc30",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add0~20_combout\,
	datad => \U1|COMPTEUR_POS|Add1~20_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(4));

-- Location: LC_X7_Y6_N7
\U1|COMPTEUR_POS|Add1~25\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~25_combout\ = (\U1|COMPTEUR_POS|position_s\(5) $ (((!\U1|COMPTEUR_POS|Add1~12\ & \U1|COMPTEUR_POS|Add1~22\) # (\U1|COMPTEUR_POS|Add1~12\ & \U1|COMPTEUR_POS|Add1~22COUT1_84\))))
-- \U1|COMPTEUR_POS|Add1~27\ = CARRY(((!\U1|COMPTEUR_POS|Add1~22\) # (!\U1|COMPTEUR_POS|position_s\(5))))
-- \U1|COMPTEUR_POS|Add1~27COUT1_85\ = CARRY(((!\U1|COMPTEUR_POS|Add1~22COUT1_84\) # (!\U1|COMPTEUR_POS|position_s\(5))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(5),
	cin => \U1|COMPTEUR_POS|Add1~12\,
	cin0 => \U1|COMPTEUR_POS|Add1~22\,
	cin1 => \U1|COMPTEUR_POS|Add1~22COUT1_84\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~25_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~27\,
	cout1 => \U1|COMPTEUR_POS|Add1~27COUT1_85\);

-- Location: LC_X10_Y6_N7
\U1|COMPTEUR_POS|Add0~25\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~25_combout\ = (\U1|COMPTEUR_POS|position_s\(5) $ ((!(!\U1|COMPTEUR_POS|Add0~12\ & \U1|COMPTEUR_POS|Add0~22\) # (\U1|COMPTEUR_POS|Add0~12\ & \U1|COMPTEUR_POS|Add0~22COUT1_84\))))
-- \U1|COMPTEUR_POS|Add0~27\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(5) & !\U1|COMPTEUR_POS|Add0~22\)))
-- \U1|COMPTEUR_POS|Add0~27COUT1_85\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(5) & !\U1|COMPTEUR_POS|Add0~22COUT1_84\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c303",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(5),
	cin => \U1|COMPTEUR_POS|Add0~12\,
	cin0 => \U1|COMPTEUR_POS|Add0~22\,
	cin1 => \U1|COMPTEUR_POS|Add0~22COUT1_84\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~25_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~27\,
	cout1 => \U1|COMPTEUR_POS|Add0~27COUT1_85\);

-- Location: LC_X9_Y6_N2
\U1|COMPTEUR_POS|position_s[5]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(5) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add1~25_combout\)) # (!\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add0~25_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add1~25_combout\,
	datad => \U1|COMPTEUR_POS|Add0~25_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(5));

-- Location: LC_X7_Y6_N8
\U1|COMPTEUR_POS|Add1~30\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~30_combout\ = (\U1|COMPTEUR_POS|position_s\(6) $ ((!(!\U1|COMPTEUR_POS|Add1~12\ & \U1|COMPTEUR_POS|Add1~27\) # (\U1|COMPTEUR_POS|Add1~12\ & \U1|COMPTEUR_POS|Add1~27COUT1_85\))))
-- \U1|COMPTEUR_POS|Add1~32\ = CARRY(((\U1|COMPTEUR_POS|position_s\(6) & !\U1|COMPTEUR_POS|Add1~27\)))
-- \U1|COMPTEUR_POS|Add1~32COUT1_86\ = CARRY(((\U1|COMPTEUR_POS|position_s\(6) & !\U1|COMPTEUR_POS|Add1~27COUT1_85\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(6),
	cin => \U1|COMPTEUR_POS|Add1~12\,
	cin0 => \U1|COMPTEUR_POS|Add1~27\,
	cin1 => \U1|COMPTEUR_POS|Add1~27COUT1_85\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~30_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~32\,
	cout1 => \U1|COMPTEUR_POS|Add1~32COUT1_86\);

-- Location: LC_X10_Y6_N8
\U1|COMPTEUR_POS|Add0~30\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~30_combout\ = \U1|COMPTEUR_POS|position_s\(6) $ (((((!\U1|COMPTEUR_POS|Add0~12\ & \U1|COMPTEUR_POS|Add0~27\) # (\U1|COMPTEUR_POS|Add0~12\ & \U1|COMPTEUR_POS|Add0~27COUT1_85\)))))
-- \U1|COMPTEUR_POS|Add0~32\ = CARRY((\U1|COMPTEUR_POS|position_s\(6)) # ((!\U1|COMPTEUR_POS|Add0~27\)))
-- \U1|COMPTEUR_POS|Add0~32COUT1_86\ = CARRY((\U1|COMPTEUR_POS|position_s\(6)) # ((!\U1|COMPTEUR_POS|Add0~27COUT1_85\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5aaf",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|COMPTEUR_POS|position_s\(6),
	cin => \U1|COMPTEUR_POS|Add0~12\,
	cin0 => \U1|COMPTEUR_POS|Add0~27\,
	cin1 => \U1|COMPTEUR_POS|Add0~27COUT1_85\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~30_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~32\,
	cout1 => \U1|COMPTEUR_POS|Add0~32COUT1_86\);

-- Location: LC_X9_Y6_N8
\U1|COMPTEUR_POS|position_s[6]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(6) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add1~30_combout\)) # (!\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add0~30_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add1~30_combout\,
	datad => \U1|COMPTEUR_POS|Add0~30_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(6));

-- Location: LC_X7_Y6_N9
\U1|COMPTEUR_POS|Add1~35\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~35_combout\ = (\U1|COMPTEUR_POS|position_s\(7) $ (((!\U1|COMPTEUR_POS|Add1~12\ & \U1|COMPTEUR_POS|Add1~32\) # (\U1|COMPTEUR_POS|Add1~12\ & \U1|COMPTEUR_POS|Add1~32COUT1_86\))))
-- \U1|COMPTEUR_POS|Add1~37\ = CARRY(((!\U1|COMPTEUR_POS|Add1~32COUT1_86\) # (!\U1|COMPTEUR_POS|position_s\(7))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(7),
	cin => \U1|COMPTEUR_POS|Add1~12\,
	cin0 => \U1|COMPTEUR_POS|Add1~32\,
	cin1 => \U1|COMPTEUR_POS|Add1~32COUT1_86\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~35_combout\,
	cout => \U1|COMPTEUR_POS|Add1~37\);

-- Location: LC_X10_Y6_N9
\U1|COMPTEUR_POS|Add0~35\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~35_combout\ = (\U1|COMPTEUR_POS|position_s\(7) $ ((!(!\U1|COMPTEUR_POS|Add0~12\ & \U1|COMPTEUR_POS|Add0~32\) # (\U1|COMPTEUR_POS|Add0~12\ & \U1|COMPTEUR_POS|Add0~32COUT1_86\))))
-- \U1|COMPTEUR_POS|Add0~37\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(7) & !\U1|COMPTEUR_POS|Add0~32COUT1_86\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c303",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(7),
	cin => \U1|COMPTEUR_POS|Add0~12\,
	cin0 => \U1|COMPTEUR_POS|Add0~32\,
	cin1 => \U1|COMPTEUR_POS|Add0~32COUT1_86\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~35_combout\,
	cout => \U1|COMPTEUR_POS|Add0~37\);

-- Location: LC_X9_Y6_N3
\U1|COMPTEUR_POS|position_s[7]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(7) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add1~35_combout\)) # (!\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add0~35_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add1~35_combout\,
	datad => \U1|COMPTEUR_POS|Add0~35_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(7));

-- Location: LC_X8_Y6_N0
\U1|COMPTEUR_POS|Add1~40\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~40_combout\ = (\U1|COMPTEUR_POS|position_s\(8) $ ((!\U1|COMPTEUR_POS|Add1~37\)))
-- \U1|COMPTEUR_POS|Add1~42\ = CARRY(((\U1|COMPTEUR_POS|position_s\(8) & !\U1|COMPTEUR_POS|Add1~37\)))
-- \U1|COMPTEUR_POS|Add1~42COUT1_87\ = CARRY(((\U1|COMPTEUR_POS|position_s\(8) & !\U1|COMPTEUR_POS|Add1~37\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(8),
	cin => \U1|COMPTEUR_POS|Add1~37\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~40_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~42\,
	cout1 => \U1|COMPTEUR_POS|Add1~42COUT1_87\);

-- Location: LC_X11_Y6_N0
\U1|COMPTEUR_POS|Add0~40\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~40_combout\ = (\U1|COMPTEUR_POS|position_s\(8) $ ((\U1|COMPTEUR_POS|Add0~37\)))
-- \U1|COMPTEUR_POS|Add0~42\ = CARRY(((\U1|COMPTEUR_POS|position_s\(8)) # (!\U1|COMPTEUR_POS|Add0~37\)))
-- \U1|COMPTEUR_POS|Add0~42COUT1_87\ = CARRY(((\U1|COMPTEUR_POS|position_s\(8)) # (!\U1|COMPTEUR_POS|Add0~37\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3ccf",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(8),
	cin => \U1|COMPTEUR_POS|Add0~37\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~40_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~42\,
	cout1 => \U1|COMPTEUR_POS|Add0~42COUT1_87\);

-- Location: LC_X9_Y6_N4
\U1|COMPTEUR_POS|position_s[8]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(8) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add1~40_combout\)) # (!\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add0~40_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add1~40_combout\,
	datad => \U1|COMPTEUR_POS|Add0~40_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(8));

-- Location: LC_X8_Y6_N1
\U1|COMPTEUR_POS|Add1~45\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~45_combout\ = (\U1|COMPTEUR_POS|position_s\(9) $ (((!\U1|COMPTEUR_POS|Add1~37\ & \U1|COMPTEUR_POS|Add1~42\) # (\U1|COMPTEUR_POS|Add1~37\ & \U1|COMPTEUR_POS|Add1~42COUT1_87\))))
-- \U1|COMPTEUR_POS|Add1~47\ = CARRY(((!\U1|COMPTEUR_POS|Add1~42\) # (!\U1|COMPTEUR_POS|position_s\(9))))
-- \U1|COMPTEUR_POS|Add1~47COUT1_88\ = CARRY(((!\U1|COMPTEUR_POS|Add1~42COUT1_87\) # (!\U1|COMPTEUR_POS|position_s\(9))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(9),
	cin => \U1|COMPTEUR_POS|Add1~37\,
	cin0 => \U1|COMPTEUR_POS|Add1~42\,
	cin1 => \U1|COMPTEUR_POS|Add1~42COUT1_87\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~45_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~47\,
	cout1 => \U1|COMPTEUR_POS|Add1~47COUT1_88\);

-- Location: LC_X11_Y6_N1
\U1|COMPTEUR_POS|Add0~45\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~45_combout\ = (\U1|COMPTEUR_POS|position_s\(9) $ ((!(!\U1|COMPTEUR_POS|Add0~37\ & \U1|COMPTEUR_POS|Add0~42\) # (\U1|COMPTEUR_POS|Add0~37\ & \U1|COMPTEUR_POS|Add0~42COUT1_87\))))
-- \U1|COMPTEUR_POS|Add0~47\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(9) & !\U1|COMPTEUR_POS|Add0~42\)))
-- \U1|COMPTEUR_POS|Add0~47COUT1_88\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(9) & !\U1|COMPTEUR_POS|Add0~42COUT1_87\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c303",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(9),
	cin => \U1|COMPTEUR_POS|Add0~37\,
	cin0 => \U1|COMPTEUR_POS|Add0~42\,
	cin1 => \U1|COMPTEUR_POS|Add0~42COUT1_87\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~45_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~47\,
	cout1 => \U1|COMPTEUR_POS|Add0~47COUT1_88\);

-- Location: LC_X9_Y6_N9
\U1|COMPTEUR_POS|position_s[9]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(9) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add1~45_combout\)) # (!\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add0~45_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add1~45_combout\,
	datad => \U1|COMPTEUR_POS|Add0~45_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(9));

-- Location: LC_X11_Y6_N2
\U1|COMPTEUR_POS|Add0~50\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~50_combout\ = (\U1|COMPTEUR_POS|position_s\(10) $ (((!\U1|COMPTEUR_POS|Add0~37\ & \U1|COMPTEUR_POS|Add0~47\) # (\U1|COMPTEUR_POS|Add0~37\ & \U1|COMPTEUR_POS|Add0~47COUT1_88\))))
-- \U1|COMPTEUR_POS|Add0~52\ = CARRY(((\U1|COMPTEUR_POS|position_s\(10)) # (!\U1|COMPTEUR_POS|Add0~47\)))
-- \U1|COMPTEUR_POS|Add0~52COUT1_89\ = CARRY(((\U1|COMPTEUR_POS|position_s\(10)) # (!\U1|COMPTEUR_POS|Add0~47COUT1_88\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3ccf",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(10),
	cin => \U1|COMPTEUR_POS|Add0~37\,
	cin0 => \U1|COMPTEUR_POS|Add0~47\,
	cin1 => \U1|COMPTEUR_POS|Add0~47COUT1_88\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~50_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~52\,
	cout1 => \U1|COMPTEUR_POS|Add0~52COUT1_89\);

-- Location: LC_X8_Y6_N2
\U1|COMPTEUR_POS|Add1~50\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~50_combout\ = \U1|COMPTEUR_POS|position_s\(10) $ ((((!(!\U1|COMPTEUR_POS|Add1~37\ & \U1|COMPTEUR_POS|Add1~47\) # (\U1|COMPTEUR_POS|Add1~37\ & \U1|COMPTEUR_POS|Add1~47COUT1_88\)))))
-- \U1|COMPTEUR_POS|Add1~52\ = CARRY((\U1|COMPTEUR_POS|position_s\(10) & ((!\U1|COMPTEUR_POS|Add1~47\))))
-- \U1|COMPTEUR_POS|Add1~52COUT1_89\ = CARRY((\U1|COMPTEUR_POS|position_s\(10) & ((!\U1|COMPTEUR_POS|Add1~47COUT1_88\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|COMPTEUR_POS|position_s\(10),
	cin => \U1|COMPTEUR_POS|Add1~37\,
	cin0 => \U1|COMPTEUR_POS|Add1~47\,
	cin1 => \U1|COMPTEUR_POS|Add1~47COUT1_88\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~50_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~52\,
	cout1 => \U1|COMPTEUR_POS|Add1~52COUT1_89\);

-- Location: LC_X9_Y6_N6
\U1|COMPTEUR_POS|position_s[10]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(10) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add1~50_combout\))) # (!\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add0~50_combout\))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fc30",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add0~50_combout\,
	datad => \U1|COMPTEUR_POS|Add1~50_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(10));

-- Location: LC_X8_Y6_N3
\U1|COMPTEUR_POS|Add1~55\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~55_combout\ = (\U1|COMPTEUR_POS|position_s\(11) $ (((!\U1|COMPTEUR_POS|Add1~37\ & \U1|COMPTEUR_POS|Add1~52\) # (\U1|COMPTEUR_POS|Add1~37\ & \U1|COMPTEUR_POS|Add1~52COUT1_89\))))
-- \U1|COMPTEUR_POS|Add1~57\ = CARRY(((!\U1|COMPTEUR_POS|Add1~52\) # (!\U1|COMPTEUR_POS|position_s\(11))))
-- \U1|COMPTEUR_POS|Add1~57COUT1_90\ = CARRY(((!\U1|COMPTEUR_POS|Add1~52COUT1_89\) # (!\U1|COMPTEUR_POS|position_s\(11))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(11),
	cin => \U1|COMPTEUR_POS|Add1~37\,
	cin0 => \U1|COMPTEUR_POS|Add1~52\,
	cin1 => \U1|COMPTEUR_POS|Add1~52COUT1_89\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~55_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~57\,
	cout1 => \U1|COMPTEUR_POS|Add1~57COUT1_90\);

-- Location: LC_X11_Y6_N3
\U1|COMPTEUR_POS|Add0~55\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~55_combout\ = (\U1|COMPTEUR_POS|position_s\(11) $ ((!(!\U1|COMPTEUR_POS|Add0~37\ & \U1|COMPTEUR_POS|Add0~52\) # (\U1|COMPTEUR_POS|Add0~37\ & \U1|COMPTEUR_POS|Add0~52COUT1_89\))))
-- \U1|COMPTEUR_POS|Add0~57\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(11) & !\U1|COMPTEUR_POS|Add0~52\)))
-- \U1|COMPTEUR_POS|Add0~57COUT1_90\ = CARRY(((!\U1|COMPTEUR_POS|position_s\(11) & !\U1|COMPTEUR_POS|Add0~52COUT1_89\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c303",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(11),
	cin => \U1|COMPTEUR_POS|Add0~37\,
	cin0 => \U1|COMPTEUR_POS|Add0~52\,
	cin1 => \U1|COMPTEUR_POS|Add0~52COUT1_89\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~55_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~57\,
	cout1 => \U1|COMPTEUR_POS|Add0~57COUT1_90\);

-- Location: LC_X11_Y6_N9
\U1|COMPTEUR_POS|position_s[11]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(11) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add1~55_combout\)) # (!\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add0~55_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add1~55_combout\,
	datad => \U1|COMPTEUR_POS|Add0~55_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(11));

-- Location: LC_X8_Y6_N4
\U1|COMPTEUR_POS|Add1~60\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~60_combout\ = (\U1|COMPTEUR_POS|position_s\(12) $ ((!(!\U1|COMPTEUR_POS|Add1~37\ & \U1|COMPTEUR_POS|Add1~57\) # (\U1|COMPTEUR_POS|Add1~37\ & \U1|COMPTEUR_POS|Add1~57COUT1_90\))))
-- \U1|COMPTEUR_POS|Add1~62\ = CARRY(((\U1|COMPTEUR_POS|position_s\(12) & !\U1|COMPTEUR_POS|Add1~57COUT1_90\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(12),
	cin => \U1|COMPTEUR_POS|Add1~37\,
	cin0 => \U1|COMPTEUR_POS|Add1~57\,
	cin1 => \U1|COMPTEUR_POS|Add1~57COUT1_90\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~60_combout\,
	cout => \U1|COMPTEUR_POS|Add1~62\);

-- Location: LC_X11_Y6_N4
\U1|COMPTEUR_POS|Add0~60\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~60_combout\ = (\U1|COMPTEUR_POS|position_s\(12) $ (((!\U1|COMPTEUR_POS|Add0~37\ & \U1|COMPTEUR_POS|Add0~57\) # (\U1|COMPTEUR_POS|Add0~37\ & \U1|COMPTEUR_POS|Add0~57COUT1_90\))))
-- \U1|COMPTEUR_POS|Add0~62\ = CARRY(((\U1|COMPTEUR_POS|position_s\(12)) # (!\U1|COMPTEUR_POS|Add0~57COUT1_90\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3ccf",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(12),
	cin => \U1|COMPTEUR_POS|Add0~37\,
	cin0 => \U1|COMPTEUR_POS|Add0~57\,
	cin1 => \U1|COMPTEUR_POS|Add0~57COUT1_90\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~60_combout\,
	cout => \U1|COMPTEUR_POS|Add0~62\);

-- Location: LC_X9_Y6_N5
\U1|COMPTEUR_POS|position_s[12]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(12) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add1~60_combout\)) # (!\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add0~60_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add1~60_combout\,
	datad => \U1|COMPTEUR_POS|Add0~60_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(12));

-- Location: LC_X11_Y6_N5
\U1|COMPTEUR_POS|Add0~65\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~65_combout\ = \U1|COMPTEUR_POS|position_s\(13) $ ((((!\U1|COMPTEUR_POS|Add0~62\))))
-- \U1|COMPTEUR_POS|Add0~67\ = CARRY((!\U1|COMPTEUR_POS|position_s\(13) & ((!\U1|COMPTEUR_POS|Add0~62\))))
-- \U1|COMPTEUR_POS|Add0~67COUT1_91\ = CARRY((!\U1|COMPTEUR_POS|position_s\(13) & ((!\U1|COMPTEUR_POS|Add0~62\))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "a505",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|COMPTEUR_POS|position_s\(13),
	cin => \U1|COMPTEUR_POS|Add0~62\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~65_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~67\,
	cout1 => \U1|COMPTEUR_POS|Add0~67COUT1_91\);

-- Location: LC_X8_Y6_N5
\U1|COMPTEUR_POS|Add1~65\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~65_combout\ = (\U1|COMPTEUR_POS|position_s\(13) $ ((\U1|COMPTEUR_POS|Add1~62\)))
-- \U1|COMPTEUR_POS|Add1~67\ = CARRY(((!\U1|COMPTEUR_POS|Add1~62\) # (!\U1|COMPTEUR_POS|position_s\(13))))
-- \U1|COMPTEUR_POS|Add1~67COUT1_91\ = CARRY(((!\U1|COMPTEUR_POS|Add1~62\) # (!\U1|COMPTEUR_POS|position_s\(13))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(13),
	cin => \U1|COMPTEUR_POS|Add1~62\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~65_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~67\,
	cout1 => \U1|COMPTEUR_POS|Add1~67COUT1_91\);

-- Location: LC_X11_Y6_N8
\U1|COMPTEUR_POS|position_s[13]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(13) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add1~65_combout\))) # (!\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add0~65_combout\))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fc30",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add0~65_combout\,
	datad => \U1|COMPTEUR_POS|Add1~65_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(13));

-- Location: LC_X8_Y6_N6
\U1|COMPTEUR_POS|Add1~70\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~70_combout\ = (\U1|COMPTEUR_POS|position_s\(14) $ ((!(!\U1|COMPTEUR_POS|Add1~62\ & \U1|COMPTEUR_POS|Add1~67\) # (\U1|COMPTEUR_POS|Add1~62\ & \U1|COMPTEUR_POS|Add1~67COUT1_91\))))
-- \U1|COMPTEUR_POS|Add1~72\ = CARRY(((\U1|COMPTEUR_POS|position_s\(14) & !\U1|COMPTEUR_POS|Add1~67\)))
-- \U1|COMPTEUR_POS|Add1~72COUT1_92\ = CARRY(((\U1|COMPTEUR_POS|position_s\(14) & !\U1|COMPTEUR_POS|Add1~67COUT1_91\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(14),
	cin => \U1|COMPTEUR_POS|Add1~62\,
	cin0 => \U1|COMPTEUR_POS|Add1~67\,
	cin1 => \U1|COMPTEUR_POS|Add1~67COUT1_91\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~70_combout\,
	cout0 => \U1|COMPTEUR_POS|Add1~72\,
	cout1 => \U1|COMPTEUR_POS|Add1~72COUT1_92\);

-- Location: LC_X11_Y6_N6
\U1|COMPTEUR_POS|Add0~70\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~70_combout\ = (\U1|COMPTEUR_POS|position_s\(14) $ (((!\U1|COMPTEUR_POS|Add0~62\ & \U1|COMPTEUR_POS|Add0~67\) # (\U1|COMPTEUR_POS|Add0~62\ & \U1|COMPTEUR_POS|Add0~67COUT1_91\))))
-- \U1|COMPTEUR_POS|Add0~72\ = CARRY(((\U1|COMPTEUR_POS|position_s\(14)) # (!\U1|COMPTEUR_POS|Add0~67\)))
-- \U1|COMPTEUR_POS|Add0~72COUT1_92\ = CARRY(((\U1|COMPTEUR_POS|position_s\(14)) # (!\U1|COMPTEUR_POS|Add0~67COUT1_91\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3ccf",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|COMPTEUR_POS|position_s\(14),
	cin => \U1|COMPTEUR_POS|Add0~62\,
	cin0 => \U1|COMPTEUR_POS|Add0~67\,
	cin1 => \U1|COMPTEUR_POS|Add0~67COUT1_91\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~70_combout\,
	cout0 => \U1|COMPTEUR_POS|Add0~72\,
	cout1 => \U1|COMPTEUR_POS|Add0~72COUT1_92\);

-- Location: LC_X8_Y6_N9
\U1|COMPTEUR_POS|position_s[14]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(14) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add1~70_combout\)) # (!\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add0~70_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add1~70_combout\,
	datad => \U1|COMPTEUR_POS|Add0~70_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(14));

-- Location: LC_X8_Y6_N7
\U1|COMPTEUR_POS|Add1~75\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add1~75_combout\ = (((!\U1|COMPTEUR_POS|Add1~62\ & \U1|COMPTEUR_POS|Add1~72\) # (\U1|COMPTEUR_POS|Add1~62\ & \U1|COMPTEUR_POS|Add1~72COUT1_92\) $ (\U1|COMPTEUR_POS|position_s\(15))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datad => \U1|COMPTEUR_POS|position_s\(15),
	cin => \U1|COMPTEUR_POS|Add1~62\,
	cin0 => \U1|COMPTEUR_POS|Add1~72\,
	cin1 => \U1|COMPTEUR_POS|Add1~72COUT1_92\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add1~75_combout\);

-- Location: LC_X11_Y6_N7
\U1|COMPTEUR_POS|Add0~75\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|Add0~75_combout\ = (((!\U1|COMPTEUR_POS|Add0~62\ & \U1|COMPTEUR_POS|Add0~72\) # (\U1|COMPTEUR_POS|Add0~62\ & \U1|COMPTEUR_POS|Add0~72COUT1_92\) $ (!\U1|COMPTEUR_POS|position_s\(15))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datad => \U1|COMPTEUR_POS|position_s\(15),
	cin => \U1|COMPTEUR_POS|Add0~62\,
	cin0 => \U1|COMPTEUR_POS|Add0~72\,
	cin1 => \U1|COMPTEUR_POS|Add0~72COUT1_92\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U1|COMPTEUR_POS|Add0~75_combout\);

-- Location: LC_X8_Y6_N8
\U1|COMPTEUR_POS|position_s[15]\ : maxv_lcell
-- Equation(s):
-- \U1|COMPTEUR_POS|position_s\(15) = DFFEAS(((\U1|MSS1|Mux1~1_combout\ & (\U1|COMPTEUR_POS|Add1~75_combout\)) # (!\U1|MSS1|Mux1~1_combout\ & ((\U1|COMPTEUR_POS|Add0~75_combout\)))), GLOBAL(\Clk_Main_i~combout\), GLOBAL(\nReset_i~combout\), , 
-- \U1|COMPTEUR_POS|position_next_s[0]~0_combout\, , , \Con_80p_io[2]~2\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f3c0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \Clk_Main_i~combout\,
	datab => \U1|MSS1|Mux1~1_combout\,
	datac => \U1|COMPTEUR_POS|Add1~75_combout\,
	datad => \U1|COMPTEUR_POS|Add0~75_combout\,
	aclr => \ALT_INV_nReset_i~combout\,
	sclr => \Con_80p_io[2]~2\,
	ena => \U1|COMPTEUR_POS|position_next_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|COMPTEUR_POS|position_s\(15));

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Switch_i[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Switch_i(2),
	combout => \Switch_i~combout\(2));

-- Location: PIN_J5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Clk_Gen_i~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Clk_Gen_i);

-- Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Encoder_A_i~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Encoder_A_i);

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Encoder_B_i~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Encoder_B_i);

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nButton_i[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_nButton_i(1));

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nButton_i[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_nButton_i(2));

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nButton_i[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_nButton_i(3));

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nButton_i[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_nButton_i(4));

-- Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nButton_i[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_nButton_i(5));

-- Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nButton_i[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_nButton_i(6));

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nButton_i[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_nButton_i(7));

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Switch_i[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Switch_i(0));

-- Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Switch_i[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Switch_i(1));

-- Location: PIN_K3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Switch_i[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Switch_i(3));

-- Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Switch_i[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Switch_i(4));

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Switch_i[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Switch_i(5));

-- Location: PIN_J3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Switch_i[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Switch_i(6));

-- Location: PIN_M8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Switch_i[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_Switch_i(7));

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nLed_o[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_Con_80p_io[2]~2\,
	oe => VCC,
	padio => ww_nLed_o(0));

-- Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nLed_o[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U1|MSS1|ALT_INV_Mux1~1_combout\,
	oe => VCC,
	padio => ww_nLed_o(1));

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nLed_o[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U1|FLIPFLOP_RS_ERR|ALT_INV_Q_pres~regout\,
	oe => VCC,
	padio => ww_nLed_o(2));

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nLed_o[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nLed_o(3));

-- Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nLed_o[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nLed_o(4));

-- Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nLed_o[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nLed_o(5));

-- Location: PIN_G1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nLed_o[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nLed_o(6));

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nLed_o[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \nButton_i~combout\(8),
	oe => VCC,
	padio => ww_nLed_o(7));

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Led_RGB_o[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_Led_RGB_o(0));

-- Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Led_RGB_o[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_Led_RGB_o(1));

-- Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Led_RGB_o[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_Led_RGB_o(2));

-- Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nSeven_Seg_o[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nSeven_Seg_o(0));

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nSeven_Seg_o[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nSeven_Seg_o(1));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nSeven_Seg_o[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nSeven_Seg_o(2));

-- Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nSeven_Seg_o[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nSeven_Seg_o(3));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nSeven_Seg_o[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nSeven_Seg_o(4));

-- Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nSeven_Seg_o[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nSeven_Seg_o(5));

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nSeven_Seg_o[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => ww_nSeven_Seg_o(6));

-- Location: PIN_R1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\nSeven_Seg_o[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => ALT_INV_Cpt_s(19),
	oe => VCC,
	padio => ww_nSeven_Seg_o(7));

-- Location: PIN_R13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(1));

-- Location: PIN_T12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(2));

-- Location: PIN_P12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(3));

-- Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(4));

-- Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(5));

-- Location: PIN_R10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(6));

-- Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(7));

-- Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(8));

-- Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(9));

-- Location: PIN_P8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(10));

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(11));

-- Location: PIN_P7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(12));

-- Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(13));

-- Location: PIN_P13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(14));

-- Location: PIN_R12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(15));

-- Location: PIN_N12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[16]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(16));

-- Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[17]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(17));

-- Location: PIN_T10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[18]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(18));

-- Location: PIN_P10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[19]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(19));

-- Location: PIN_R9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[20]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(20));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[21]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(21));

-- Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[22]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(22));

-- Location: PIN_B1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[23]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(23));

-- Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[24]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(24));

-- Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_25p_io[25]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_25p_io(25));

-- Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|MSS1|Mux1~1_combout\,
	oe => VCC,
	padio => Con_80p_io(3));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(0),
	oe => VCC,
	padio => Con_80p_io(4));

-- Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(1),
	oe => VCC,
	padio => Con_80p_io(5));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(2),
	oe => VCC,
	padio => Con_80p_io(6));

-- Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(3),
	oe => VCC,
	padio => Con_80p_io(7));

-- Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(4),
	oe => VCC,
	padio => Con_80p_io(8));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(5),
	oe => VCC,
	padio => Con_80p_io(9));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(6),
	oe => VCC,
	padio => Con_80p_io(10));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(7),
	oe => VCC,
	padio => Con_80p_io(11));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(8),
	oe => VCC,
	padio => Con_80p_io(12));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(9),
	oe => VCC,
	padio => Con_80p_io(13));

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(10),
	oe => VCC,
	padio => Con_80p_io(14));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(11),
	oe => VCC,
	padio => Con_80p_io(15));

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[16]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(12),
	oe => VCC,
	padio => Con_80p_io(16));

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[17]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(13),
	oe => VCC,
	padio => Con_80p_io(17));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[18]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(14),
	oe => VCC,
	padio => Con_80p_io(18));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[19]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \U1|COMPTEUR_POS|position_s\(15),
	oe => VCC,
	padio => Con_80p_io(19));

-- Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[20]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(20));

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[21]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(21));

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[22]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(22));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[23]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(23));

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[24]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(24));

-- Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[25]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(25));

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[26]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(26));

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[27]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(27));

-- Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[28]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(28));

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[29]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(29));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[30]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(30));

-- Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[31]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(31));

-- Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[32]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(32));

-- Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[33]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(33));

-- Location: PIN_L16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[34]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(34));

-- Location: PIN_L15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[35]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(35));

-- Location: PIN_M16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[36]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(36));

-- Location: PIN_M15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[37]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(37));

-- Location: PIN_N16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[38]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(38));

-- Location: PIN_A2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[41]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(41));

-- Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[42]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(42));

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[43]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(43));

-- Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[44]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(44));

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[45]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(45));

-- Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[46]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(46));

-- Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[47]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(47));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[48]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(48));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[49]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(49));

-- Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[50]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(50));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[51]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(51));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[52]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(52));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[53]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(53));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[54]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(54));

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[55]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(55));

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[56]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(56));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[57]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(57));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[58]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(58));

-- Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[59]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(59));

-- Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[60]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(60));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[61]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(61));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[62]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(62));

-- Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[63]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(63));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[64]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(64));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[65]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(65));

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[66]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(66));

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[67]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(67));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[68]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(68));

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[69]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(69));

-- Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[70]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(70));

-- Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[71]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(71));

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[72]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(72));

-- Location: PIN_K15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[73]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(73));

-- Location: PIN_K14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[74]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(74));

-- Location: PIN_L14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[75]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Con_80p_io(75));

-- Location: PIN_L13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[76]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(76));

-- Location: PIN_M14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[77]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(77));

-- Location: PIN_M13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[78]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	oe => VCC,
	padio => Con_80p_io(78));

-- Location: PIN_N14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Con_80p_io[79]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \Switch_i~combout\(2),
	oe => VCC,
	padio => Con_80p_io(79));

-- Location: PIN_P15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(5));

-- Location: PIN_T13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(6));

-- Location: PIN_R16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(7));

-- Location: PIN_P14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(8));

-- Location: PIN_T15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(9));

-- Location: PIN_R14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(10));

-- Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(11));

-- Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(12));

-- Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(13));

-- Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(14));

-- Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(15));

-- Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[16]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(16));

-- Location: PIN_P5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[17]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(17));

-- Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[18]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(18));

-- Location: PIN_N5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[19]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	open_drain_output => "true",
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => Mezzanine_io(19));

-- Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\Mezzanine_io[20]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "bidir")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_nButton_i~combout\(8),
	oe => VCC,
	padio => Mezzanine_io(20));
END structure;


