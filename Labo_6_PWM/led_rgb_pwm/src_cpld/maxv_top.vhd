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
--   30.09.2014  EMI  Adaptation for the aff_min_max lab
--
------------------------------------------------------------------------------------------
-- Modifications :
-- Ver   Date        Engineer     Changes
-- 0.0   See header  GCD          Initial version
-- 1.0   25.09.2014  EMI          Modified to use for CSN lab 
-- 1.1   01.10.2014  GHR          Adaptation to use with the Aff_Min_Max.tcl
--                                and the board Console-USB2 to test circuit
-- 1.2   11.11.2019  SMS          Update to fit with new version of the lab, ie pwm values
--                                directly selected with switches (not up and down buttons)
------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maxv_top is
    port(
        --| Clocks, Reset |-------------------------------------------------------------------
        Clk_Gen_i                : in    std_logic;                      -- CLK_GEN
        Clk_Main_i               : in    std_logic;                      -- CLK_MAIN
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


    --| Intermediate signals |--------------------------------------------------------------
    signal Reset_s          : std_logic;
    
    signal Con_25p_DI_s   : std_logic_vector(Con_25p_io'range);
    signal Con_25p_DO_s   : std_logic_vector(Con_25p_io'range);
    signal Con_25p_OE_s   : std_logic;
    signal Con_80p_DI_s   : std_logic_vector(Con_80p_io'range);
    signal Con_80p_DO_s   : std_logic_vector(Con_80p_io'range);
    signal Con_80p_OE_s   : std_logic_vector(Con_80p_io'range);
    signal Mezzanine_DI_s : std_logic_vector(Mezzanine_io'range);
    signal Mezzanine_DO_s : std_logic_vector(Mezzanine_io'range);
    signal Mezzanine_OE_s : std_logic;
    signal Button_s       : std_logic_vector(nButton_i'range);
    signal Led_s          : std_logic_vector(nLed_o'range);
    signal Seven_Seg_s    : std_logic_vector(nSeven_Seg_o'range); -- order: dp, g f e d c b a

    --| Internal signals |------------------------------------------------------------------
    signal cpt_s : unsigned(19 downto 0);
    signal blink_1hz_s : std_logic;
    signal osc_s : std_logic;

    --| Components declaration |------------------------------------------------------------

    component led_rgb_top is
        generic(N_PWM : positive range 1 to 16:= 8);  --nombre de bits PWM
        port(nReset_i     : in Std_Logic;
             clk_i        : in  Std_Logic;
             m_blanc_i    : in  std_logic;
             niv_r_i      : in  std_logic_vector(2 downto 0);
             niv_g_i      : in  std_logic_vector(2 downto 0);
             niv_b_i      : in  std_logic_vector(2 downto 0);
             led_r_o      : out Std_Logic;
             led_g_o      : out Std_Logic;
             led_b_o      : out Std_Logic;
             cycle_pwm_o  : out Std_Logic            );
    end component;
    for all : led_rgb_top use entity work.led_rgb_top(struct);
  
    signal cycle_pwm_s : std_logic;
  
begin

    ----------------------------------------------------------------------------------------
    --| INPUTS PROCESSING |-----------------------------------------------------------------
    Reset_s <= not nReset_i;
    Button_s <= not nButton_i;
    
    ----------------------------------------------------------------------------------------
    --| OUTPUT PROCESSING |-----------------------------------------------------------------
    nLed_o <= not Led_s;
    nSeven_Seg_o <= not Seven_Seg_s;

    --| Tri-state declaration for the 80p connector |----------------------------------------
    Con_80p_OE_s(2)           <= '1'; -- used for cycle_pwm_s check
    Con_80p_OE_s(79 downto 3) <= (others => '0'); -- used as inputs 

    tri_state_loop: for I in Con_80p_io'right to Con_80p_io'left generate
        Con_80p_io(I) <= Con_80p_DO_s(I) when Con_80p_OE_s(I) = '1' else
                         'Z';
    end generate;

    Con_80p_DI_s      <= to_X01(Con_80p_io);
    
    --| Tri-state declaration for the 25p connector |----------------------------------------
    -- the 25poles connector with EINEV 287 console interface:
    -- Tri-state declaration :
    -- In/out pin map :
    -- Con_25p_DO_s( 8 downto  1) : LED (L7 downto L0)
    -- Con_25p_DI_s(16 downto  9) : Switch (S7 downto S0)
    -- Con_25p_DO_s(20 downto 17) : Hex0 (LSB) (D3 to D0)
    -- Con_25p_DO_s(24 downto 21) : Hex1 (MSB) (D3 to D0)
    -- Con_25p_DI_s(25)           : Clk

    Con_25p_OE_s( 8 downto  1) <= (others => '1'); -- outputs
    Con_25p_OE_s(16 downto  9) <= (others => '0'); -- inputs
    Con_25p_OE_s(24 downto 17) <= (others => '1'); -- outputs
    Con_25p_OE_s(25) <= '0'; -- input

    tri_state_25p_loop: for I in Con_25p_io'right to Con_25p_io'left generate
      Con_25p_io(I) <= Con_25p_DO_s(I) when Con_25p_OE_s(I) = '1' else 'Z';
    end generate;

    Con_25p_DI_s <= to_X01(Con_25p_io);


    ----------------------------------------------------------------------------------------
    --| Unused output allocation |-----------------------------------------------------------------
    --Led_RGB_o <= (others => '0');
    --Seven_Seg_s(Seven_Seg_s'high-1 downto 0) <= (others => '0');
    Seven_Seg_s(Seven_Seg_s'high) <= blink_1hz_s; -- decimal point blink at 1Hz
    --Led_s <= Button_s; --unused leds connected to button 
    
    ----------------------------------------------------------------------------------------
    --| Components intanciation |-----------------------------------------------------------
    U1: led_rgb_top 
        generic map(N_PWM => 8)
        port map(
            nReset_i     => nReset_i,
            clk_i        => Clk_Main_i,
            m_blanc_i    => Button_s(1),
            niv_r_i      => Switch_i(2 downto 0),
            niv_g_i      => Con_25p_DI_s(11 downto 9),
            niv_b_i      => Con_25p_DI_s(15 downto 13),
            led_r_o      => Led_RGB_o(0),
            led_g_o      => Led_RGB_o(1),
            led_b_o      => Led_RGB_o(2),
            cycle_pwm_o  => cycle_pwm_s
        );

    Led_s(0) <= cycle_pwm_s;
    Con_80p_DO_s(2) <= cycle_pwm_s;  -- mesure avec oscillo sur pin 1
    ----------------------------------------------------------------------------------------
    --| Generation of blink_1hz_s and oscill_s |--------------------------------------------
    process (Clk_Main_i, Reset_s)
    begin
        if Reset_s = '1' then
            cpt_s <= (others => '0');
        elsif rising_edge(Clk_Main_i) then
            cpt_s <= cpt_s +1;
        end if;
    end process;
    
    -- signal for test 
    blink_1hz_s <= cpt_s(cpt_s'high);
    -- signal ocsl_s generation:
    --     use fonction "cpt_s(9) and cpt_s(8) and cpt_s(7)" to have a frequency from 1KHz
    ---    with duty cycle of 12% on/ 75% off (25% on: very small difference!) 
    osc_s <= cpt_s(9) and cpt_s(8) and cpt_s(7); 

  
end struct;

