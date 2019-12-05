-----------------------------------------------------------------------
-- EIVD, Ecole d'ingenieurs du Canton de Vaud
-- Fichier :  LED_RGB_tb.vhd
-- Auteur  :  G. Boutillier
-- Date    :  11.02.04
--
-- Logiciels utilises
--   Simulateur   : ModelSim
--   Synthetiseur : Leonardo
--   Technologie  :
--
-- Utilise dans   : Introduction au flow VHDL
-----------------------------------------------------------------------
-- Modifications (No de version, quand, pourquoi, comment, par qui) :
-- 
-----------------------------------------------------------------------
--  Testbench pour la simulation du fichier Mux4_1.vhd
-----------------------------------------------------------------------

-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : LED_RGB_tb.vhd
--
-- Description  : Testbench pour la commande d'une LED RGB
-- 
-- Auteur       : G. Boutillier
-- Date         : ??.??.????
-- Version      : 0.0
-- 
-- Utilise      : Manipulation Commande d'une led RGB, cours CSN
-- 
--| Modifications |------------------------------------------------------------
-- Version   Auteur  Date             Description
--  1.0       SMS    12.11.2019       Adaptation pour tester le top avec en 
--                                    entrée directement les valeurs du PWM
-------------------------------------------------------------------------------

entity LED_RGB_tb is

end LED_RGB_tb;


------------------------------------------------------------------------
-- Architecture du testbench VHDL 
------------------------------------------------------------------------

library IEEE;                 -- Librairie IEEE
use IEEE.Std_Logic_1164.all;  -- Definition du type standard logic
use IEEE.Numeric_Std.all;     -- Utilise conversion Entier->Std_logic_Vector

architecture Test_Bench of LED_RGB_tb is

    component LED_RGB_top
        generic(N_PWM : positive range 1 to 16:= 8);  --nombre de bits PWM
        port(nReset_i    : in    std_logic;
             Clk_i       : in  std_logic;
             m_blanc_i   : in  std_logic;
             niv_r_i     : in  std_logic_vector(2 downto 0);
             niv_g_i     : in  std_logic_vector(2 downto 0);
             niv_b_i     : in  std_logic_vector(2 downto 0);
             led_r_o     : out std_logic;
             led_g_o     : out std_logic;
             led_b_o     : out std_logic;
             cycle_pwm_o : out std_logic
            );
    end component;
  
  
    --Simulation VHDL
    for all : LED_RGB_top use entity work.LED_RGB_top(Struct);


    --signaux internes 
    --constant Periode : time := 1000 ns;
    constant Periode   : time := 10 ns;
    constant Pas_Sim   : time := 100 ns;
    constant Pulse     : time := 5 ns;  --duree pulse signal Erreur
    constant SIZE      : positive  := 8;
    signal   Horloge_s : std_logic := '1';
    
    --signaux de detection des erreurs (check), propre a l'application
    signal Erreur_s   : std_logic := '0'; -- Erreur global
    signal R_Erreur_s : std_logic := '0'; -- Erreur Led rouge
    signal G_Erreur_s : std_logic := '0'; -- Erreur Led verte
    signal B_Erreur_s : std_logic := '0'; -- Ereur Led bleu
    signal Sim_End_s  : boolean   := false; 
    
    -- Partagee process stimuli et verif.
    
    shared variable Nbr_Err_v : natural;   
    shared variable Donnee_R  : std_logic_vector(7 downto 0) := (others => '0');
    shared variable Donnee_G  : std_logic_vector(7 downto 0) := (others => '0');
    shared variable Donnee_B  : std_logic_vector(7 downto 0) := (others => '0');

        
    --signaux intermediaires pour la simulation, propre a l'application
    signal m_blanc_sti, nReset_sti : std_logic;
    signal niv_r_sti, niv_g_sti, niv_b_sti : std_logic_vector(2 downto 0);
    signal led_r_obs, led_g_obs, led_b_obs : std_logic;
    
    signal Run_Verif : std_logic;
    signal Fin_R : std_logic := '1';
    signal Fin_G : std_logic := '1';
    signal Fin_B : std_logic := '1';
    type   LED_const_vector is array(0 to 7) of std_logic_vector(7 downto 0);
    signal LED_constant_array : LED_const_vector := (X"00", X"05", X"15", X"25", X"35", X"45", X"55", X"65");

    ----------------------------------------------------------------------------------
    -- Procedure permettant plusieurs cycles d'horloge. Le premier appel de la      --
    -- procedure termine le cycle precedent si celui-ci n'etait pas complet (par    --
    -- exemple : si on a fait quelques pas de simulation non synchronises avant,    --
    -- reset asynchrone, combinatoire, ...).                                        --
    ----------------------------------------------------------------------------------
    procedure cycle (nombre_de_cycles : Integer := 1) is
    begin
        for i in 1 to nombre_de_cycles loop
            wait until Falling_Edge(Horloge_s);
            wait for 2 ns; --assigne stimuli 2ns apres flanc montant 
        end loop;
    end cycle;


begin
----------------------------------------------------------------------------------
--Process de generation de l'horloge
----------------------------------------------------------------------------------
    process
    begin
        while not Sim_End_s loop
            Horloge_s <= '1',
                         '0' after Periode/2;
            wait for Periode;
        end loop;
        wait;
    end process;

    ---------------------------------------------------------------------------
    -- Interconnexion du module VHDL a simuler
    ---------------------------------------------------------------------------
    uut: LED_RGB_top 
    generic map(N_PWM => SIZE)
    port map (Clk_i     => Horloge_s,
              nReset_i  => nReset_Sti,
              m_blanc_i => m_blanc_sti,
              niv_r_i   => niv_r_sti,
              niv_g_i   => niv_g_sti,
              niv_b_i   => niv_b_sti,
              led_r_o   => led_r_obs,
              led_g_o   => led_g_obs,
              led_b_o   => led_b_obs
              );

    ----------------------------------------------------------------------------------
    -- Debut des pas de simulation                                                  --
    ----------------------------------------------------------------------------------
    -- Process permettant la generation de tous les stimulis
    ----------------------------------------------------------------------------------
    stimuli:process   
    --array
        variable TimeOut : time := 400000 ns;
    begin
        Nbr_Err_v := 0; --Initialise compteur d'erreur
        
        report "Debut de la simulation";

        -- Mise a zero asynchrone
        Run_Verif <='0';
        m_blanc_sti <='0';
        niv_r_sti <= "000";
        niv_g_sti <= "000";
        niv_b_sti <= "000";
        nReset_sti <= '0';  
        cycle;
        nReset_sti <= '1';

        cycle;
        Run_Verif <= '1', '0' after 20 ns;    
        cycle;
        wait until (Fin_R and Fin_G and Fin_B)='1' for TimeOut;
        -- Génération des stimulis pour 0

        -- Génération des stimulis de 1 à 8  
        for I in 1 to 7 loop   
            -- Pour la led Rouge
            niv_r_sti <= std_logic_vector(to_unsigned(I, 3));
            Donnee_R := LED_constant_array(I);
            cycle;
            niv_g_sti <= std_logic_vector(to_unsigned(I, 3));
            Donnee_G := LED_constant_array(I);
            cycle;
            niv_b_sti <= std_logic_vector(to_unsigned(I, 3));
            Donnee_B := LED_constant_array(I);
            cycle;
        
            Run_Verif <= '1', '0' after 20 ns;
            cycle; 
            
            wait until (Fin_R and Fin_G and Fin_B)='1' for TimeOut;
            
            if (Fin_R and Fin_G and Fin_B)='0' then
                report "Votre système est bo mal!!"
                    severity FAILURE;
            end if;
        end loop;

        -- Génération des stimulis de 7 à 0  
        for I in 6 downto 0 loop
            niv_r_sti <= std_logic_vector(to_unsigned(I, 3));
            Donnee_R := LED_constant_array(I);
            cycle;
            niv_g_sti <= std_logic_vector(to_unsigned(I, 3));
            Donnee_G := LED_constant_array(I);
            cycle;
            niv_b_sti <= std_logic_vector(to_unsigned(I, 3));
            Donnee_B := LED_constant_array(I);
            cycle;
        
            Run_Verif <= '1', '0' after 20 ns;
            cycle; 
            
            wait until (Fin_R and Fin_G and Fin_B)='1' for TimeOut;
            
            if (Fin_R and Fin_G and Fin_B)='0' then
                report "Votre système est bo mal!!"
                    severity FAILURE;
            end if;
        end loop;
      
        -- Génération des stimulis pour 1 à 8 (3 LEDs ensemble)
        m_blanc_sti <= '1';
        for I in 1 to 7 loop
            niv_g_sti <= std_logic_vector(to_unsigned(I, 3));
            Donnee_R  := LED_constant_array(I);
            Donnee_G  := LED_constant_array(I);
            Donnee_B  := LED_constant_array(I);
            cycle; 
            Run_Verif <= '1', '0' after 20 ns;
            cycle; 
            
            wait until (Fin_R and Fin_G and Fin_B)='1' for TimeOut;
            cycle;
            if (Fin_R and Fin_G and Fin_B)='0' then
                report "Votre système est bo mal!!"
                    severity FAILURE;
            end if;
        end loop; 
 
        -- Génération des stimulis pour 7 à 0 (3 LEDs ensemble)
        m_blanc_sti <= '1';
        for I in 6 downto 0 loop
            niv_g_sti <= std_logic_vector(to_unsigned(I, 3));
            Donnee_R  := LED_constant_array(I);
            Donnee_G  := LED_constant_array(I);
            Donnee_B  := LED_constant_array(I);
            cycle; 
            Run_Verif <= '1', '0' after 20 ns;
            cycle; 
            
            wait until (Fin_R and Fin_G and Fin_B)='1' for TimeOut;
            cycle;
            if (Fin_R and Fin_G and Fin_B)='0' then
                report "Votre système est bo mal!!"
                    severity FAILURE;
            end if;
        end loop; 

        cycle;
            
        report ">>Nombre d'erreur détecté = " & integer'image(Nbr_Err_v);
        report ">>Fin de la simulation";
        
        Sim_End_s <= true;
        wait; 
     
    end process;
    


    --------------------------------------------------  
    -- Process de verification pour la led Rouge
    --------------------------------------------------
      
    check_r: process
  
    -- variables pour le calcul des temps de la sortie
    -- au niveau haut et bas 
    variable T_FLCM_R : time :=0 ns;
    variable T_FLCD_R : time :=0 ns;
    variable T_on_R   : time :=0 ns;
    variable T_off_R  : time :=0 ns;
    
    -- variables de l'intensite lumineuse de la led
    -- pour la valeur observee et de reference
    variable R_Intensite_ref : integer :=0;
    variable R_Intensite_obs : integer :=0;
    
    begin
        while not Sim_End_s loop
            wait until Rising_Edge(Run_Verif);
            -- flag debut verif
            Fin_R <= '0';      
            
            -- "0000" cas a traiter a part
            -- car pas de flanc
            if Donnee_R = "00000000" then
                --R_Intensite_obs := 0;
                --R_Intensite_ref := 0;             
                for I in 1 to 256 loop   
                    if led_r_obs'event then
                        R_Erreur_s <= '1', '0' after 4 ns;
                        Nbr_Err_v := Nbr_Err_v + 1;
                        report"ERREUR_r"
                        severity ERROR;
                    end if;
                    cycle;
                end loop;
            else
                -- Attente d'un cycle pour la led Rouge
                -- afin de ne pas la tester durant la transition
                wait until Rising_Edge(led_r_obs);
                
                -- Calcul des temps au niveau haut et bas de la 
                -- sorti pour la led Rouge  
                wait until Rising_Edge(led_r_obs);
                T_FLCM_R := Now;
                wait until Falling_Edge(led_r_obs);
                T_FLCD_R := Now;
                wait until Rising_Edge(led_r_obs);
                T_on_R := T_FLCD_R - T_FLCM_R;
                T_off_R := Now-T_FLCD_R; 
                R_Intensite_obs := (256*T_on_R)/(T_on_R+T_off_R);
                R_Intensite_ref := To_integer(Unsigned(Donnee_R)); 
                if R_intensite_obs /= R_intensite_ref then
                    R_Erreur_s <= '1', '0' after 4 ns;
                    Nbr_Err_v := Nbr_Err_v + 1;
                    report"ERREUR_r, valeur obs = " & integer'image(R_Intensite_obs) & ", Valeur ref = " & integer'image(R_Intensite_ref)
                        severity ERROR;
                end if; 
            end if;   
            cycle;
            
            -- flag fin verif
            Fin_R <='1';
        end loop;
    end process;
  
        
    --------------------------------------------------  
    -- Process de verification pour la led Verte
    --------------------------------------------------   
      
    check_g: process
  
    -- variable pour le calcul des temps de la sortie
    -- au niveau haut et bas 
    variable T_FLCM_G : time :=0 ns;
    variable T_FLCD_G : time :=0 ns;
    variable T_on_G   : time :=0 ns;
    variable T_off_G  : time :=0 ns;
    
    -- variables de l'intensite lumineuse de la led
    -- pour la valeur observee et de reference
    variable G_Intensite_ref : integer :=0;
    variable G_Intensite_obs : integer :=0;
    
    begin
        while not Sim_End_s loop
            wait until Rising_Edge(Run_Verif);
            -- flag debut verif
            Fin_G <= '0';  
            
            -- "0000" cas a traiter a part
            -- car pas de flanc
            if Donnee_G = "00000000" then
                --G_Intensite_obs := 0;
                --G_Intensite_ref := 0;  
                for I in 1 to 256 loop   
                    if led_g_obs'event then
                        G_Erreur_s <= '1', '0' after 4 ns;
                        Nbr_Err_v := Nbr_Err_v + 1;
                        report"ERREUR_g"
                        severity ERROR;
                    end if;
                    cycle;
                end loop;
            else 
                -- Attente d'un cycle pour la led Verte
                -- afin de ne pas la tester durant la transition
                wait until Rising_Edge(led_g_obs);
                
                -- Calcul des temps au niveau haut et bas de la 
                -- sortie pour la led Verte  
                wait until Rising_Edge(led_g_obs);
                T_FLCM_G := Now;
                wait until Falling_Edge(led_g_obs);
                T_FLCD_G := Now;
                wait until Rising_Edge(led_g_obs);
                T_on_G := T_FLCD_G-T_FLCM_G;
                T_off_G := Now-T_FLCD_G; 
                G_Intensite_obs := (256*T_on_G)/(T_on_G+T_off_G);
                G_Intensite_ref := To_integer(Unsigned(Donnee_G));
                if G_intensite_obs /= G_intensite_ref then
                    G_Erreur_s <= '1', '0' after 4 ns;
                    Nbr_Err_v := Nbr_Err_v + 1;
                    report"ERREUR_g, valeur obs = " & integer'image(G_Intensite_obs) & ", Valeur ref = " & integer'image(G_Intensite_ref)
                        severity ERROR;
                end if;
            end if; 
            cycle;
            
            -- flag fin verif
            Fin_G <='1';
        end loop;
    end process;   
    
    
    --------------------------------------------------  
    -- Process de verification pour la led Bleu
    --------------------------------------------------     

    check_b: process
    
    -- variable pour le calcul des temps de la sortie
    -- au niveau haut et bas 
    variable T_FLCM_B : time :=0 ns;
    variable T_FLCD_B : time :=0 ns;
    variable T_on_B   : time :=0 ns;
    variable T_off_B  : time :=0 ns;
    
    -- variables de l'intensite lumineuse de la led
    -- pour la valeur observee et de reference
    variable B_Intensite_ref : integer :=0;
    variable B_Intensite_obs : integer :=0;
    
    begin
        while not Sim_End_s loop
            wait until Rising_Edge(Run_Verif);
            -- flag debut verif
            Fin_B <= '0';
            
            -- "0000" cas a traiter a part
            -- car pas de flanc    
            if Donnee_B = "00000000" then
                --B_Intensite_obs := 0;
                --B_Intensite_ref := 0; 
                for I in 1 to 256 loop
                    if led_b_obs'event then
                        B_Erreur_s <= '1', '0' after 4 ns;
                        Nbr_Err_v := Nbr_Err_v + 1;
                        report"ERREUR_b"
                        severity ERROR;
                    end if;
                    cycle;
                end loop;
            else    
                -- Attente d'un cycle pour la led Bleu
                -- afin de ne pas la tester durant la transition
                wait until Rising_Edge(led_b_obs);
                
                -- Calcul des temps au niveau haut et bas de la 
                -- sortie pour la led Bleu   
                wait until Rising_Edge(led_b_obs);
                T_FLCM_B := Now;
                wait until Falling_Edge(led_b_obs);
                T_FLCD_B := Now;
                wait until Rising_Edge(led_b_obs);
                T_on_B := T_FLCD_B-T_FLCM_B;
                T_off_B := Now-T_FLCD_B; 
                B_Intensite_obs := (256*T_on_B)/(T_on_B+T_off_B);
                B_Intensite_ref := To_integer(Unsigned(Donnee_B));
                if B_intensite_obs /= B_intensite_ref then
                    B_Erreur_s <= '1', '0' after 4 ns;
                    Nbr_Err_v := Nbr_Err_v + 1;
                    report"ERREUR_b, valeur obs = " & integer'image(B_Intensite_obs) & ", Valeur ref = " & integer'image(B_Intensite_ref)
                        severity ERROR;
                end if;
            end if;  
            cycle;
            
            -- flag fin verif
            Fin_B <='1';
        end loop;
    end process; 
  
-------------------------------------------------- 
    -- Erreur global  
    Erreur_s <= R_Erreur_s or G_Erreur_s or B_Erreur_s;
  
end Test_Bench;
