-----------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenerie et de Gestion du Canton de Vaud
-- Institut REDS
--
-- Fichier :  exo_dec_adr_process.vhd
-- Auteur  :  E. Messerli
-- Date    :  31.03.2019, nouvelle version exercice
--
-- Utilise dans :  Exercice description système combinatoire avec process
-----------------------------------------------------------------------
-- Ver  Date       Qui  Commentaires
-- 1.0  31.03.2019 EMI  Solution
-- 2.1 	21.10.2019 ISS  résolution de l exercice
-----------------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all;

entity exo_dec_adr_process is
port(adr_i            : in  std_logic_vector(15 downto 0);
     cs_rom_o         : out  std_logic;
     cs_ram_o         : out  std_logic;
     cs_flash_o       : out  std_logic;
     cs_io_o          : out  std_logic;
     cs_leds_o        : out  std_logic;
     cs_switch_o      : out  std_logic;
     cs_matrice_led_o : out  std_logic;
     cs_capt_analog_o : out  std_logic;
     cs_cmd_moteur_o  : out  std_logic
     );
end Exo_Dec_adr_process ;

architecture flot_don of exo_dec_adr_process is
  
begin
  
  process(adr_i)
    -- zone de déclaration
    
  begin
	-- zone des instructions séquentielles
 
     -- valeur par defaut
     -- desactive tous les chips select
     cs_rom_o    		<= '0';
     cs_ram_o    		<= '0';
     cs_flash_o    		<= '0';
     cs_io_o    		<= '0';
     cs_leds_o    		<= '0';
     cs_switch_o    	<= '0';
     cs_matrice_led_o   <= '0';
     cs_capt_analog_o   <= '0';
     cs_cmd_moteur_o 	<= '0';

     -- active le cs en fonciton de l'adresse
     
    case adr_i is
      when ""                    => cs_rom_o    		<= '1';  -- ROM
      when ""	                 => null;                -- libre
      when ""                    => cs_ram_o    		<= '1';  -- RAM
      when ""                    => cs_flash_o    		<= '1';  -- FLASH
      when ""                    => cs_io_o    			<= '1';  -- IO
      when ""                    => cs_leds_o    		<= '1';  -- LEDS
      when ""                    => cs_switch_o    		<= '1';  -- SWITCH
      when ""                    => cs_matrice_led_o    <= '1';  -- MATRICE LED
      when ""                    => cs_capt_analog_o    <= '1';  -- CAPT ANALOG
      when ""                    => cs_cmd_moteur_o    	<= '1';  -- CMD MOTEUR
      
      when "000" | "100" => cs_flash_o <= '1' ;

	-- Sinon
      when others => --cas pour simulation
                      cs_rom_o    <= 'X';
                      cs_ram_o   <= 'X';
                      cs_flash_o   <= 'X';
                      cs_io_o     <= 'X';
                      cs_leds_o        <= 'X';
                      cs_switch_o      <= 'X'; 
                      cs_matrice_led_o <= 'X';
                      cs_capt_analog_o <= 'X';
                      cs_cmd_moteur_o  <= 'X';
      end case;
  
  end process;
  
end flot_don;

