-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : enc_prio_8in_top_tb.vhd
--
-- Description  : 
-- 
-- Auteur       : Messerli
-- Date         : 30.09.2009
-- Version      : 0.0
-- 
-- Utilise      : Ce fichier est genere automatiquement par le logiciel 
--              : \"HDL Designer Series HDL Designer\".
-- 
--| Modifications |------------------------------------------------------------
-- Version   Auteur Date               Description
--   1.0      GAA   31.08.2016        Adapatation du fichier pour utilisation avec Questasim
--
-------------------------------------------------------------------------------

entity enc_prio_16in_top_tb is

end enc_prio_16in_top_tb ;


------------------------------------------------------------------------
-- Architecture du testbench VHDL 
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

architecture Test_Bench of enc_prio_16in_top_tb is

  component enc_prio_16in_top
   port(      
      in_i     : in     std_logic_vector(15 downto 0);
      detect_o : out    std_logic;
      num_o    : out    std_logic_vector(3 downto 0)
       );
  end component;
  for all : enc_prio_16in_top use entity work.enc_prio_16in_top(struct);
  
  --signaux internes 
  constant Pas_Sim_c : time := 100 ns;
  constant Pulse_c   : time := 4 ns;

  --signaux de detection des erreurs (check), propre a l'application
  signal Err_Num_s : std_logic := '0';
  signal Err_Detect_s : std_logic := '0';
  shared variable Nbr_Err_v : integer;

  signal num_obs : std_logic_vector(3 downto 0);
  signal detect_obs : std_logic;
  
  --signal interne pour la simulation, propre a l'application
  signal vect_in_sti : std_logic_vector(15 downto 0);
    --variables pour le calcul de l'états des sorties
  signal Detect_ref : std_logic;
  signal Num_ref : std_logic_vector(3 downto 0);


begin

---------------------------------------------------------------------------
-- Debut des pas de simulation
---------------------------------------------------------------------------
uut: enc_prio_16in_top 
port map (  
  --Affectation des signaux
    in_i => vect_in_sti,
    num_o => num_obs,
    detect_o => detect_obs
);

  process
  
    --variables pour le compter le nombre total d'erreurs
    variable Val_In_v : Natural;
    variable Pas_Test_v : Natural;
  begin

    Nbr_Err_v := 0; --Initialise compteur d'erreur
    Pas_Test_v := 0; --Initialise numero du pas de test

      report "Debut de la simulation";

    --test de toutes les combinaisons 2**Nbr_entrees
    for I in 0 to (2**(vect_in_sti'length)-1) loop
      Pas_Test_v := Pas_Test_v + 1;

      --Affecte les valeurs en entree du systeme a tester
      vect_in_sti <= std_logic_vector(To_Unsigned(I,vect_in_sti'length));

    --Calcul des valeurs observees
      if I >= 32768 then 
        Detect_ref <= '1';
        Num_ref <= "1111"; --In15 active
      elsif I >= 16384 then
        Detect_ref <= '1'; 
        Num_ref <= "1110"; --In14 active      
      elsif I >= 8192 then
        Detect_ref <= '1'; 
        Num_ref <= "1101"; --In13 active      
      elsif I >= 4096 then
        Detect_ref <= '1'; 
        Num_ref <= "1100"; --In12 active      
      elsif I >= 2048 then
        Detect_ref <= '1'; 
        Num_ref <= "1011"; --In11 active      
      elsif I >= 1024 then
        Detect_ref <= '1'; 
        Num_ref <= "1010"; --In10 active      
      elsif I >= 512 then
        Detect_ref <= '1'; 
        Num_ref <= "1001"; --In9 active           
      elsif I >= 256 then
        Detect_ref <= '1'; 
        Num_ref <= "1000"; --In8 active      
      elsif I >= 128 then
        Detect_ref <= '1'; 
        Num_ref <= "0111"; --In7 active      
      elsif I >= 64 then
        Detect_ref <= '1'; 
        Num_ref <= "0110"; --In6 active
      elsif I >= 32 then
        Detect_ref <= '1'; 
        Num_ref <= "0101"; --In5 active
      elsif I >= 16 then
        Detect_ref <= '1'; 
        Num_ref <= "0100"; --In4 active
      elsif I >= 8 then
        Detect_ref <= '1'; 
        Num_ref <= "0011"; --In3 active
      elsif I >= 4 then
        Detect_ref <= '1'; 
        Num_ref <= "0010"; --In2 active
      elsif I >= 2 then
        Detect_ref <= '1'; 
        Num_ref <= "0001"; --In1 active
      elsif I >= 1 then
        Detect_ref <= '1'; 
        Num_ref <= "0000"; --In0 active
      else
        Detect_ref <= '0'; 
        Num_ref <= "00--"; --etat indiferent
      end if;
      
      
      --attente d'un demi pas simulation
      wait for Pas_Sim_c/2;
 
      --Verification de Detect
      if Detect_obs /= Detect_ref then
          report "Erreur sur le signal Detect au cycle :" & integer'image(Pas_Test_v)
          severity error;
        Err_Detect_s <= '1', '0' after Pulse_c;
        Nbr_Err_v := Nbr_Err_v + 1;
      end if;

      --Verification de Num
      if Num_ref = "00--" then
        --Pas de vérification
      elsif num_obs /= Num_ref then
        Err_Num_s <= '1', '0' after Pulse_c;
        Nbr_Err_v := Nbr_Err_v + 1;
        report "Erreur sur le signal Num au cycle :" & integer'image(Pas_Test_v)
          severity error;
      end if;

      --attente d'un pas simulation
      wait for Pas_Sim_c/2;
    end loop;

    --test de combinaisons non reguliere
    Val_In_v := 3; --commnece à une valeur arbitraire
    for I in 0 to (2**(vect_in_sti'length)-1) loop
      Pas_Test_v := Pas_Test_v + 1;

      -- calcul une valuer incremente de + 7
      Val_In_v := (Val_In_v + 7) mod 2**(vect_in_sti'length); 
      --Affecte les valeurs en entree du systeme a tester
      vect_in_sti <= std_logic_vector(To_Unsigned(Val_In_v,vect_in_sti'length));

      --Calcul des valeurs observees
      if Val_In_v >= 32768 then 
        Detect_ref <= '1';
        Num_ref <= "1111"; --In15 active
         elsif Val_In_v >= 16384 then
        Detect_ref <= '1'; 
        Num_ref <= "1110"; --In14 active      
        elsif Val_In_v >= 8192 then
        Detect_ref <= '1'; 
        Num_ref <= "1101"; --In13 active      
        elsif Val_In_v >= 4096 then
        Detect_ref <= '1'; 
        Num_ref <= "1100"; --In12 active      
        elsif Val_In_v >= 2048 then
        Detect_ref <= '1'; 
        Num_ref <= "1011"; --In11 active      
        elsif Val_In_v >= 1024 then
        Detect_ref <= '1'; 
        Num_ref <= "1010"; --In10 active      
        elsif Val_In_v >= 512 then
        Detect_ref <= '1'; 
        Num_ref <= "1001"; --In9 active           
        elsif Val_In_v >= 256 then
        Detect_ref <= '1'; 
        Num_ref <= "1000"; --In8 active      
        elsif Val_In_v >= 128 then
        Detect_ref <= '1'; 
        Num_ref <= "0111"; --In7 active      
        elsif Val_In_v >= 64 then
        Detect_ref <= '1'; 
        Num_ref <= "0110"; --In6 active
      elsif Val_In_v >= 32 then
        Detect_ref <= '1'; 
        Num_ref <= "0101"; --In5 active
      elsif Val_In_v >= 16 then
        Detect_ref <= '1'; 
        Num_ref <= "0100"; --In4 active
      elsif Val_In_v >= 8 then
        Detect_ref <= '1'; 
        Num_ref <= "0011"; --In3 active
      elsif Val_In_v >= 4 then
        Detect_ref <= '1'; 
        Num_ref <= "0010"; --In2 active
      elsif Val_In_v >= 2 then
        Detect_ref <= '1'; 
        Num_ref <= "0001"; --In1 active
      elsif Val_In_v >= 1 then
        Detect_ref <= '1'; 
        Num_ref <= "0000"; --In0 active
      else
        Detect_ref <= '0'; 
        Num_ref <= "00--"; --etat indiferent
      end if;
      
      --attente d'un demi pas simulation
      wait for Pas_Sim_c/2;
 
      --Verification de Detect
      if Detect_obs /= Detect_ref then
          report "Erreur sur le signal Detect au cycle :" & integer'image(Pas_Test_v)
          severity error;
        Err_Detect_s <= '1', '0' after Pulse_c;
        Nbr_Err_v := Nbr_Err_v + 1;
      end if;

      --Verification de Num
      if Num_ref = "00--" then
        --Pas de vérification
      elsif num_obs /= Num_ref then
        Err_Num_s <= '1', '0' after Pulse_c;
        Nbr_Err_v := Nbr_Err_v + 1;
        report "Erreur sur le signal Num au cycle :" & integer'image(Pas_Test_v)
          severity error;
      end if;

      --attente d'un pas simulation
      wait for Pas_Sim_c/2;
    end loop;

    -- Test d'un cas erronne, verification detection erreur
    Pas_Test_v := Pas_Test_v + 1;
    report ">>Erreur volontaire, validation du banc de test!, cycle :" & integer'image(Pas_Test_v);
    Val_In_v := 189; -- In7 est active, Num = 7
    vect_in_sti <= std_logic_vector(To_Unsigned(Val_In_v,vect_in_sti'length));

    Detect_ref <= '1'; 
    Num_ref <= "0101"; --In5 active ERREUR
    --attente d'un demi pas simulation
    wait for Pas_Sim_c/2;
 
    --Verification de Detect
    if Detect_obs /= Detect_ref then
        report "Erreur sur le signal Detect au cycle :" & integer'image(Pas_Test_v)
        severity error;
      Err_Detect_s <= '1', '0' after Pulse_c;
      Nbr_Err_v := Nbr_Err_v + 1;
    end if;

    --Verification de Num
    if Num_ref = "00--" then
      --Pas de vérification
    elsif num_obs /= Num_ref then
      Err_Num_s <= '1', '0' after Pulse_c;
      Nbr_Err_v := Nbr_Err_v + 1;
      report "Erreur sur le signal Num au cycle :" & integer'image(Pas_Test_v)
        severity error;
    end if;

    --attente d'un pas simulation
    wait for Pas_Sim_c/2;


    report ">>Nombre d'Erreur_s détectée = " & integer'image(Nbr_Err_v);
    if Nbr_Err_v = 1 then
      report ">> BRAVO, votre composant est fonctionnel !!!";
    else
      report ">> Il y a comme un bug dans le composant !!!";
      report ">> Courage, vous allez trouver l'erreur.";
      report ">> Analyser les traces dans le wave, si nécessaire ajouter des signaux intermédiaires";
    end if;
    
    report ">>Fin de la simulation";

    wait;  --Attente infinie, stop la simulation

  end process;
  
end architecture Test_Bench;
