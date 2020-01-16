-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : gen_3pwm.vhd
--
-- Description  : Bloc comprenant 3 generateurs PWM
--                clk_sys = 1 MHz, Fpwm =976 Hz, soit periode 1.024 ms
--
-- Auteur       : Etienne Messerli
-- Date         : 10.04.2017
-- Version      : 0.0
--
-- Utilise      : Manipulation Commande d'une led RGB, cours CSN
--
--| Modifications |------------------------------------------------------------
-- Version   Auteur                             Date          Description
-- 1.0       Isaïa Spinelli et Tommy Gerardi  18.11.2019
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gen_3pwm is
   generic(N_PWM : positive range 1 to 16 := 8);
   port(reset_i     : in  std_logic;
        clk_i       : in  std_logic;
        level0_i    : in  std_logic_vector(N_PWM-1 downto 0);
        level1_i    : in  std_logic_vector(N_PWM-1 downto 0);
        level2_i    : in  std_logic_vector(N_PWM-1 downto 0);
        pwm_out0_o  : out std_logic;
        pwm_out1_o  : out std_logic;
        pwm_out2_o  : out std_logic;
        cycle_pwm_o : out std_logic
       );
end gen_3pwm;

architecture struct of gen_3pwm is

  --components declaration
component div_2n is
  generic(N_BITS  : positive range 1 to 16 := 2);
  port( reset_i  : in std_logic;
        clk_i    : in std_logic;
        en_o     : out std_logic
      );
end component div_2n;
for all: div_2n use entity work.div_2n(flot_don);

component compteurN_periode_PWM is
   generic(N_BITS  : positive range 1 to 16 := 8);
   port(en_i        : in std_logic;
        clk_i       : in std_logic;
        reset_i     : in std_logic;
        cpt_PWM_o : out std_logic_vector(N_BITS-1 downto 0);
        cycle_pwm_o : out std_logic
       );
end component compteurN_periode_PWM;
for all: compteurN_periode_PWM use entity work.compteurN_periode_PWM(flot_don);

component comparateurN is
  generic(N_BITS : positive range 1 to 16 := 8);
  port(ton_i      : in std_logic_vector(N_BITS-1 downto 0);
       cpt_PWM_i  : in std_logic_vector(N_BITS-1 downto 0);
       led_o    : out std_logic
       );
end component comparateurN;
for all: comparateurN use entity work.comparateurN(flot_don);

 --declaration internal signals
signal en_s      : std_logic := '0';
signal cpt_PWM_S : std_logic_vector(N_PWM-1 downto 0) := (others => '0');

begin

  div4clk : div_2n
  generic map(N_BITS  => 2)
  port map(reset_i    => reset_i,
           clk_i      => clk_i,
           en_o       => en_s
           );

  compteurPWM : compteurN_periode_PWM
  generic map(N_BITS    => N_PWM)
  port map(en_i         => en_s,
           clk_i        => clk_i,
           reset_i      => reset_i,
           cpt_PWM_o    => cpt_PWM_S,
           cycle_pwm_o  => cycle_pwm_o
          );

  comparateurPWM0 : comparateurN
  generic map(N_BITS => N_PWM)
  port map(ton_i      => level0_i,
           cpt_PWM_i  => cpt_PWM_S,
           led_o      => pwm_out0_o
           );

  comparateurPWM1 : comparateurN
  generic map(N_BITS => N_PWM)
  port map(ton_i      => level1_i,
           cpt_PWM_i  => cpt_PWM_S,
           led_o      => pwm_out1_o
          );

  comparateurPWM2 : comparateurN
  generic map(N_BITS => N_PWM)
  port map(ton_i      => level2_i,
           cpt_PWM_i  => cpt_PWM_S,
           led_o      => pwm_out2_o
           );

end struct;
