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

-- Declarations

end console_sim ;

---------------------------------------------------------------------
-- Architecture simulation bloc des 3 generateurs PWM
---------------------------------------------------------------------
architecture struct_gen_3pwm of console_sim is
  
   -- Internal signal declarations
   signal clk_s  : Std_Logic := '1';  -- clock for the simulation
   constant PERIODE : time := 100 ns;
   
   component gen_3pwm
     generic(N_PWM : positive range 1 to 16);
     port(reset_i     : in Std_Logic;
          clk_i       : in  Std_Logic;
          level0_i    : in  Std_Logic_Vector(N_PWM-1 downto 0);
          level1_i    : in  Std_Logic_Vector(N_PWM-1 downto 0);
          level2_i    : in  Std_Logic_Vector(N_PWM-1 downto 0);
          pwm_out0_o  : out Std_Logic;
          pwm_out1_o  : out Std_Logic;
          pwm_out2_o  : out Std_Logic;
          cycle_pwm_o : out Std_Logic
         );
   end component;
   for all : gen_3pwm use entity work.gen_3pwm(struct);

   --internal signal
   signal level0_s : std_logic_vector(2 downto 0);
   signal level1_s : std_logic_vector(2 downto 0);
   signal level2_s : std_logic_vector(2 downto 0);
   
begin

  -- Clock generator for the simulation ---------------------------------------
  process
  begin
        clk_s <= '0', '1' after PERIODE/4, '0' after 3 * PERIODE/4;
        wait for PERIODE;
  end process;

  level0_s <= S2_sti & S1_sti & S0_sti;
  level1_s <= S6_sti & S5_sti & S4_sti;
  level2_s <= S10_sti & S9_sti & S8_sti;


  -- Instance port mappings.
  uut : gen_3pwm 
    generic map (N_PWM => 3) --simule avec 3 au lieu de 5 (moins d'etat)
    port map (reset_i     => S15_sti, 
              clk_i       => clk_s,
              level0_i    => level0_s,
              level1_i    => level1_s,
              level2_i    => level2_s,
              pwm_out0_o  => L0_obs,
              pwm_out1_o  => L1_obs,
              pwm_out2_o  => L2_obs,
              cycle_pwm_o => L3_obs
    );

end struct_gen_3pwm;
