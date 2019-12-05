-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : MSS.vhd
--
-- Description  : Machine d'état pour l'acquisition de position
-- 
-- Auteur       : S.I et L.C
-- Date         : 05.12.19
-- Version      : 0.0
-- 	
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mss is
   port(reset_i     : in  std_logic;
        clk_i       : in  std_logic;
        capt_a_i    : in  std_logic;
        capt_b_i    : in  std_logic;
        det_err_o   : out std_logic;
        dir_cw_o    : out std_logic;
        en_o	    : out std_logic
       );
end mss;

architecture struct of mss is

  --components declaration

  
 --declaration internal signals 
 signal Etat_Present, Etat_Futur : Std_Logic_Vector(4 downto 0);
 
 --Les constantes des états
 --Etat start
 constant Start : Std_Logic_Vector(4 downto 0) := "00000";
 --Etats sens horaire
 constant E00_H : Std_Logic_Vector(4 downto 0) := "00001";
 constant E00_H_w : Std_Logic_Vector(4 downto 0) := "00010";
 
 constant E01_H : Std_Logic_Vector(4 downto 0) := "00011";
 constant E01_H_w : Std_Logic_Vector(4 downto 0) := "00100";
 
 constant E10_H : Std_Logic_Vector(4 downto 0) := "00101";
 constant E10_H_w : Std_Logic_Vector(4 downto 0) := "00110";
 
 constant E11_H : Std_Logic_Vector(4 downto 0) := "00111";
 constant E11_H_w : Std_Logic_Vector(4 downto 0) := "01000";
 -- Etats sens anti-horaire
 constant E00_AH : Std_Logic_Vector(4 downto 0) := "01001";
 constant E00_AH_w : Std_Logic_Vector(4 downto 0) := "01010";
 
 constant E01_AH : Std_Logic_Vector(4 downto 0) := "01011";
 constant E01_AH_w : Std_Logic_Vector(4 downto 0) := "01100";
 
 constant E10_AH : Std_Logic_Vector(4 downto 0) := "01101";
 constant E10_AH_w : Std_Logic_Vector(4 downto 0) := "01110";
 
 constant E11_AH : Std_Logic_Vector(4 downto 0) := "01111";
 constant E11_AH_w : Std_Logic_Vector(4 downto 0) := "10000";
 -- Etat d'erreur
 constant Err : Std_Logic_Vector(4 downto 0) := "10001";

  
begin

-- Reset ou met à jour l'état présent
	Mem: process (clk_i, reset_i)
	begin
		if (reset_i = '1') then
			Etat_Present <= Start;
		elsif rising_edge(clk_i) then
			Etat_Present <= Etat_Futur;
		end if;
	end process;

-- Gestion des sorties en fonction de l'état présent
-- Gestion des états futurs en fonction des entrées
	Fut: process (capt_a_i, capt_b_i, Etat_Present)
	begin
	-- valeurs par défaut
		Etat_Futur <= Start;
		det_err_o <= '0';
		dir_cw_o <= '0';
		en_o <= '0';
		
		case Etat_Present is
			when Start =>
				det_err_o <= '0';
				dir_cw_o <= '0';
				en_o <= '0';
				if (capt_a_i = '0' AND capt_b_i = '0') then 
					Etat_Futur <= E00_H_w;
				elsif (capt_a_i = '0' AND capt_b_i = '1') then 
					Etat_Futur <= E01_H_w;
				elsif (capt_a_i = '1' AND capt_b_i = '1') then 
					Etat_Futur <= E11_H_w;
				else -- (capt_a_i = '1' AND capt_b_i = '0') 
					Etat_Futur <= E10_H_w;
				end if;
				
			when E00_H =>
				det_err_o <= '0';
				dir_cw_o <= '0';
				en_o <= '1';
				Etat_Futur <= E00_H_w;
				
				
			when E00_H_w =>
				det_err_o <= '0';
				dir_cw_o <= '0';
				en_o <= '0';
					
				if (capt_a_i = '0' AND capt_b_i = '1') then 
					Etat_Futur <= E01_AH;
				elsif (capt_a_i = '1' AND capt_b_i = '1') then 
					Etat_Futur <= Err;
				elsif (capt_a_i = '1' AND capt_b_i = '0') then 
					Etat_Futur <= E10_H;
				else
					Etat_Futur <= E00_H_w;
				end if;
				
			when E10_H =>
				det_err_o <= '0';
				dir_cw_o <= '0';
				en_o <= '1';
				Etat_Futur <= E10_H_w;
				
			when E10_H_w =>
				det_err_o <= '0';
				dir_cw_o <= '0';
				en_o <= '0';
					
				if (capt_a_i = '0' AND capt_b_i = '0') then 
					Etat_Futur <= E00_AH;
				elsif (capt_a_i = '0' AND capt_b_i = '1') then 
					Etat_Futur <= Err;
				elsif (capt_a_i = '1' AND capt_b_i = '1') then 
					Etat_Futur <= E11_H;
				else
					Etat_Futur <= E10_H_w;
				end if;
				
			when E11_H =>
				det_err_o <= '0';
				dir_cw_o <= '0';
				en_o <= '1';
				Etat_Futur <= E11_H_w;
				
				
			when E11_H_w =>
				det_err_o <= '0';
				dir_cw_o <= '0';
				en_o <= '0';
					
				if (capt_a_i = '0' AND capt_b_i = '0') then 
					Etat_Futur <= Err;
				elsif (capt_a_i = '0' AND capt_b_i = '1') then 
					Etat_Futur <= E01_H;
				elsif (capt_a_i = '1' AND capt_b_i = '0') then 
					Etat_Futur <= E10_AH;
				else
					Etat_Futur <= E11_H_w;
				end if;

			when E01_H =>
				det_err_o <= '0';
				dir_cw_o <= '0';
				en_o <= '1';
				Etat_Futur <= E01_H_w;
				
				
			when E01_H_w =>
				det_err_o <= '0';
				dir_cw_o <= '0';
				en_o <= '0';
					
				if (capt_a_i = '0' AND capt_b_i = '0') then 
					Etat_Futur <= E00_H;
				elsif (capt_a_i = '1' AND capt_b_i = '0') then 
					Etat_Futur <= Err;
				elsif (capt_a_i = '1' AND capt_b_i = '1') then 
					Etat_Futur <= E11_AH;
				else
					Etat_Futur <= E11_H_w;
				end if;
				
				
			when E00_AH =>
				det_err_o <= '0';
				dir_cw_o <= '1';
				en_o <= '1';
				Etat_Futur <= E00_AH_w;
				
			when E00_AH_w =>
				det_err_o <= '0';
				dir_cw_o <= '1';
				en_o <= '0';
					
				if (capt_a_i = '0' AND capt_b_i = '1') then 
					Etat_Futur <= E01_AH;
				elsif (capt_a_i = '1' AND capt_b_i = '1') then 
					Etat_Futur <= Err;
				elsif (capt_a_i = '1' AND capt_b_i = '0') then 
					Etat_Futur <= E10_H;
				else
					Etat_Futur <= E00_AH_w;
				end if;
				
				
			when E01_AH =>
				det_err_o <= '0';
				dir_cw_o <= '1';
				en_o <= '1';
				Etat_Futur <= E01_AH_w;
				
			when E01_AH_w =>
				det_err_o <= '0';
				dir_cw_o <= '1';
				en_o <= '0';
					
				if (capt_a_i = '0' AND capt_b_i = '0') then 
					Etat_Futur <= E00_H;
				elsif (capt_a_i = '1' AND capt_b_i = '1') then 
					Etat_Futur <= E11_AH;
				elsif (capt_a_i = '1' AND capt_b_i = '0') then 
					Etat_Futur <= Err;
				else
					Etat_Futur <= E01_AH_w;
				end if;
				
			when E11_AH =>
				det_err_o <= '0';
				dir_cw_o <= '1';
				en_o <= '1';
				Etat_Futur <= E11_AH_w;
				
			when E11_AH_w =>
				det_err_o <= '0';
				dir_cw_o <= '1';
				en_o <= '0';
					
				if (capt_a_i = '0' AND capt_b_i = '0') then 
					Etat_Futur <= Err;
				elsif (capt_a_i = '0' AND capt_b_i = '1') then 
					Etat_Futur <= E01_H;
				elsif (capt_a_i = '1' AND capt_b_i = '0') then 
					Etat_Futur <= E10_AH;
				else
					Etat_Futur <= E11_AH_w;
				end if;
				
			when E10_AH =>
				det_err_o <= '0';
				dir_cw_o <= '1';
				en_o <= '1';
				Etat_Futur <= E10_AH_w;
				
			when E10_AH_w =>
				det_err_o <= '0';
				dir_cw_o <= '1';
				en_o <= '0';
					
				if (capt_a_i = '0' AND capt_b_i = '0') then 
					Etat_Futur <= E00_AH;
				elsif (capt_a_i = '0' AND capt_b_i = '1') then 
					Etat_Futur <= Err;
				elsif (capt_a_i = '1' AND capt_b_i = '1') then 
					Etat_Futur <= E11_H;
				else
					Etat_Futur <= E10_AH_w;
				end if;
				
				
			when Err =>
				det_err_o <= '1';
				dir_cw_o <= '0';
				en_o <= '0';
				if (capt_a_i = '0' AND capt_b_i = '0') then 
					Etat_Futur <= E00_H_w;
				elsif (capt_a_i = '0' AND capt_b_i = '1') then 
					Etat_Futur <= E01_H_w;
				elsif (capt_a_i = '1' AND capt_b_i = '1') then 
					Etat_Futur <= E11_H_w;
				else -- (capt_a_i = '1' AND capt_b_i = '0') 
					Etat_Futur <= E10_H_w;
				end if;


		when others =>
			Etat_Futur <= Start;
			det_err_o <= '0';
			dir_cw_o <= '0';
			en_o <= '0';

		end case;
	end process;




end struct; 
