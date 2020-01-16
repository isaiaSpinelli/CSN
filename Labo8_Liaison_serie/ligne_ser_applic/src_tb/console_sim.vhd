-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : console_sim.vhd
--
-- Description  : Ce fichier permet l'utilisation de la console generique du REDS.
-- 
-- Auteur       : Gilles Habegger
-- Date         : 20.04.2015
-- 
-- Utilise      : -
-- 
--| Modifications |------------------------------------------------------------
-- Version   	Auteur 	Date              Description
-- 0.0			 	GHR			20.04.2015				Premiere version de console_sim
--  
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;

library work;
  use work.ligne_serie_pkg.all; 

entity console_sim is
  port(
    -- 16 switchs
    S0_sti       : in     std_logic;
    S1_sti       : in     std_logic;
    S2_sti       : in     std_logic;
    S3_sti       : in     std_logic;
    S4_sti       : in     std_logic;
    S5_sti       : in     std_logic;
    S6_sti       : in     std_logic;
    S7_sti       : in     std_logic;
    S8_sti       : in     std_logic;
    S9_sti       : in     std_logic;
    S10_sti      : in     std_logic;
    S11_sti      : in     std_logic;
    S12_sti      : in     std_logic;
    S13_sti      : in     std_logic;
    S14_sti      : in     std_logic;
    S15_sti      : in     std_logic;
    -- 2 valeurs sur 16 bits
    Val_A_sti    : in     std_logic_vector (15 downto 0);
    Val_B_sti    : in     std_logic_vector (15 downto 0);
    -- 16 LEDs
    L0_obs       : out    std_logic;
    L1_obs       : out    std_logic;
    L2_obs       : out    std_logic;
    L3_obs       : out    std_logic;
    L4_obs       : out    std_logic;
    L5_obs       : out    std_logic;
    L6_obs       : out    std_logic;
    L7_obs       : out    std_logic;
    L8_obs       : out    std_logic;
    L9_obs       : out    std_logic;
    L10_obs      : out    std_logic;
    L11_obs      : out    std_logic;
    L12_obs      : out    std_logic;
    L13_obs      : out    std_logic;
    L14_obs      : out    std_logic;
    L15_obs      : out    std_logic;
    -- 2 valeurs hexadecimales
    Hex0_obs     : out    Std_Logic_Vector ( 3 downto 0);
    Hex1_obs     : out    Std_Logic_Vector ( 3 downto 0);
    -- 2 resultats sur 16 bits
    Result_A_obs : out    std_logic_vector (15 downto 0);
    Result_B_obs : out    std_logic_vector (15 downto 0);
    -- 1 affichage 7 segments
    -- seg7_obs(0) -> DP (pas present)
    -- seg7_obs(1) -> G
    -- seg7_obs(2) -> F
    -- seg7_obs(3) -> E
    -- seg7_obs(4) -> D
    -- seg7_obs(5) -> C
    -- seg7_obs(6) -> B
    -- seg7_obs(7) -> A
    seg7_obs     : out    std_logic_vector ( 7 downto 0)
  );
end console_sim ;

architecture struct of console_sim is

  --declaration de la periode de l'horloge
  constant PERIODE    : time := 100 ns;  --periode pour console REDS !

  -- Internal signal declarations
  signal clock_s  : std_logic;
  signal s_data_s : std_logic := '0';
  signal data_s   : std_logic_vector(NBR_DATA-1 downto 0);

  component emet_serie
    generic( N : positive := 4;               -- number of data bits
             VAL_DIV : positive := 20;        -- clock divider for serial clock frequency
             PARITY_CHECK : std_logic := '1'; -- parity check ('1' : check, '0' : do not check)
             TYPE_PAR : boolean := true);     -- parity type  (true = even, false = odd)
    port( 
      clk_i     : in    std_logic;
      reset_i   : in    std_logic;
      start_i   : in    std_logic;   
      data_i    : in    std_logic_vector(N-1 downto 0);
      busy_o    : out   std_logic;
      err_par_o : out   std_logic;
      s_clk_o   : out   std_logic;
      s_data_io : inout std_logic
       );
  end component;
  for all : emet_serie use entity work.emet_serie;
 
begin

----------------------------------------------------------------------------------
--Process de generation de l'horloge
----------------------------------------------------------------------------------
  process
  begin
    clock_s <= '0',  '1' after PERIODE/2;
      wait for PERIODE;
  end process;
  
   -- Connection des signaux Val_ de la console REDS
   data_s <= "1100" & Val_A_sti;
  
  -- Instanciation du composant a simuler
  uut : emet_serie 
    generic map (N => NBR_DATA,
                 VAL_DIV => VAL_DIV,
                 PARITY_CHECK => '1',
                 TYPE_PAR => true
    )
    port map (
          clk_i     => clock_s,
          reset_i   => S15_sti,
          start_i   => S0_sti,
          data_i    => data_s,
          busy_o    => L0_obs,
          err_par_o => L1_obs,
          s_clk_o   => L2_obs,
          s_data_io => s_data_s
          
    );
   s_data_s <= 'H'; --modelise pull-up
   L3_obs   <= s_data_s;
  
end struct;
