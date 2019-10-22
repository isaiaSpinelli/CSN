-----------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : addn_c_o.vhd
-- Description  : Additionneur n bits avec carry in,
--                carry out et overflow out
--
-- Auteur       : E. Messerli
-- Date         : 10.10.2014
-- Version      : 1.0
--
-- Utilise      : Exercice cours VHDL
--
--| Modifications |-----------------------------------------------------------
-- Ver   Auteur Date         Description
-- 2.0    EMI   03-03-2016   Version additionneur avec c_in, c_out et ovr_out
-- 2-1 	  ISS   17.10.2019   Modification Ex2 Labo 3
------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity addn is
  generic (N_BITS : Positive range 1 to 31 := 10);
  port (nbr_a_i   : in  std_logic_Vector(N_BITS-1 downto 0);
        nbr_b_i   : in  std_logic_Vector(N_BITS-1 downto 0);
        cin_i      : in  std_logic;
        somme_o    : out std_logic_Vector(N_BITS-1 downto 0);
        cout_o     : out std_Logic;
        ovr_o      : out std_logic  );
end addn;

architecture flot_don of addn is

  -- signaux internes
	signal nbr_a_s, nbr_b_s : unsigned(N_BITS downto 0);
	signal cin_s			: unsigned(N_BITS downto 0);
	signal somme_s			: unsigned(N_BITS downto 0);
  
  
  --component declaration

begin

-- Etape 1: operation d'addition de base a decrire en VHDL
	
	cin_s <= (0 => cin_i, others => '0');
	
	-- converssion en unsigned
	nbr_a_s <= '0' & unsigned(nbr_a_i);
	nbr_b_s <= '0' & unsigned(nbr_b_i);
	
	-- addition avec des unsigned
	somme_s <= (nbr_a_s + nbr_b_s + cin_s);
	
	-- the carry out bit
	cout_o <= somme_s(N_BITS);    
	
	somme_o <= std_logic_Vector(somme_s(N_BITS-1 downto 0));
	      

end flot_don;
