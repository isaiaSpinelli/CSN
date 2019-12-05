-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : level_converter.vhd
--
-- Description  : Conversion d'un niveau d'une LED en temps on (T on)
-- 
-- Auteur       : Gaetan Matthey
-- Date         : 27.03.2017
-- Version      : 1.0
-- 
-- Utilise      : 
-- 
--| Modifications |------------------------------------------------------------
-- Version   Auteur Date               Description
-- 1.1       EMI    23.09.2019      Supprime generic
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity level_converter is
   -- Generique sont supprime car ne compile pas dans Questasim ! EMI 23.09.2019
   --generic(N_LEVEL  : positive range 1 to 16 := 3;
   --        N_PWM : positive range 1 to 16 := 8);
   port(
        niv_r_i   : in  std_logic_vector(2 downto 0); 
        niv_g_i   : in  std_logic_vector(2 downto 0);
        niv_b_i   : in  std_logic_vector(2 downto 0);
        ton_r_o   : out std_logic_vector(7 downto 0);
        ton_g_o   : out std_logic_vector(7 downto 0);
        ton_b_o   : out std_logic_vector(7 downto 0)
       );
end level_converter;

architecture flot_don of level_converter is

  --internally signals

  
  

begin








end flot_don;