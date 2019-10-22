-----------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : add4_c_o.vhd
-- Description  : Additionneur 4 bits avec carry in,
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
-- 2-1 	  ISS   17.10.2019   Modification Ex3 Labo 3 (add full 4 bits)
------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity add4 is
  port (nbr_a_i   : in  std_logic_Vector(3 downto 0);
        nbr_b_i   : in  std_logic_Vector(3 downto 0);
        cin_i      : in  std_logic;
        somme_o    : out std_logic_Vector(3 downto 0);
        cout_o     : out std_Logic;
        ovr_o      : out std_logic  );
end add4;

architecture flot_don of add4 is

	--component declaration
	component addn
	generic (N_BITS : Positive range 1 to 31 := 10);
	port (nbr_a_i   : in  std_logic_Vector(N_BITS-1 downto 0);
		nbr_b_i   : in  std_logic_Vector(N_BITS-1 downto 0);
		cin_i      : in  std_logic;
		somme_o    : out std_logic_Vector(N_BITS-1 downto 0);
		cout_o     : out std_Logic;
		ovr_o      : out std_logic  );
	end component;

	for all : addn use entity work.addn(flot_don);
  
	-- signaux internes
	signal sommeLSB      	: std_logic_Vector(0 downto 0);
	signal sommeMSB      	: std_logic_Vector(2 downto 0);
	signal cn_1_s,cn_s 		: std_logic;

begin

	-- port mapping des components
	ADD3 : addn
	generic map (N_BITS => 3)
	port map (
		nbr_a_i  => nbr_a_i(2 downto 0),
		nbr_b_i  => nbr_b_i(2 downto 0),
		cin_i    => cin_i,
		somme_o  => sommeMSB,
		cout_o   => cn_1_s
	);

	ADD1 : addn
	generic map (N_BITS => 1)
	port map (
		nbr_a_i(0)  => nbr_a_i(3),
		nbr_b_i(0)  => nbr_b_i(3),
		cin_i    => cn_1_s,
		somme_o  => sommeLSB,
		cout_o   => cn_s
	);
	
	-- assignement des sorties
	somme_o <= std_logic_vector( sommeLSB & sommeMSB  );
	cout_o <= cn_s;
	ovr_o <= cn_1_s xor cn_s;
	      

end flot_don;
