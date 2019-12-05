-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : gen_3pwm.vhd
--
-- Description  : Bloc comprenant 3 generateurs PWM
--                clk_sys = 1 MHz, Fpwm =976 Hz, soit periode 1.024 ms
-- 
-- Auteur       : Etienne Messerli
-- Date         : 10.04.2017
-- Version      : 0.0
-- 
-- Utilise      : Manipulation Commande d'une led RGB, cours CSN
-- 
--| Modifications |------------------------------------------------------------
-- Version   Auteur Date               Description
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gen_3pwm is
   generic(N_PWM : positive range 1 to 16 := 8);
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
end gen_3pwm;

architecture struct of gen_3pwm is

  --components declaration

  
 --declaration internal signals 
  
  
begin











end struct; 
