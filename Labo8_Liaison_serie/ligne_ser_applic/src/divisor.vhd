-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : divisor.vhd
--
-- Description  : Permet de divier une clock par une valeur voulue
--
-- Auteur       : Isaia Spinelli et Gaetan Bacso
-- Date         : 16.01.2020
-- Version      : 1.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ligne_serie_pkg.all;

entity divisor is
	generic(N_BITS  : positive range 1 to 16 := ilogup(VAL_DIV) );
	port(
		reset_i  	: in std_logic;
        clk_i    	: in std_logic;
        en_i	 	: in std_logic;
        load_i	 	: in std_logic;
        clk_div_o	: out std_logic
       );
end divisor;

architecture flot_don of divisor is

  --internally signals
	signal count_s      : unsigned(N_BITS-1 downto 0) := (others => '0');
	signal count_next_s : unsigned(N_BITS-1 downto 0) := (others => '0');

begin
	-- incrémentation du compteur
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
	
	-- maj de la sortie
	clk_div_o <= '1' when count_s = VAL_DIV-1 else
               '0';

end divisor;
