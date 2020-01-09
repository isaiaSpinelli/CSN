------------------------------------------------------------------------------------------
-- HEIG-VD ///////////////////////////////////////////////////////////////////////////////
-- Haute Ecole d'Ingenerie et de Gestion du Canton de Vaud
-- School of Business and Engineering in Canton de Vaud
------------------------------------------------------------------------------------------
-- REDS Institute ////////////////////////////////////////////////////////////////////////
-- Reconfigurable Embedded Digital Systems
------------------------------------------------------------------------------------------
--
-- File                 : maxv_top.vhd
-- Author               : Gilles Curchod
-- Date                 : 28.05.2013
-- Target Devices       : Altera MAXV 5M570ZF256C5
--
-- Context              : Max_V_Board Project : Hardware bring-up
--
------------------------------------------------------------------------------------------
-- Description :
--   Top of the CPLD
------------------------------------------------------------------------------------------
-- Information :
--
------------------------------------------------------------------------------------------
-- Modifications :
-- Ver   Date       Engineer  Changes
-- 0.0   See header  GCD      Initial version
-- 1.0   25.09.2014  EMI      Adaptation to use for CSN lab 
-- 1.1   08.01.2015  KGS      Adaptation for "Table tournante"
-- 1.2   19.01.2015  EMI      Completed for the complet project 
--                            position and DC motor
-- 1.3   22.01.2015           Add some debug signals (subd, mezzanine)
--  ...
------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.maxv_pkg.all;

entity maxv_top is
  port(
    --| Clocks, Reset |-------------------------------------------------------------------
    Clk_Gen_i                : in    std_logic;     -- CLK_GEN  generate with
                                                    --   selected clock frequency (DS1)
    Clk_Main_i               : in    std_logic;     -- CLK_MAIN main clock at 1MHz
    --| Inout devices |-------------------------------------------------------------------
    Con_25p_io               : inout std_logic_vector(25 downto 1);  -- CON_25P_*
    Con_80p_io               : inout std_logic_vector(79 downto 2);  -- CON_80P_*
    Mezzanine_io             : inout std_logic_vector(20 downto 5);  -- MEZZANINE_*
    --| Input devices |-------------------------------------------------------------------
    Encoder_A_i              : in    std_logic;                      -- ENCODER_A
    Encoder_B_i              : in    std_logic;                      -- ENCODER_B
    nButton_i                : in    std_logic_vector( 8 downto 1);  -- NBUTTON_*
    nReset_i                 : in    std_logic;                      -- NRESET
    Switch_i                 : in    std_logic_vector( 7 downto 0);  -- SWITCH_*
    --| Output devices |------------------------------------------------------------------
    nLed_o                   : out   std_logic_vector( 7 downto 0);  -- NLED_*
    Led_RGB_o                : out   std_logic_vector( 2 downto 0);  -- LED_RGB_*
    nSeven_Seg_o             : out   std_logic_vector( 7 downto 0)   -- NDSP_SEG (dp, g downto a)
  );
end maxv_top;

architecture struct of maxv_top is


  --| Max-V Intermediate signals |---------------------------------------------------------
  signal Reset_s          : std_logic;
  
  signal Con_25p_DI_s   : std_logic_vector(Con_25p_io'range);
  signal Con_25p_DO_s   : std_logic_vector(Con_25p_io'range);
  signal Con_25p_OE_s   : std_logic_vector(Con_25p_io'range);
  signal Con_80p_DI_s   : std_logic_vector(Con_80p_io'range);
  signal Con_80p_DO_s   : std_logic_vector(Con_80p_io'range);
  signal Con_80p_nOE_s  : std_logic_vector(Con_80p_io'range);
  signal Mezzanine_DI_s : std_logic_vector(Mezzanine_io'range);
  signal Mezzanine_DO_s : std_logic_vector(Mezzanine_io'range);
  signal Mezzanine_OE_s : std_logic_vector(Mezzanine_io'range);
  signal Button_s       : std_logic_vector(nButton_i'range);
  signal Led_s          : std_logic_vector(nLed_o'range);
  signal Seven_Seg_s    : std_logic_vector(nSeven_Seg_o'range); -- order: dp, g f e d c b a
  signal sel_value_s    : std_logic_vector(2 downto 0);
  signal dc_pwm_en_s    : std_logic;
  signal dc_pwm_out_s   : std_logic;
  signal dc_mode_s      : std_logic_vector(2 downto 0);
  signal dir_cw_s       : std_logic;
  
  signal debug_dc_stu_s : std_logic;

  --| Application internal signals |------------------------------------------------------
  signal Cpt_s : unsigned(19 downto 0);
  signal display_val_s : std_logic_vector(15 downto 0);
  signal level_pwm_s   : std_logic_vector(7 downto 0);

  component acqu_pos_top
    port(clock_i       : in  std_logic;  --Horloge du systeme
         reset_i       : in  std_logic;  --Remise a Zero asychrone
         init_pos_i    : in  std_logic;  --Initialisation a zero, sychrone, des compteurs (pos, idx, err)
         capt_a_i      : in  std_logic;  --Encodeur phase A
         capt_b_i      : in  std_logic;  --Encodeur phase B
         dir_cw_o      : out std_logic;  --Direction: '1' CW (horaire), '0' CCW (anti-horaire)
         position_o    : out std_logic_vector(15 downto 0); --position de la table
         det_err_o     : out std_logic;  --Detection d'une erreur (double changement A et B)
         err_o         : out std_logic;  --Il y a eu une erreur de double changement A et B)
         nbr_err_o     : out std_logic_vector(4 downto 0)  --nombre d'erreur detectees
    );
  end component;
  for all : acqu_pos_top use entity work.acqu_pos_top(struct);

  
begin

  -----------------------------------------------------------------------------
  --| Management of the connector 80 pole |------------------------------------
  -- define direction for 80 poles
  --    '0' = out,   '1' = in 
   
   Con_80p_nOE_s(79)           <= '0';            -- debug debug_dc_stu_s
   Con_80p_nOE_s(78 downto 76) <= (others => '1');-- unused
   Con_80p_nOE_s(75 downto 71) <= (others => '0');
   Con_80p_nOE_s(70 downto 59) <= (others => '1');
   Con_80p_nOE_s(58 downto 56) <= (others => '0');
   Con_80p_nOE_s(55 downto 39) <= (others => '1');
   Con_80p_nOE_s(38 downto 3)  <= (others => '0');
   Con_80p_nOE_s(2)            <= '1';
    
   -- description of the tristate port for 80 pole 
   con_80pole_tristate : for i in 2 to 79 generate
   -- 80P Connector (79 downto 2)-- pins 1 and 80 are not connected to FPGA (connected to GND)
      Con_80p_io(i)    <=  Con_80p_DO_s(i)  when Con_80p_nOE_s(i) = '0'  else
                                'Z';
      Con_80p_DI_s(i)  <=  Con_80p_io(i);
   end generate;

  -----------------------------------------------------------------------------
  --| Management of the connector 25 pole |------------------------------------
  -- define direction for 25 poles 
  --    '0' = out,   '1' = in 

   Con_25p_OE_s <= (others => '0');         -- all pins out

   --use connector 25 pole for DEBUG !!!!
   Con_25p_DO_s(8 downto 1)   <= level_pwm_s;   --level of PWM for DC motor
   Con_25p_DO_s(9)            <= '0';           --not used
   Con_25p_DO_s(25 downto 10) <= display_val_s; --parameter value 16 bits selected by switch 7..5
   
   
   -- description of the tristate port for 25 pole, pin(25 downto 1) 
   con_25pole_tristate : for i in 1 to 25 generate
      Con_25p_io(i)    <=  Con_25p_DO_s(i)  when Con_25p_OE_s(i) = '0'  else
                                'Z';
      Con_25p_DI_s(i)  <=  Con_25p_io(i);
   end generate;

  -----------------------------------------------------------------------------
  --| Management of the mezzanine 16 signals |------------------------------------
  -- define direction for 16 signals
  --    '0' = out,   '1' = in 

   Mezzanine_OE_s <= (others => '0');         -- all pins out

   --use mezzanie connector for DEBUG !!!!
   Mezzanine_DO_s(5)          <= dc_pwm_en_s;    --sel mode pwm, always '1'
   Mezzanine_DO_s(6)          <= dc_pwm_out_s;   --pwm signal for DC motor
   Mezzanine_DO_s(7)          <= dc_mode_s(0);   --standby for DC motor
   Mezzanine_DO_s(9 downto 8) <= dc_mode_s(2 downto 1);  --IN2 & IN1   
   Mezzanine_DO_s(19 downto 10) <= (others => '0'); --not used (off) 
   Mezzanine_DO_s(20) <= Button_s(8);

   
   
   -- description of the tristate port for 16 pole mezzanie, pin(20 downto 5) 
   con_mezza_tristate : for i in 5 to 20 generate  --16 pins
      Mezzanine_io(i)    <=  Mezzanine_DO_s(i)  when Mezzanine_OE_s(i) = '0'  else
                                'Z';
      Mezzanine_DI_s(i)  <=  Mezzanine_io(i);
   end generate;

   
  -----------------------------------------------------------------------------
  --| INPUTS PROCESSING |------------------------------------------------------
  Reset_s <= not nReset_i;
  Button_s <= not nButton_i;
  
  
 
  -----------------------------------------------------------------------------
  --| OUTPUT PROCESSING |------------------------------------------------------
  nLed_o <= not Led_s;
  nSeven_Seg_o <= not Seven_Seg_s;


  ----------------------------------------------------------------------------------------
  --| Debug statement for Button/Switch/connectors, .. |----------------------------------

  -- decimal point blink at 1Hz, check CPLD is running
  Seven_Seg_s(Seven_Seg_s'high) <= Cpt_s(Cpt_s'high); -- decimal point blink at 1Hz
  
  Led_s(7) <= Button_s(8); --debug
  Led_s(0) <= Con_80p_DI_s(2);  --init
  

  --gestion mode etu/ref via switch 2 carte MAX-V 
  debug_dc_stu_s   <= Switch_i(2);
  Con_80p_DO_s(79)  <= debug_dc_stu_s;

  --Con_80p_DO_s(56) <= Button_s(2);
  --Con_80p_DO_s(57) <= Button_s(3);
  

  ----------------------------------------------------------------------------------------
  --| Unused output allocation |----------------------------------------------------------
  Led_RGB_o <= (others => '0');
  Seven_Seg_s(Seven_Seg_s'high-1 downto 0) <= (others => '0');
  --led_s(7) et (0) use for debug
  --led_S(3..1) affiche signal
  Led_s(6 downto 4) <= (others => '0'); --unused leds turned off 
  
  U1: acqu_pos_top port map(
    clock_i     => Clk_Main_i,
    reset_i     => Reset_s,
    init_pos_i  => Con_80p_DI_s(2),
    capt_a_i    => Con_80p_DI_s(39),
    capt_b_i    => Con_80p_DI_s(40),
    dir_cw_o    => dir_cw_s,
    position_o  => Con_80p_DO_s(19 downto 4),
    det_err_o   => Led_s(2),
    err_o       => Led_s(3),
    nbr_err_o   => open
  );
 
 
   Led_s(1)        <= dir_cw_s;
   Con_80p_DO_s(3) <= dir_cw_s;
 
   
    --pas utiliser pour acquisition position
    --Con_80p_DO_s(58)          <=  Button_s(1);    --pap_ph_en
    --Con_80p_DO_s(71)           <= dc_pwm_en_s;
    --Con_80p_DO_s(72)           <= dc_pwm_out_s;
    
-- MODIF EMI 22 janvier *************************************************
    Con_80p_DO_s(75 downto 73) <= dc_mode_s;
    --Con_80p_DO_s(75 downto 74) <= dc_mode_s(2 downto 0);
   -- Con_80p_DO_s(73)           <= not dc_mode_s(0); 
    --Switch_i(1); --for debug nStdby with Switch1
-- *************************************************************************
    
  ----------------------------------------------------------------------------------------
  --| Signal blink at 1Hz |------------------------------------------------------------------
  process (Clk_Main_i, Reset_s)
  begin
    if Reset_s = '1' then
      Cpt_s <= (others => '0');
    elsif rising_edge(Clk_Main_i) then
      Cpt_s <= Cpt_s +1;
    end if;
  end process;
  
  
  
end struct;

