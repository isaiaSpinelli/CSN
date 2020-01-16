-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : flipflop_rs.vhd
--
-- Description  : flip flop RS afin de enregistrer la valeur de parité lue
--					et reset à 0 lors d'un nouveau load.
--
-- Auteur       : Isaia Spinelli et Gaetan Bacso
-- Date         : 16.01.2020
-- Version      : 1.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop_rs is
   port(clk_i    : in     std_logic;
        reset_i  : in     std_logic;
        read_i   : in     std_logic;
        load_i   : in     std_logic;
        s_data_i : in     std_logic;
        err_par  : out    std_logic
   );
end flipflop_rs;

architecture flot_don of flipflop_rs is

  --internally signals
	signal Q_pres :std_logic := '0';
	signal Q_fut  :std_logic;
	
begin

	--Adaptation polarite
	Q_fut <= '0' when load_i = '1' else  
		Q_pres when read_i = '0' else
		s_data_i;



	process(reset_i, clk_i)
	-- zone de déclaration

	begin
	-- zone des instructions séquentielles
	-- valeur par defaut des sortis

		if (reset_i = '1') then
			Q_pres <= '0';
		elsif (rising_edge(clk_i)) then
			Q_pres <= Q_fut;
		end if;

	end process;


	err_par <= Q_pres;

end flipflop_rs;
