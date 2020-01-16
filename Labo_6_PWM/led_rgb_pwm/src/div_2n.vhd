-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : div_2n.vhd
--
-- Description  : Divise la clock par une puissance de 2
--
-- Auteur       : Isaia Spinelli et Tommy Gerardi
-- Date         : 24.11.2019
-- Version      : 1.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity div_2n is
generic(N_BITS  : positive range 1 to 16 := 2);
   port(
        reset_i  : in std_logic;
        clk_i    : in std_logic;
        en_o     : out std_logic
       );
end div_2n;

architecture flot_don of div_2n is

  --internally signals
signal count_s : unsigned(N_BITS-1 downto 0) := (others => '0');

begin

  process(clk_i, reset_i)
    begin
      if(reset_i = '1') then
        count_s <= (others => '0');
      elsif(rising_edge(clk_i)) then
        count_s <= count_s + 1;
      end if;
  end process;

  en_o <= '1' when count_s = (2**N_BITS)-1 else
          '0';

end flot_don;
