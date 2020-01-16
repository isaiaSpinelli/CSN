-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : gestion_mode.vhd
--
-- Description  : Gestion des niveaux d'intensite avec mode blanc
--
-- Auteur       : Etienne Messerli
-- Date         : 14.11.2019
-- Version      : 1.0
--
-- Utilise      :
--
--| Modifications |------------------------------------------------------------
-- Version   Auteur Date               Description
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gestion_mode is
   generic(N_LEVEL : positive range 1 to 16:= 8);  --nombre de bits PWM
   port(m_blanc_i : in  std_logic;
        niv_r_i   : in  std_logic_vector(N_LEVEL-1 downto 0);
        niv_g_i   : in  std_logic_vector(N_LEVEL-1 downto 0);
        niv_b_i   : in  std_logic_vector(N_LEVEL-1 downto 0);
        niv_r_o   : out std_logic_vector(N_LEVEL-1 downto 0);
        niv_g_o   : out std_logic_vector(N_LEVEL-1 downto 0);
        niv_b_o   : out std_logic_vector(N_LEVEL-1 downto 0)
       );
end gestion_mode;

architecture flot_don of gestion_mode is

  --declaration internal signals

begin

niv_r_o <= niv_r_i when m_blanc_i = '0' else
            niv_g_i;

niv_g_o <= niv_g_i;

niv_b_o <= niv_b_i when m_blanc_i = '0' else
            niv_g_i;

end flot_don;
