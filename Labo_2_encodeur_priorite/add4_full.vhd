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
-- 2.1    PMR   21-10-2019   Résolution du laboratoire
--
------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity add4_full is
  port (nbr_a_i   : in  std_logic_Vector(3 downto 0);
        nbr_b_i   : in  std_logic_Vector(3 downto 0);
        cin_i      : in  std_logic;
        somme_o    : out std_logic_Vector(3 downto 0);
        cout_o     : out std_Logic;
        ovr_o      : out std_logic  );
end add4_full;

architecture flot_don of add4_full is

  -- signaux internes
  signal sommeTemp1_s      : std_logic_Vector(0 downto 0);
  signal sommeTemp3_s      : std_logic_Vector(2 downto 0);
  signal coutMinus1_s,cout_s : std_logic;

  -- Component Declarations
  component addn
  generic(N_g : Positive range 1 to 31 := 10);
  port (nbr_a_i   : in  std_logic_Vector(N_g-1 downto 0);
        nbr_b_i   : in  std_logic_Vector(N_g-1 downto 0);
        cin_i      : in  std_logic;
        somme_o    : out std_logic_Vector(N_g-1 downto 0);
        cout_o     : out std_Logic;
        ovr_o      : out std_logic  );
  end component;

  for all : addn use entity work.addn(flot_don);

begin

  -- Port mapping des deux additioneurs internes
  ADD2 : addn
  generic map (N_g => 3)
  port map (
        nbr_a_i  => nbr_a_i(2 downto 0),
        nbr_b_i  => nbr_b_i(2 downto 0),
        cin_i    => cin_i,
        somme_o  => sommeTemp3_s,
        cout_o   => coutMinus1_s
  );

  ADD1 : addn
  generic map (N_g => 1)
  port map (
        nbr_a_i(0)  => nbr_a_i(3),
        nbr_b_i(0)  => nbr_b_i(3),
        cin_i    => coutMinus1_s,
        somme_o  => sommeTemp1_s,
        cout_o   => cout_s
  );

  -- Assignation des sorties
  somme_o <= std_logic_vector( sommeTemp1_s & sommeTemp3_s );
  cout_o <= cout_s;
  ovr_o <= coutMinus1_s xor cout_s;

end flot_don;
