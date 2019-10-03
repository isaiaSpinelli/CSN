-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : enc_prio_16in_top
-- Description  : Encodeur de priorite à 16 entrees
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
-- 1.1   EMI  05.10.2016   Adaptation pour encodeur a 16 entress
--                         entity: utilise vecteurs pour in_i et num_o
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
--use ieee.numeric_std.ALL;

entity enc_prio_16in_top is
   port( 
      in_i     : in     std_logic_vector(15 downto 0);
      detect_o : out    std_logic;
      num_o    : out    std_logic_vector(3 downto 0)
   );
end enc_prio_16in_top ;

architecture struct of enc_prio_16in_top is

  -- Component Declarations
  component enc_prio_4in
    ....
  
  for all : enc_prio_4in use entity work.enc_prio_4in(flot_don);

  -- Internal Declarations  
  signal .....         : std_logic;
   
   
begin






end struct;
