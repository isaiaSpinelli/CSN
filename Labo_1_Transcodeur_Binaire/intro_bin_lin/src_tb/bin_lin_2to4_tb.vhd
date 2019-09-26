-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : bin_lin_2to4_tb.vhd
--
-- Description  : Test bench du decodeur 2 bits en lineaire
-- 
-- Auteur       : Maurice Gaumain
-- Date         : 01.02.2003
-- Version      : 0.0
-- 
-- 
--| Modifications |------------------------------------------------------------
-- Vers  Qui  Date       Description
-- 1.0   EMI  15.02.2015 Adaptation à la nouvelle convention pour identificateurs
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity bin_lin_2to4_tb is
end bin_lin_2to4_tb ;

architecture test_bench of bin_lin_2to4_tb is

  component bin_lin_2to4
    port( bin_i  : in std_logic_vector(1 downto 0);
                  -- valeur binaire en entree
          lin_o  : out std_logic_vector(3 downto 0)
                 -- valeur lineaire en sortie
         );
   end component;
 --Decommenter la ligne de la description souhaitee pour la simulation auto
   for all : bin_lin_2to4 use entity work.bin_lin_2to4(eq_logic);
   --for all : bin_lin_2to4 use entity work.bin_lin_2to4(tdv);
   --for all : bin_lin_2to4 use entity work.bin_lin_2to4(flot_don);

  --simulation apres routage
  --for IC_test : Bin_Lin_2to4 use entity work.Bin_Lin_2to4(\epm7064slc44-10\);

   -- les entrees _Sti (valeurs de pour les STImulies)
   signal Val_Bin_Sti              : Std_Logic_Vector(1 downto 0);
   -- les sorties _Obs (valeurs OBServees)
   --             _Ref (valeurs de REFerences)
   signal Val_Lin_Obs, Val_lin_Ref : Std_Logic_Vector(3 downto 0);

   signal erreur    : Std_logic := '0';
   Shared Variable Nb_Erreur : integer ;
   signal Fin_sim   : boolean := false ;
   constant Pas_sim : time := 100 ns ;
   constant Retard  : time := 50 ns;

begin
   uut : bin_lin_2to4 port map (bin_i => Val_Bin_Sti,
                                     -- sortie --
                                lin_o => Val_Lin_Obs);


  --Process de generation des stimuli (sti) et reference (ref)
  process 
  
  begin
     -- initialiser les signaux
     NB_erreur := 0;
     Fin_Sim <= False;
  
     -- message de debut
     report "debut de simulation " ;
  
     For VB in 0 to 3 loop
  
        -- valeur des entrees --
        Val_Bin_Sti <= Std_Logic_Vector(to_Unsigned(VB,2)) ;
  
        -- valeur de la reference --
        Val_Lin_Ref <= "0000" ;
           For I in 0 to 3 loop
              IF I<=VB then
                 Val_Lin_Ref(I) <= '1' ;
              end if ;
           end loop ;
        wait for pas_sim;
     end loop ;
     Fin_sim <= true;
        wait for pas_sim;
  
     -- messages de fin
     if (Nb_erreur = 0) then
        report " *** VOUS ETES LES MEILLEURS *** ";
        report " *** BRAVO, pas d'erreur *** ";
     else
        report " *** VOUS AVEZ ENCORE UN PEU DE TRAVAIL, COURAGE *** ";
        report " *** vous avez " & integer'image(Nb_erreur) & " erreur(s) *** ";
     end if ;
     wait ;
  end process;

  -- pour le controle
  process
     variable VBin : integer;
  begin
     if not Fin_Sim then
        wait for Retard;
        if Val_Lin_Obs /= Val_Lin_Ref then
           VBin := to_integer(Unsigned(Val_Bin_Sti));
           Nb_erreur := Nb_erreur + 1;
           erreur <= '1' , '0' after 10 ns;
           report " erreur pour Val_Bin = " &  integer'image(VBin) ;
        end if ;
        wait for pas_sim - retard;
     else
        wait;
     end if;
  end process ;

end test_bench;



