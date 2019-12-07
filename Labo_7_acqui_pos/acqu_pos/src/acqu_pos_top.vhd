--------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : acqu_pos_top.vhd 
-- Description  : Acquisition de la position de la table tournante
-- 
-- Auteur       : Etienne Messerli
-- Date         : 07.12.2015 
--
-- Utilise      : Labo csn, décembre 2015 
--  
--------------------------------------------------------------------------
-- Description : Acquisition de la position de la table tournante
--   -mesure de la position de la table, comptage incréments capteurs
--      traitement des signaux A et B de l'encodeur
--   -comptage du nombre d'erreur de l'encodeur
--   -MSS de gestion de l'encodeur de position (capt A-B)
--      sens_hr : actif si sens horaire
--      Inc_up, Inc_dn: impulsion pour comptage position
--      det_err: indique double changement simultane de A et B
--        
--| Modifications |-----------------------------------------------------------
-- Ver  Date        Qui   		Description
-- 0.1  14.01.2015  EMI   		version initiale "mgn_position.vhd"
-- 1.0  07.12.2015  EMI   		Adaptation pour le labo de décembre 2015
-- 1.1  07.12.2019  S.I - L.C	Adaptation pour le labo 7
-----------------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;  -- Defini le type standard logic

entity acqu_pos_top is
  port (clock_i       : in  std_logic;  --Horloge du systeme
        reset_i       : in  std_logic;  --Remise a Zero asychrone
        init_pos_i    : in  std_logic;  --Initialisation a zero, sychrone, des compteurs (pos, idx, err)
        capt_a_i      : in  std_logic;  --Encodeur phase A
        capt_b_i      : in  std_logic;  --Encodeur phase B
        dir_cw_o      : out std_logic;  --Direction: '1' CW (horaire), '0' CCW (anti-horaire)
        position_o    : out std_logic_vector(15 downto 0); --position de la table
        --revol_o       : out std_logic_vector(7 downto 0);  --nbr de tours (revolution) de la table
        det_err_o     : out std_logic;  --Detection d'une erreur (double changement A et B)
        err_o         : out std_logic;  --Il y a eu une erreur de double changement A et B)
        nbr_err_o     : out std_logic_vector(4 downto 0)  --nombre d'erreur detectees
  );
end acqu_pos_top;

architecture struct of acqu_pos_top is 
   --| internal signal declarations |-------------------------------------

	signal det_err_s : std_logic;
	signal enable_s : std_logic;
	signal dir_cw_s : std_logic;
   
   

   --| component declaration |--------------------------------------------
   -- Machine d'état 
	component mss
		port(
		reset_i     : in  std_logic;
		clk_i       : in  std_logic;
		capt_a_i    : in  std_logic;
		capt_b_i    : in  std_logic;
		det_err_o   : out std_logic;
		dir_cw_o    : out std_logic;
		en_o	    : out std_logic
		);
  end component;
  -- Compteur de position
  component compteur_position
		port(
		reset_i     : in  std_logic;
		clk_i       : in  std_logic;
        en_i    	: in  std_logic;
        init_pos_i  : in  std_logic;
        dir_cw_i    : in std_logic;
        position_o  : out  std_logic_vector(15 downto 0)
		);
  end component;
  -- Flip flop RS
  component flipflop_rs
		port(
		clk_i    : in     std_logic;
        reset_i  : in     std_logic;
        R_i      : in     std_logic;
        S_i      : in     std_logic;
        Q_o      : out    std_logic
		);
  end component;

  for all : mss use entity work.mss(struct);
  for all : compteur_position use entity work.compteur_position(struct);
  for all : flipflop_rs use entity work.flipflop_rs(comport);
   

begin
  --polarity adaptation
  
 

  -- Instance port mappings.
	MSS1 : mss port map (
		reset_i		=> reset_i,
		clk_i      	=> clock_i,
		capt_a_i    => capt_a_i,
		capt_b_i  	=> capt_b_i,
		det_err_o 	=> det_err_s,
		dir_cw_o   	=> dir_cw_s,
		en_o		=> enable_s
  );
  
	COMPTEUR_POS : compteur_position port map (
		reset_i		=> reset_i,
		clk_i      	=> clock_i,
        en_i    	=> enable_s,
        init_pos_i  => init_pos_i,
        dir_cw_i    => dir_cw_s,
        position_o  => position_o
	);
	
	FLIPFLOP_RS_ERR : flipflop_rs port map (
		reset_i		=> reset_i,
		clk_i      	=> clock_i,
        R_i      	=> init_pos_i,
        S_i      	=> det_err_s,
        Q_o      	=> det_err_o
	);
  
  
  
  --| output assignment |-------------------------------------------------


  dir_cw_o <= dir_cw_s;
  err_o <= '0';
  nbr_err_o <= "00000";
  
end struct;
