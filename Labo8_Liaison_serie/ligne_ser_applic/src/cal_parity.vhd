-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : cal_parity.vhd
--
-- Description  : Comparateur pour les ton et le compteur PWM
--
-- Auteur       : Isaia Spinelli et Gaetan Bacso
-- Date         : 16.01.2020
-- Version      : 1.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cal_parity is
   port(
		clk_i    	: in     std_logic;
		reset_i  	: in     std_logic;
		data_i      : in     std_logic;
		load_i      : in     std_logic;
		en_i        : in     std_logic;
		parite_o    : out    std_logic
  );
end cal_parity;

architecture flot_don of cal_parity is

  --internally signals
	signal Q_pres :std_logic := '1';
	signal Q_fut  :std_logic;

begin
	-- load à 1 par défaut ou garde l'état si c'est pas activé ou fait un xor pour calculer la parité
	Q_fut <= '1' when load_i = '1' else
		 Q_pres when en_i = '0' else
		 Q_pres xor data_i ;


	process(reset_i, clk_i)
	-- zone de déclaration

	begin
	-- zone des instructions séquentielles
	-- valeur par defaut des sortis

		if (reset_i = '1') then
			Q_pres <= '1';
		elsif (rising_edge(clk_i)) then
			Q_pres <= Q_fut;
		end if;

  end process;

  -- Met à jour la sortie
  parite_o <= Q_pres;


end flot_don;
