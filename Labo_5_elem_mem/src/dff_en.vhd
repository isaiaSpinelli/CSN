-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : dff_en_ok_a.vhd
--
-- Description  : 
-- 
-- Auteur       : Etienne Messerli
-- Date         : 22.10.2014
-- Version      : 0.0
-- 
-- Utilise      : Exercice de description d'elements memoire
--                en VHDL synthetisable
-- 
--| Modifications |------------------------------------------------------------
-- Vers.  Qui   Date         Description
-- 
-- 
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity dff_en is
   port( 
      clk_i    : in     std_logic;
      D_i      : in     std_logic;
      en_i     : in     std_logic;
      nReset_i : in     std_logic;
      Q_o      : out    std_logic
   );
end dff_en ;


architecture comport of dff_en is


begin
  --Adaptation polarite
  
  process(nReset_i, clk_i)
  -- zone de déclaration
  
	
  begin
	-- zone des instructions séquentielles
 
	-- valeur par defaut des sortis
	
	
	if (nReset_i = '0') then
		Q_o <= '0';
	elsif (rising_edge(clk_i)) then
		if (en_i = '1') then
			Q_o <= D_i;
		end if;
	end if;
  
  end process;

	
  --Q_o <= ....

end comport;
