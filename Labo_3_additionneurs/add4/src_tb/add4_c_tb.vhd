-----------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : add4_c_tb.vhd                                             
-- Description  : Testbench pour la simulation du fichier add4.vhd
--                                                                              
-- Auteur       : E. Messerli
-- Date         : 10.10.2014
-- Version      : 1.0
--
-- Utilise      : Exercice unite CSN & SysLog2 
--                                                                              
--| Modifications |-----------------------------------------------------------
-- Ver   Auteur       Date        Description                              
-- 2.0   G. Matthey   16.10.2015  Ajout test signal Overflow (ovr_o)
-- 2.1   E. Messerli  21.10.2015  Mis a jour commentaire generation ovr_ref
--                                et modifie nom achitecture add4: struct 
-- 2.2   E. Messerli  03-03-2016  Modifier nom entité pour simuler add_4_c
--
------------------------------------------------------------------------------

library IEEE;
  use IEEE.Std_Logic_1164.all;
  use IEEE.Numeric_Std.all;
  
entity add4_tb is

end add4_tb;

------------------------------------------------------------------------
-- Architecture du testbench VHDL 
------------------------------------------------------------------------

architecture test_bench_carry of add4_tb is

  component add4 
    port (nbr_a_i   : in  std_logic_Vector(3 downto 0);
          nbr_b_i   : in  std_logic_Vector(3 downto 0);
          cin_i     : in  std_logic;
          somme_o   : out std_logic_Vector(3 downto 0);
          cout_o    : out std_Logic;
          ovr_o     : out std_logic  );
  end component;

  for all : add4 use entity work.add4;

  -- constantes internes au test-bench
  constant Pas_Sim_c   : time := 100 ns;
  constant Pulse_c     : time := 4 ns;
  constant Unite_Min_c : time := 1 ns; -- valeur du simulateur  

  -- constante donnant la taille de l'additionneur
  constant N : integer := 4;

  --signaux de detection des erreurs (check), propre a l'application
  signal Erreur_s : std_logic := '0';
  shared variable Nbr_Err_v : integer;

  --signaux intermediaires pour la simulation, propre a l'application
  signal Nbr_A_sti, Nbr_B_sti : std_logic_Vector(N-1 downto 0);
  signal Cin_sti   : std_logic;
  signal Somme_obs : std_logic_Vector(N-1 downto 0);
  signal Cout_obs  : std_logic;
  signal Ovr_obs   : std_logic;
  
  -- signaux de reference
  signal Somme_ref : std_logic_Vector(N-1 downto 0);
  signal Cout_ref  : std_logic;
  signal Ovr_ref   : std_logic;
  

begin

  ---------------------------------------------------------------------------
  -- Interconnexion du module VHDL a simuler
  ---------------------------------------------------------------------------
  uut: add4 port map (Nbr_A_i   => Nbr_A_sti,
                      Nbr_B_i   => nbr_B_sti,
                      Cin_i     => Cin_sti,
                      Somme_o   => Somme_obs,
                      Cout_o    => Cout_obs,
                      ovr_o     => open   --pas verifie    
                     );
---------------------------------------------------------------------------
-- Debut des pas de simulation
---------------------------------------------------------------------------

  process
    --variable interne pour la simulation, propre a l'application
    variable Somme_int : integer;
    variable Cout_int  : std_logic;
   --variable Nbr_Err_v : natural;
--    variable Ovr_int   : std_logic;
    variable S_n_1     : unsigned(2 downto 0);

  begin
    
    --initialisation
    Nbr_Err_v := 0; 

    report "Début de la simulation";

    for I_NbrA in 0 to 2**N-1 loop
      for I_NbrB in 0 to 2**N-1 loop
        for I_Cin in 0 to 1 loop

          -- assignation des valeurs d'entrees
          Nbr_A_sti <= std_logic_Vector(To_Unsigned(I_NbrA,Nbr_A_sti'length));
          Nbr_B_sti <= std_logic_Vector(To_Unsigned(I_NbrB,Nbr_B_sti'length));
          if I_Cin = 1 then
            Cin_sti <= '1';
          else
            Cin_sti <= '0';
          end if;

          -- calcul des valeurs de reference
          Somme_int  := I_NbrA + I_NbrB + I_Cin;
          if Somme_int > (2**N-1) then
            Cout_int := '1';
            Somme_int := Somme_int - (2**N);
          else 
            Cout_int := '0';
          end if;
          
--  Overflow pas verifie avec cette version de tb
--           --Cas de depassement signe Overflow:
--           -- si meme signe (I_NbrA et I_NbrB) et signe different de Somme_int => overflow
--           -- cas positif: I_NbrA < 2**(N-1) and I_NbrB < 2**(N-1) and Somme_int>= 2**(N-1) => erreur
--           if ((I_NbrA < 2**(N-1)) and (I_NbrB < 2**(N-1)) and (Somme_int >= 2**(N-1))) then
--             Ovr_int := '1';
--           -- cas negatif: I_NbrA >= 2**(N-1) and I_NbrB >= 2**(N-1) and Somme_int< 2**(N-1) => erreur
--           elsif ((I_NbrA >= 2**(N-1)) and (I_NbrB >= 2**(N-1)) and (Somme_int < 2**(N-1))) then
--             Ovr_int := '1';
--           else
--             Ovr_int := '0';
--           end if;


          -- affectation des signaux _int avec les signaux de _ref
          Cout_ref <= Cout_int;
          Somme_ref <= std_logic_Vector(To_Unsigned(Somme_int,N));
--        Ovr_ref <= Ovr_int;
          
          --Verification des valeurs observes
          --verif. de somme
          wait for Pas_Sim_c/2;
          if Somme_obs /= Somme_ref then
            Erreur_s <= '1', '0' after Pulse_c;
            Nbr_Err_v := Nbr_Err_v + 1;
              report "lors verification de Somme, ValA = "
                                  & integer'image(I_NbrA)
                    & ", ValB = " & integer'image(I_NbrB)
                     & ", Cin = " & integer'image(I_Cin);
          end if;
          --verif. du carry out
          if Cout_obs /= Cout_ref then
            Erreur_s <= '1', '0' after Pulse_c;
            Nbr_Err_v := Nbr_Err_v + 1;
              report "lors verification de Cout, ValA = "
                                  & integer'image(I_NbrA)
                    & ", ValB = " & integer'image(I_NbrB)
                     & ", Cin = " & integer'image(I_Cin);
          end if;
--  Overflow pas verifie avec cette version de tb
--           --verif. de l'overflow out
--           if Ovr_obs /= Ovr_ref then
--             Erreur_s <= '1', '0' after Pulse_c;
--             Nbr_Err_v := Nbr_Err_v + 1;
--               report "lors verification de Ovr, ValA = "
--                                   & integer'image(I_NbrA)
--                     & ", ValB = " & integer'image(I_NbrB)
--                      & ", Cin = " & integer'image(I_Cin);
--           end if;
          wait for Pas_Sim_c/2;
        end loop;
      end loop;
    end loop;

    report "Nombre d'erreurs détectées = " & integer'image(Nbr_Err_v);
    report "Fin de la simulation";

    wait;  --Attente infinie, stop la simulation

  end process;
  
 
end test_bench_carry;





