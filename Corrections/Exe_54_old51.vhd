-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : Exe_51.vhd
--
-- Description  : 
-- 
-- Auteur       : Paul Mauerhofer
-- Date         : 12.11.2008
-- Version      : 0.0
-- 
-- Utilise      : Correction exercice du cours BSL
-- 
--| Modifications |------------------------------------------------------------
-- Version   Auteur Date               Description
-- 
-------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.ALL;
  use ieee.numeric_std.ALL;

entity Exe_51 is
  port ( NBR_i, VC_i : in  Std_Logic_Vector(2 downto 0);
         Leds_o      : out Std_Logic_Vector(7 downto 0));
end entity Exe_51;

architecture Flot_Don of Exe_51 is
  signal N_PP_VC_s     : Std_Logic;
  signal NBR_Lin_s     : Std_Logic_Vector(7 downto 0);
  signal Not_NBR_Lin_s : Std_Logic_Vector(7 downto 0);
  
begin -- Exe_51

  -- Comparaison NBR avec VC
  N_PP_VC_s <= '1' when Unsigned(NBR_i)<Unsigned(VC_i) else
               '0';
               
  -- Bin_Lin de NBR (code repris du labo Bin Lin)
  --   Bin est NBR_i
  --   Lin est NBR_Lin_s
  with NBR_i select
    NBR_Lin_s <= "00000001" when "000",
                 "00000011" when "001",
                 "00000111" when "010",
                 "00001111" when "011",
                 "00011111" when "100",
                 "00111111" when "101",
                 "01111111" when "110",
                 "11111111" when "111",
                 "XXXXXXXX" when others; --simulation

  -- Inversion NBR_Lin
  Not_NBR_Lin_s <= not NBR_Lin_s;
  
  -- Sélection valeur Leds (MUX 2 à 1 sur 8 bits)
  with N_PP_VC_s select
    Leds_o <= NBR_Lin_s when '0',
              Not_NBR_Lin_s when '1',
              "XXXXXXXX" when others; -- simulation
              
   -- Autre solution :  Sélection valeur Leds et inversion NBR_Lin 
   -- Leds_o <= NBR_Lin_s  when N_PP_VC_s = '0' else
   --           not NBR_Lin_s;

end Flot_Don;