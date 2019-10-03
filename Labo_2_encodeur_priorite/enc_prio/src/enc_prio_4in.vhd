-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : Enc_Prio_4in.vhd
-- Description  : Encodeur de priorite à 4 entrees
-- 
-- Auteur       : E. Messerli
-- Date         : 30.09.2009
-- Version      : 0.0
-- 
-- Utilise      : Labo systeme numerique 
-- 
--| Modifications |------------------------------------------------------------
-- Ver  Auteur  Date       Description
-- 1.0   GAA  31.08.2016   Adaptation fichier vhdl pour utilisation avec Quartus
-- 1.1   EMI  05.10.2016   Modifie nom architecture, adaptation mise en page
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
--use ieee.numeric_std.ALL;

entity enc_prio_4in is
   port( 
      en_i     : in     std_logic;
      in0_i    : in     std_logic;
      in1_i    : in     std_logic;
      in2_i    : in     std_logic;
      in3_i    : in     std_logic;
      detect_o : out    std_logic;
      en_o     : out    std_logic;
      num0_o   : out    std_logic;
      num1_o   : out    std_logic
   );
end enc_prio_4in ;

architecture flot_don of enc_prio_4in is



begin




end flot_don;