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
  signal num_s : std_logic_vector(1 downto 0);
  signal inAll0_s : std_logic;
  signal detect_s : std_logic ;
  signal en_s : std_logic ;
begin

  num_s <=   "11" when in3_i = '1' else
             "10" when in2_i = '1' else
             "01" when in1_i = '1' else
             "00" when in0_i = '1' else
             "00"; -- Utilisé pour la logique de l'encodeur prio 16

  inAll0_s <= '1' when (in3_i = '0' and in2_i = '0' and in1_i = '0' and in0_i = '0') else
              '0';

  detect_s <= '0' when en_i = '0' or inAll0_s = '1' else
              '1';

  en_s <= '1' when en_i = '1' and inAll0_s = '1' else
          '0';

  -- affectation valeurs de sortie
  num0_o <= num_s(0) when en_i = '1' else
            '0';
  num1_o <= num_s(1) when en_i = '1' else
            '0';
  detect_o <= detect_s;
  en_o     <= en_s;

end flot_don;
