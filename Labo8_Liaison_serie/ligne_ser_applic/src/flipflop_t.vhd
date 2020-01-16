-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : flipflop_t.vhd
--
-- Description  : flipflop_t afin de générer la clock divisée
--
-- Auteur       : Isaia Spinelli et Gaetan Bacso
-- Date         : 16.01.2020
-- Version      : 1.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop_t is
   port(clk_i    : in     std_logic;
        reset_i  : in     std_logic;
        T_i      : in     std_logic;
        Q_o      : out    std_logic
   );
end flipflop_t;

architecture flot_don of flipflop_t is

  --internally signals
	signal reset_s : std_logic;
	signal Q_pres :std_logic;
	signal Q_fut :std_logic;
	
begin

	--Adaptation polarite
	Q_fut <= Q_pres when T_i = '0' else
		not Q_pres;


	process(reset_s, clk_i)
	-- zone de déclaration

	begin
	-- zone des instructions séquentielles

	-- valeur par defaut des sortis


	if (reset_s = '1') then
		Q_pres <= '0';
	elsif (rising_edge(clk_i) ) then
		Q_pres <= Q_fut;
	end if;

	end process;


	-- maj de la sortie
	Q_o <= Q_pres;

end flipflop_t;
