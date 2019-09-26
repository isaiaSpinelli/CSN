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
-- Ver   Date        Engineer     Chnages
-- 0.0   See header  GCD          Initial version
-- 1.0   25.09.2014  EMI          Adaptation to use for CSN lab 
--
------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.maxv_pkg.all;

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
  signal Con_80p_OE_s   : std_logic;
  signal Mezzanine_DI_s : std_logic_vector(Mezzanine_io'range);
  signal Mezzanine_DO_s : std_logic_vector(Mezzanine_io'range);
  signal Mezzanine_OE_s : std_logic;
  signal Button_s       : std_logic_vector(nButton_i'range);
  signal Led_s          : std_logic_vector(nLed_o'range);
  signal Seven_Seg_s    : std_logic_vector(nSeven_Seg_o'range); -- order: dp, g f e d c b a

  --| Internal signals |------------------------------------------------------------------
  signal Cpt_s : unsigned(19 downto 0);

  --| Components declaration |------------------------------------------------------------

  component bin_lin_2to4 is
    port( bin_i  : in std_logic_vector(1 downto 0);
                 -- valeur binaire en entree
          lin_o  : out std_logic_vector(3 downto 0)
                  -- valeur lineaire en sortie
    );
  end component;
  for all : bin_lin_2to4 use entity work.bin_lin_2to4(eq_logic);
  --for all : bin_lin_2to4 use entity work.bin_lin_2to4(tdv);
  

  
begin

  ----------------------------------------------------------------------------------------
  --| INPUTS PROCESSING |-----------------------------------------------------------------
  Reset_s <= not nReset_i;
  Button_s <= not nButton_i;
  
  ----------------------------------------------------------------------------------------
  --| OUTPUT PROCESSING |-----------------------------------------------------------------
  nLed_o <= not Led_s;
  nSeven_Seg_o <= not Seven_Seg_s;
  

  ----------------------------------------------------------------------------------------
  --| Unused output allocation |-----------------------------------------------------------------
  Led_RGB_o <= (others => '0');
  Seven_Seg_s(Seven_Seg_s'high-1 downto 0) <= (others => '0');
  Seven_Seg_s(Seven_Seg_s'high) <= Cpt_s(Cpt_s'high); -- decimal point blink at 1Hz
  
  ----------------------------------------------------------------------------------------
  --| Components intanciation |-----------------------------------------------------------
  U1: bin_lin_2to4 port map (bin_i(0) => Button_s(1),
                             bin_i(1) => Button_s(2),
                             lin_o(0) => Led_s(0),
                             lin_o(1) => Led_s(1),
                             lin_o(2) => Led_s(2),
                             lin_o(3) => Led_s(3)
                             );
  Led_s(7 downto 4) <= (others => '0'); --unused leds turned off 

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

