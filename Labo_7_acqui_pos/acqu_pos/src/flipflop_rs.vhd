-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : flipflop_rs.vhd
-- Auteur       : I.S L.C  05.12.19
-- Description  : Bascule RS pour le maintien et le reset de l'erreur	
-- 
-- 
--   Table de fonctionnement synchrone
--   du flip-flop RS 
--
-- Pour R et S à '1' nous avons choisi de reset la sortie à 0
--
--    R  S |   Q+
--   ------+-------
--    0  0 |   Q
--    0  1 |   1
--    1  0 |   0
--    1  1 |   0




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
	signal Q_pres :std_logic;
	signal Q_fut :std_logic;
  
begin
  --Adaptation polarite
  
  Q_fut <= Q_pres when R_i = '0' and S_i = '0' else
		 '0' when R_i = '1' else 
		 '1' ;
  

  
  process(reset_i, clk_i)
  -- zone de déclaration
  
  begin
	-- zone des instructions séquentielles
	-- valeur par defaut des sortis
	
		if (reset_i = '1') then
			Q_pres <= '0';
		elsif (rising_edge(clk_i)) then
			Q_pres <= Q_fut;
		end if;
  
  end process;
  
  
  Q_o <= Q_pres;

end comport;
