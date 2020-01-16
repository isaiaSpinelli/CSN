-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : compteurN_periode_PWM.vhd
--
-- Description  : Compteur de periodes PWM
--
-- Auteur       : Tommy Gerardi et Isaia Spinelli
-- Date         : 24.11.2019
-- Version      : 1.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compteurN_periode_PWM is
   generic(N_BITS  : positive range 1 to 16 := 8);
   port(en_i        : in std_logic;
        clk_i       : in std_logic;
        reset_i     : in std_logic;
        cpt_PWM_o   : out std_logic_vector(N_BITS-1 downto 0);
        cycle_pwm_o : out std_logic
       );
end compteurN_periode_PWM;

architecture flot_don of compteurN_periode_PWM is

  --internally signals
signal count_s      : unsigned(N_BITS-1 downto 0) := (others => '0');
signal count_next_s : unsigned(N_BITS-1 downto 0) := (others => '0');
begin

count_next_s <= count_s + 1;

process(clk_i, reset_i)
  begin
    if(reset_i = '1') then
      count_s <= (others => '0');
    elsif(rising_edge(clk_i)) then
      if(en_i = '1') then
        count_s <= count_next_s;
      end if;
    end if;
end process;

cpt_PWM_o <= std_logic_vector(count_s(N_BITS-1 downto 0));
cycle_pwm_o <= '1' when count_s = (2**N_BITS)-1 else
               '0';

end flot_don;
