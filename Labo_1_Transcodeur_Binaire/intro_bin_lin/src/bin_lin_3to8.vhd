-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : bin_lin_3to8_flotdon.vhd
--
-- Description  : Transcodeur de binaire a lineaire 3 a 8
--                Chablon 
-- 
-- Auteur       : Etienne Messerli
-- Date         : 13.02.2019
-- Version      : 0.0
-- 
-- 
--| Modifications |------------------------------------------------------------
-- Vers   Qui   Date       Description
--  
--
-------------------------------------------------------------------------------

library ieee;
use ieee.Std_Logic_1164.all;

entity bin_lin_3to8 is
  port( bin_i  : in std_logic_vector(2 downto 0);
                -- valeur binaire en entree
        lin_o  : out std_logic_vector(7 downto 0)
                -- valeur lineaire en sortie
       );
end bin_lin_3to8 ;

architecture flot_don of bin_lin_3to8 is

begin


  lin_o(0) <= '1' ;
  lin_o(1) <= '1' when bin_i >= "001"  else
              '0';
  lin_o(2) <= '1' when bin_i >= "010"  else
              '0';
  lin_o(3) <= '1' when bin_i >= "011"  else
              '0';
  lin_o(4) <= '1' when bin_i >= "100"  else
              '0';
  lin_o(5) <= '1' when bin_i >= "101"  else
              '0';
  lin_o(6) <= '1' when (bin_i >= "110")  else
              '0';
  lin_o(7) <= '1' when (bin_i >= "111")  else
			  '0';

 
end flot_don;
