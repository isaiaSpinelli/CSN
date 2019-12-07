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
-- Ver  Qui    Date        Description
-- 1.0  EMI   22.05.2015   Intanciation du composant gen_pwm_top
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

architecture struct of console_sim is

  constant PERIODE    : time := 100 ns;  --periode pour console REDS !
  signal   clock_s    : std_logic := '0';
  
  component acqu_pos_top port(
	clock_i       : in  std_logic;  --Horloge du systeme
	reset_i       : in  std_logic;  --Remise a Zero asychrone
	init_pos_i    : in  std_logic;  --Initialisation a zero, sychrone, des compteurs (pos, idx, err)
	capt_a_i      : in  std_logic;  --Encodeur phase A
	capt_b_i      : in  std_logic;  --Encodeur phase B
	dir_cw_o      : out std_logic;  --Direction: '1' CW (horaire), '0' CCW (anti-horaire)
	position_o    : out std_logic_vector(15 downto 0); --position de la table
	--revol_o       : out std_logic_vector(7 downto 0);  --nbr de tours (revolution) de la table
	det_err_o     : out std_logic;  --Detection d'une erreur (double changement A et B)
	err_o         : out std_logic;  --Il y a eu une erreur de double changement A et B)
	nbr_err_o     : out std_logic_vector(4 downto 0)  --nombre d'erreur detectees
      );
  end component;
  for all : acqu_pos_top use entity work.acqu_pos_top(struct);
  
  --declaration de signaux internes
  signal position_s : std_logic_vector(15 downto 0);
  signal nbr_err_s : std_logic_vector(4 downto 0);
  
  
begin

----------------------------------------------------------------------------------
--Process de generation de l'horloge
  process
  begin
    clock_s <= '0',  '1' after PERIODE/2;
      wait for PERIODE;
  end process;

----------------------------------------------------------------------------------
-- Instanciation du composant a simuler
   uut: acqu_pos_top port map(
     clock_i      => clock_s,
     reset_i      => S15_sti,
	 init_pos_i	  => S0_sti,
	 capt_a_i 	  => S1_sti,
	 capt_b_i 	  => S2_sti,
	 dir_cw_o     => L0_obs,
     position_o   => position_s,
     det_err_o 	  => L1_obs,
     err_o 		  => L2_obs,
     nbr_err_o 	  => nbr_err_s
     );
   
  Result_A_obs <= position_s;
  Result_B_obs(15 downto 0) <= (others => '0');
  -- revol_o pas affiche
  L3_obs <= nbr_err_s(0);
  L4_obs <= nbr_err_s(1);
  L5_obs <= nbr_err_s(2);
  L6_obs <= nbr_err_s(3);
  
end struct;
