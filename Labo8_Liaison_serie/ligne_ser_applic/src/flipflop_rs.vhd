-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : flipflop_rs.vhd
--
-- Description  : flip flop RS sans etat interdit définie à 1
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
        R_i      : in     std_logic;
        S_i      : in     std_logic;
        Q_o      : out    std_logic
   );
end flipflop_rs;

architecture flot_don of flipflop_rs is

  --internally signals
	signal Q_pres :std_logic := '0';
	signal Q_fut  :std_logic;
	
begin

	--Adaptation polarite
  Q_fut <= Q_pres when R_i = '0' and S_i = '0' else
		'1' when R_i = '0' and S_i = '1' else
		'0' when R_i = '1' and S_i = '0' else 
		'1';



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


	Q_o <= Q_pres;

end flot_don;
