-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : led_rgb_top.vhd
--
-- Description  : Top du projet de commande Led RGB avec PWM
-- 
-- Auteur       : Etienne Messerli
-- Date         : 16.11.2015
-- Version      : 0.0
-- 
-- Utilise      : Manipulation Commande d'une led RGB, cours CSN
-- 
--| Modifications |------------------------------------------------------------
-- Version   Auteur Date               Description
--  1.0       GAA    23.03.2017      Ajout d'un level converter pour adapter la luminosité de la LED (luminosité linéaire)
--  1.1       EMI    23.09.2019      Supprime generic composant "level_converter" 
--  1.2       SMS    11.11.2019      supprime composant ctrl_level_rgb, les valeurs
--                                   des pwm arrivent directement en entrées
--  1.3       EMI    14.11.2019      Ajout composant gestion_mode
--                                   Ajout generique N_LEVEL dans entité
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_rgb_top is
    generic(N_LEVEL : positive range 1 to 16 := 3;  --nombre de bits niveau intensité
            N_PWM   : positive range 1 to 16 := 8);    --nombre de bits PWM
    port(nReset_i     : in std_logic;
         clk_i        : in  std_logic;
         m_blanc_i    : in  std_logic;
         niv_r_i      : in  std_logic_vector(N_LEVEL-1 downto 0);
         niv_g_i      : in  std_logic_vector(N_LEVEL-1 downto 0);
         niv_b_i      : in  std_logic_vector(N_LEVEL-1 downto 0);
         led_r_o      : out std_logic;
         led_g_o      : out std_logic;
         led_b_o      : out std_logic;
         cycle_pwm_o  : out std_logic
    );
end led_rgb_top;

architecture struct of led_rgb_top is

  --components declaration

   component gestion_mode
      generic(N_LEVEL : positive range 1 to 16:= 8);  --nombre de bits PWM
      port(m_blanc_i : in  std_logic;
           niv_r_i   : in  std_logic_vector(N_LEVEL-1 downto 0); 
           niv_g_i   : in  std_logic_vector(N_LEVEL-1 downto 0);
           niv_b_i   : in  std_logic_vector(N_LEVEL-1 downto 0);
           niv_r_o   : out std_logic_vector(N_LEVEL-1 downto 0);
           niv_g_o   : out std_logic_vector(N_LEVEL-1 downto 0);
           niv_b_o   : out std_logic_vector(N_LEVEL-1 downto 0)
       );
    end component;
    for all: gestion_mode use entity work.gestion_mode(flot_don);

  
    component gen_3pwm
        generic(N_PWM : positive range 1 to 16:= 8);  --nombre de bits PWM
        port(reset_i     : in  std_logic;  
             clk_i       : in  std_logic;  
             level0_i    : in  std_logic_vector(N_PWM-1 downto 0);
             level1_i    : in  std_logic_vector(N_PWM-1 downto 0);
             level2_i    : in  std_logic_vector(N_PWM-1 downto 0);
             pwm_out0_o  : out std_logic;
             pwm_out1_o  : out std_logic;  
             pwm_out2_o  : out std_logic;
             cycle_pwm_o : out std_logic
        );
    end component;
    for all: gen_3pwm use entity work.gen_3pwm(struct);


    component level_converter is
    -- Generique sont supprime car ne compile pas dans Questasim ! EMI 23.09.2019
    --generic(N_LEVEL  : positive range 1 to 16 := 3;   --nombre de bit niveau intensite
    --        N_PWM    : positive range 1 to 16 := 8);  --nombre de bits PWM
        port(niv_r_i  : in  std_logic_vector(2 downto 0);
             niv_g_i  : in  std_logic_vector(2 downto 0);
             niv_b_i  : in  std_logic_vector(2 downto 0);
             ton_r_o  : out std_logic_vector(7 downto 0);
             ton_g_o  : out std_logic_vector(7 downto 0);
             ton_b_o  : out std_logic_vector(7 downto 0)
            );
    end component;
    for all: level_converter use entity work.level_converter(flot_don);
  
    --internal signals
    signal reset_s : std_logic;
    signal niv_r_s : std_logic_vector(N_LEVEL-1 downto 0);
    signal niv_g_s : std_logic_vector(N_LEVEL-1 downto 0);
    signal niv_b_s : std_logic_vector(N_LEVEL-1 downto 0);
    signal ton_r_s : std_logic_vector(N_PWM-1 downto 0);
    signal ton_g_s : std_logic_vector(N_PWM-1 downto 0);
    signal ton_b_s : std_logic_vector(N_PWM-1 downto 0);


begin

    --adaptation polarite
    reset_s <= not nReset_i;

    Bloc_gestion_mode: gestion_mode
    generic map(N_LEVEL => N_LEVEL)
    port map(m_blanc_i  => m_blanc_i,
             niv_r_i    => niv_r_i,
             niv_g_i    => niv_g_i,
             niv_b_i    => niv_b_i,
             niv_r_o    => niv_r_s,
             niv_g_o    => niv_g_s,
             niv_b_o    => niv_b_s    
    );
    

    Bloc_converter: level_converter
    --generic map(N_LEVEL => 3, 
    --           N_PWM   => N_PWM  )
    port map(niv_r_i => niv_r_s,
             niv_g_i => niv_g_s,
             niv_b_i => niv_b_s,
             ton_r_o => ton_r_s,
             ton_g_o => ton_g_s,
             ton_b_o => ton_b_s    
    );
 

    Bloc_pwm: gen_3pwm 
    generic map(N_PWM => N_PWM)
    port map(reset_i     => reset_s,
             clk_i       => clk_i,
             level0_i    => ton_r_s,
             level1_i    => ton_g_s,
             level2_i    => ton_b_s,
             pwm_out0_o  => led_r_o,
             pwm_out1_o  => led_g_o,
             pwm_out2_o  => led_b_o,
             cycle_pwm_o => cycle_pwm_o
    );

end struct;
