-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : bin_lin_2to4.vhd
--
-- Description  : decodeur 2 bits en lineaire
--                Description avec une table de verite (TDV)
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

architecture tdv of bin_lin_2to4 is

begin

  with bin_i select
    lin_o <= "0001" when "00",
             "0011" when "01",
             "0111" when "10",
             "1110" when "11",
             "XXXX" when others; --simulation

end tdv;