-----------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : dffe_en_tb.vhd
-- Description  : Testbench pour la simulation du fichier DFFE.vhd
--                
-- Auteur       : E. Messerli
-- Date         : 01.12.00
-- Version      : 1.2 
--
-- Utilise      : Exercice formation VHDL
--                                                                              
--| Modifications |-----------------------------------------------------------
-- Version   Auteur Date               Description                              
-- 1.1       GBR    07.04.2004         Mise � jour  
-- 1.2       YNG    19.09.2007         Mise � jour entete                                                                          
-- 2.0       EMI    22.10.2014    Adaptation pour nouveau fichier VHDL
--                                Changer le nom du fichier
-- 2.1       GAA    21.03.2017        Adaptation du test bench pour dff avec en
------------------------------------------------------------------------------

library IEEE;
  use IEEE.Std_Logic_1164.all;
  --use IEEE.Numeric_Std.all;

entity dff_en_tb is

end dff_en_tb;

------------------------------------------------------------------------
-- Architecture du testbench VHDL 
------------------------------------------------------------------------

architecture test_bench of dff_en_tb is

  component dff_en 
    port(clk_i    : in     std_logic;
         D_i      : in     std_logic;
         en_i     : in     std_logic;
         nReset_i : in     std_logic;
         Q_o      : out    std_logic
    );
  end component;
  for all : dff_en use entity work.dff_en(comport);

  constant Periode_c   : time := 100 ns;
  --constant Unite_Min_c : time := 1 ns;
  constant Pulse_c     : time := 4 ns;
  
  --signaux de base pour la simulation sequentiel (HORLOGE)
  signal Sim_End_s : boolean := false;
  signal Horloge_int : std_logic;           -- signal d'horloge
  
  --signaux de detection des erreurs (check), propre a l'application
  signal Erreur_s : Std_Logic := '0';
  shared variable Nbr_Err_v : Natural; --partagee process stimuli et verif
  
  --signaux intermediares pour la simulation, propre a l'application
  signal D_sti, Reset_L_sti, En_sti : std_logic;
  signal Q_obs : std_logic;
  signal Q_ref : std_logic;
  
  ---------------------------------------------------------------------------
  -- Procedure permettant plusieurs cycles d'horloge
  -- Le premier appel de la procedure termine le cycle precedent si celui-ci
  -- n'etait pas complet (par exemple : si on a fait quelques pas de 
  -- simulation non synchronises avant, reset asynchrone, combinatoire, ...)
  ---------------------------------------------------------------------------
    procedure cycle (nombre_de_cycles : Integer := 1) is
      begin
        for i in 1 to nombre_de_cycles loop
           wait until Falling_Edge(Horloge_int);
           wait for 2 ns; --assigne stimuli 2ns apres flanc montant 
        end loop;
    end cycle;
  
  begin
  
  ------------------------------------------------------------------
  --Process de generation de l'horloge
  ------------------------------------------------------------------
  process
  begin
    while not Sim_End_s loop
      Horloge_Int <= '1', '0' after Periode_c/2;
      wait for Periode_c;
    end loop;
    wait;
  end process;

---------------------------------------------------------------------------
-- Interconnexion du module VHDL a simuler
---------------------------------------------------------------------------
uut: dff_en port map (clk_i    => Horloge_int,
                      D_i       => D_sti,
                      nReset_i => Reset_L_sti,
                      en_i      => EN_sti,
                      Q_o       => Q_obs
                      );

---------------------------------------------------------------------------
-- Debut des pas de simulation
---------------------------------------------------------------------------

  process
  begin
     Nbr_Err_v := 0; -- initialise compteur d'erreur
     
     report ">> Debut de la simulation";

-----Test de la remise a zero asynchrone
	Reset_L_sti <= '0';
	En_sti <= 'X';
        D_sti <= 'X';
      	Q_ref <= '0';
        cycle;
   
	Reset_L_sti <= '1'; --Desactive le reset

-----Test du chargement avec D= 1
	En_sti <= '1';
	D_sti <= '1';
         wait until rising_edge(Horloge_int);
	Q_ref <= '1';
    	cycle;
    
-----Test du maintien a 1
	En_sti <= '0';
	D_sti <= '0';
        --Q_ref pas modifie, reste a '1'
        cycle; 

-----Test du chargement avec D= 0
	En_sti <= '1';
	D_sti <= '0';
        wait until rising_edge(Horloge_int);
	Q_ref <= '0';
        cycle;
  
-----Test du maintien a 0
	En_sti <= '0';
	D_sti <= '1';
        --Q_ref pas modifie, reste a '0'
        cycle;
      
-----Test du chargement avec D= 1
	En_sti <= '1';
	D_sti <= '1';
        wait until rising_edge(Horloge_int);
	Q_ref <=  '1'; --Etat pas modifie
	cycle;

-----Test de la priorite du Reset sur le maintien
	Reset_L_sti <= '0';
	En_sti <= '0';
	Q_ref <= '0'; --reset execute
        cycle;
    
    report ">>Nombre d'erreur d�tect�e = " & integer'image(Nbr_Err_v);
    report ">>Fin de la simulation";
        
    Sim_End_s <= true;
    wait; --Attente infinie, stop la simulation
  end process;
  
---------------------------------------------------------------------------
-- Process de verification
---------------------------------------------------------------------------
  process
  begin
    while not Sim_End_s loop
      wait until Falling_Edge(Horloge_int);
      wait for (Periode_c/2)- 2 ns;
    --Verification asynchrone
      if Q_obs /= Q_ref then
        Erreur_s <= '1', '0' after Pulse_c;
        Nbr_Err_v := Nbr_Err_v + 1;
        report"Lors verif Sortie, asynch"
          severity ERROR;
      end if;
      wait until Rising_Edge(Horloge_Int);
      wait for (Periode_c/2)- 2 ns;
    --Verification synchrone
      if Q_obs /= Q_ref then
        Erreur_s <= '1', '0' after Pulse_c;
        Nbr_Err_v := Nbr_Err_v + 1;
        report"Lors verif Sortie, synch"
          severity ERROR;
      end if;
    end loop;
    wait;
  end process;

end Test_Bench;





