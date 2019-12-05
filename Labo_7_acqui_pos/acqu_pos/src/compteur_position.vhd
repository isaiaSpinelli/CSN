-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : gen_3pwm.vhd
--
-- Description  : Compteur 16 bits afin d'indiquer la position de la table tournante
-- 
-- Auteur       : L.C et S.I
-- Date         : 05.12.2019
-- Version      : 0.0
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compteur_position is
   port(reset_i     : in  std_logic;
        clk_i       : in  std_logic;
        en_i    	: in  std_logic;
        init_pos_i  : in  std_logic;
        dir_cw_o    : in std_logic;
        position_o  : out  std_logic_vector(15 downto 0)
       );
end compteur_position;

architecture struct of compteur_position is

  --components declaration

  
 --declaration internal signals 
  signal position_s 			: unsigned(15 downto 0) := (others => '0');
  signal position_next_s 		: unsigned(15 downto 0) := (others => '0');
  
begin
-- Définit la position futur
	position_next_s <=  (others =>  '0') when init_pos_i = '0' else
						(position_s + 1) when dir_cw_o = '0' AND en_i = '1' else
						(position_s - 1) when dir_cw_o = '1' AND en_i = '1' else
						position_next_s;
						
-- Reseet ou met à jour la position						
	process(clk_i, reset_i)
		begin
			if(reset_i = '1') then
				position_s <= (others =>  '0');
			elsif (rising_edge(clk_i)) then
					position_s <= position_next_s;
			end if;
	end process;
	
	-- Met à jour la position 
	position_o <= std_logic_vector(position_s(15 downto 0));
		

end struct; 
