-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : srgn.vhd
--
-- Description  : Registre à décalage pour l'envoie en série
--
-- Auteur       : Isaia Spinelli et Gaetan Bacso
-- Date         : 16.01.2020
-- Version      : 1.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.ligne_serie_pkg.all;

entity srgn is
   generic(N : positive range 2 to 32 := NBR_DATA);
   port(
          reset_i     : in  std_logic;
          clk_i       : in  std_logic;
          en_i        : in  std_logic;
          load_i      : in  std_logic;
          val_shift_i : in  std_logic;
          data_i      : in  std_logic_vector(N+1 downto 0);
          data_send_o : out std_logic_vector(N+1 downto 0);
          loop_end_o  : out  std_logic
       );
end srgn;

architecture flot_don of srgn is

  --internally signals
  signal shift_pres_s : std_logic_vector(data_i'high downto 0) := (others => '0');
  signal shift_fut_s  : std_logic_vector(data_i'high downto 0) := (others => '0');
  signal val_comp_s   : std_logic_vector(data_i'high downto 0) := (data_i'high => '1', others => '0');

begin

  shift_fut_s <= data_i when load_i = '1' else
                 shift_pres_s(shift_pres_s'high-1 downto 0) & val_shift_i when en_i = '1' else
                 shift_pres_s;

  process(reset_i, clk_i)
  begin
  if reset_i = '1' then
    shift_pres_s <= (others => '0');
  elsif Rising_Edge(clk_i) then
    shift_pres_s <= shift_fut_s;
  end if;
  end process;

  data_send_o <= shift_pres_s;
  loop_end_o <= '1' when shift_pres_s = val_comp_s else
		'0';

end flot_don;
