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
-- 2.1 	21.10.2019 ISS  résolution de l exercice (Labo4)
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
 
     -- valeur par defaut des sortis
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
     
    case adr_i(15 downto 12) is
      when "0000"                    	 			=> cs_rom_o    		<= '1';  -- ROM
      when "0001"|"0010"|"0011"|"0100" 	         	=> null;                	-- libre
      when "0101"|"0110"|"0111"              		=> cs_ram_o    		<= '1';  -- RAM
      when "1000"|"1001"                  			=> cs_flash_o    	<= '1';  -- FLASH
      when "1010"|"1011"|"1100"|"1101"|"1110"  		=> null;                	-- libre
      when "1111"									=> cs_io_o    		<= '1';  -- IO			
		case adr_i(11 downto 8) is		
			-- Lorsque les bits 8 à 11 sont tous à 0
			when "0000"    			
				=>
				-- détail pour la zone des IOs
				case adr_i(7 downto 4) is
					when "0000"                    						=> cs_leds_o    		<= '1';  -- LEDS
					when "0001"                    						=> cs_switch_o    		<= '1';  -- SWITCH
					when "0010"|"0011"                    				=> cs_matrice_led_o     <= '1';  -- MATRICE LED
					when "0100"|"0101"|"0110"|"0111"|"1000"|"1001"		=> null;                		-- libre
					when "1010"|"1011"                    				=> cs_capt_analog_o     <= '1';  -- CAPT ANALOG
					when "1100"|"1101"    								=> cs_cmd_moteur_o    	<= '1';  -- CMD MOTEUR
					-- Sinon                				
					when others => null;
					end case;
				when others => null;
				end case;

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

