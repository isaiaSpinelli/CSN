-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : mux4to1.vhd
-- Description  : Multiplexeur 4 a 1, decription flot donnee
--
-- Auteur       : Etienne Messerli
-- Date         : 07.01.2004
--
--| Modifications |------------------------------------------------------------
-- Vers   Qui   Date        Description
-- 1.0    EMI   13.08.2015  Remise a jour entete, noms signaux
-- 1.1    EMI   21.09.2016  Introduit une erreur (ajout ; ligne 24)
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux4to1 is
  port (sel_i              : in  std_logic_vector(1 downto 0);
        a_i, b_i, c_i, d_i : in  std_logic;
        y_o                : out std_logic   --introduit une erreur ";" en trop!
        );
end mux4to1;

architecture flot_don of mux4to1 is
begin
   with sel_i select
     y_o <= a_i  when "00",
            b_i  when "01",
            c_i  when "10",
            d_i  when "11",
            'X'  when others; -- simulation
end flot_don;
