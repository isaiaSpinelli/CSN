-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : mux4to1_tb.vhd
-- Description  : Testbench pour la simulation du fichier mux4to1.vhd
--
-- Auteur       : Etienne Messerli
-- Date         : 07.01.2004
--
--| Modifications |------------------------------------------------------------
-- Vers   Qui   Date        Description
-- 1.0    EMI   13.08.2015  Remise a jour entete, noms signaux
--
-------------------------------------------------------------------------------

entity mux4to1_tb is
end mux4to1_tb;

------------------------------------------------------------------------
-- Architecture du testbench VHDL
------------------------------------------------------------------------

library IEEE;                 -- Librairie IEEE
use IEEE.Std_Logic_1164.all;  -- Definition du type standard logic
use IEEE.Numeric_Std.all;     -- Utilise conversion Entier->Std_logic_Vector

architecture test_bench of mux4to1_tb is

  component mux4to1
    port (sel_i              : in  std_logic_vector(1 downto 0);
          a_i, b_i, c_i, d_i : in  std_logic;
          y_o                : out std_logic                  );
  end component;
--Simulation VHDL
  for all : mux4to1 use entity work.mux4to1(flot_don);
--Simulation apres placement routage,  .... a completer
--for all : mux4to1 use entity work.......(........);

  --signaux internes
  constant Pas_Sim : time := 100 ns;
  constant Pulse   : time := 5 ns;  --duree pulse signal Erreur

  --signaux de detection des erreurs (check), propre a l'application
  signal Erreur : Std_Logic := '0';

  --signaux intermediaires pour la simulation, propre a l'application
  signal Sel_sti : Std_Logic_Vector(1 downto 0);
  signal A_sti, B_sti, C_sti, D_sti : Std_Logic;
  signal Y_obs, Y_ref : Std_Logic;

  signal Vect_sti : Std_Logic_Vector(5 downto 0); --Stimuli des entrees groupees

begin

---------------------------------------------------------------------------
-- Interconnexion du module VHDL a simuler
---------------------------------------------------------------------------
uut: mux4to1 port map (sel_i => Sel_sti,
                       a_i   => A_sti,
                       b_i   => B_sti,
                       c_i   => C_sti,
                       d_i   => D_sti,
                       y_o   => Y_obs     );

-------------------------------------------------------
-- Description des stimuli de simulation
-------------------------------------------------------
  --Affectation des stimuli sur les entrees
  Sel_sti <= Vect_sti (5 downto 4);
  D_sti   <= Vect_sti (3);
  C_sti   <= Vect_sti (2);
  B_sti   <= Vect_sti (1);
  A_sti   <= Vect_sti (0);

--processus de simulation --
  process
  --Variables internes
    variable Nbr_Err : Natural;
    variable Entrees_v : Std_Logic_Vector(3 downto 0);
    variable Sel_v : Integer;

  begin

    Nbr_Err := 0;
    report "Debut simulation";

  --Debut des pas de simulation --
    for I in 0 to ((2**6)-1) loop  --repete la boucle 64 fois

      -- Affectation des entrees
      Vect_sti <= Std_Logic_Vector(To_Unsigned(I,6));

      --Calcul la valeur de reference de Y
      Entrees_v := Std_Logic_Vector(To_Unsigned(I,4)); --valeurs des entrees DCBA
      Sel_v := I/16; --valeur de la selection ( poids binaire 5&4, d'ou division 2**4)
      Y_ref   <= Entrees_v(Sel_v);

      wait for Pas_Sim/2;	--delai de 50ns

      --Verification Y
      if Y_obs /= Y_ref then
        Erreur <= '1', '0' after Pulse;
        Nbr_Err := Nbr_Err + 1;
        assert false
          report "Lors de la verification de Y, selection = " & integer'image(Sel_v)
                                               & ", cycle = " & integer'image(I)
          severity ERROR;
      end if;

      wait for Pas_Sim/2;	--delai de 50ns

    end loop;

    assert false
      report "Nombre d'erreurs d�tect�es = " & integer'image(Nbr_Err)
      severity NOTE;

    report "Fin simulation";

    wait;  --Attente infinie, stop la simulation

  end process;

end test_bench;
