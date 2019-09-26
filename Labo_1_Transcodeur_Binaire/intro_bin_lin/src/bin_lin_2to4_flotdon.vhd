-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : bin_lin_2to4_flotdon.vhd
--
-- Description  : decodeur 2 bits en lineaire
--                Description par flot de donnée avec 
--                l'instruction when .. else
-- 
-- Auteur       : Etienne Messerli
-- Date         : 15.02.2015
-- Version      : 0.0
-- 
-- 
--| Modifications |------------------------------------------------------------
-- Vers   Qui   Date      Description
--
--
-------------------------------------------------------------------------------

library ieee;
use ieee.Std_Logic_1164.all;

entity bin_lin_2to4 is
  port( bin_i  : in std_logic_vector(1 downto 0);
                -- valeur binaire en entree
        lin_o  : out std_logic_vector(3 downto 0)
                -- valeur lineaire en sortie
       );
end bin_lin_2to4 ;

architecture flot_don of bin_lin_2to4 is

begin

  lin_o(0) <= '1' when bin_i .....   else
              '0';
  lin_o(1) <= '1' when .....   else
              '0';
  lin_o(2) <= '1' when  ....
  
  lin_o(3) <= '1' when  ....
  
 
end flot_don;