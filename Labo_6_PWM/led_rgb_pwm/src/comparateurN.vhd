-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : comparateurN.vhd
--
-- Description  : Comparateur pour les ton et le compteur PWM
--
-- Auteur       : Isaia Spinelli et Tommy Gerardi
-- Date         : 24.11.2019
-- Version      : 1.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparateurN is
   generic(N_BITS  : positive range 1 to 16 := 8);
   port(
        ton_i         : in  std_logic_vector(N_BITS-1 downto 0);
        cpt_PWM_i     : in  std_logic_vector(N_BITS-1 downto 0);
        led_o         : out std_logic
       );
end comparateurN;

architecture flot_don of comparateurN is

  --internally signals
  signal ton_s      : unsigned(N_BITS-1 downto 0) := (others => '0');
  signal cpt_PWM_s  : unsigned(N_BITS-1 downto 0) := (others => '0');

begin

  ton_s     <= unsigned(ton_i);
  cpt_PWM_S <= unsigned(cpt_PWM_i);

  led_o <= '1' when ton_s > cpt_PWM_s else
            '0';

end flot_don;
