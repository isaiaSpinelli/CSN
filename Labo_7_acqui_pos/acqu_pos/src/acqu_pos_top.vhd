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
-- Ver  Date        Qui   Description
-- 0.1  14.01.2015  EMI   version initiale "mgn_position.vhd"
-- 1.0  07.12.2015  EMI   Adaptation pour le labo de décembre 2015
--
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

   
   

   --| component declaration |--------------------------------------------

   

begin
  --polarity adaptation
  
 

  -- Instance port mappings.

  
  
  
  --| output assignment |-------------------------------------------------

  err_o <= '0';
  nbr_err_o <= "00000";
  
end struct;
