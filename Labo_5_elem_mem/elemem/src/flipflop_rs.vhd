-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : flipflop_rs.vhd
-- Auteur       : Etienne Messerli,  20.04.2017
-- Description  : Flip-flop RS
-- 
-- 
-- Utilise      : Exos description d'elements memoire en VHDL synthetisable
--| Modifications |------------------------------------------------------------
-- Vers.  Qui   Date         Description
--
-------------------------------------------------------------------------------

--   Table de fonctionnement synchrone
--   du flip-flop RS
--
--    R  S |   Q+
--   ------+-------
--    0  0 |   Q
--    0  1 |   1
--    1  0 |   0
--    1  1 | interdit




library ieee;
  use ieee.std_logic_1164.all;

entity flipflop_rs is
   port(clk_i    : in     std_logic;
        reset_i  : in     std_logic;
        R_i      : in     std_logic;
        S_i      : in     std_logic;
        Q_o      : out    std_logic
   );
end flipflop_rs ;


architecture comport of flipflop_rs is

begin
  --Adaptation polarite
  
  

  
  process(reset_i, clk_i)
  -- zone de déclaration
  
	
	
  begin
	-- zone des instructions séquentielles
 
	-- valeur par defaut des sortis
	
	
	
	if (reset_i = '1') then
		Q_o <= '0';
	elsif (rising_edge(clk_i)) then
		if () then
		
	end if;
  
  end process;

  
  
  end process;


end comport;
