-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : emet_serie_uc.vhd
--
-- Description  : Comparateur pour les ton et le compteur PWM
--
-- Auteur       : Isaia Spinelli et Gaetan Bacso
-- Date         : 16.01.2020
-- Version      : 1.0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity emet_serie_uc is
   port(
          clock_i       : in  std_logic;  --Horloge du systeme
          reset_i       : in  std_logic;  --Remise a Zero asychrone
          start_i       : in  std_logic;  --Initialisation a zero, sychrone, des compteurs (pos, idx, err)
          high_i        : in  std_logic;  --Encodeur phase A
          low_i         : in  std_logic;  --Encodeur phase BB
          loop_end_i    : in  std_logic;  --Encodeur phase BB
          load_o        : out std_logic;  --Direction: '1' CW (horaire), '0' CCW (anti-horaire)
          busy_o        : out std_logic;  --Detection d'une erreur (double changement A et B)
          send_o        : out std_logic;  --Indication de maintien
          par_o         : out std_logic;  --Direction: '1' CW (horaire), '0' CCW (anti-horaire)
          read_o        : out std_logic  --Indication de maintien
       );
end emet_serie_uc;

architecture flot_don of emet_serie_uc is
   --| internal signal declarations |-------------------------------------
   signal reset_s : Std_Logic;
   signal start_s : Std_Logic;
   signal high_s  : Std_Logic;
   signal low_s   : Std_Logic;
   signal loop_end_s : Std_Logic;

 --     -- Declaration etat avec codage
 --	signal etat_present, etat_futur : Std_Logic_Vector(3 downto 0);
 --
 --  	constant etat_reset     : Std_Logic_Vector(3 downto 0) := "00000";  -- 0
 --  	constant etat_wait      : Std_Logic_Vector(3 downto 0) := "00001";  -- 1
 --  	constant etat_load      : Std_Logic_Vector(3 downto 0) := "00010";  -- 2
 --  	constant etat_start0    : Std_Logic_Vector(3 downto 0) := "00011";  -- 3
 --  	constant etat_start1    : Std_Logic_Vector(3 downto 0) := "00100";  -- 4
 --  	constant etat_send0     : Std_Logic_Vector(3 downto 0) := "00101";  -- 5
 --  	constant etat_send1     : Std_Logic_Vector(3 downto 0) := "00110";  -- 6
 --  	constant etat_send2     : Std_Logic_Vector(3 downto 0) := "00111";  -- 7
 --  	constant etat_parite0   : Std_Logic_Vector(3 downto 0) := "01000";  -- 8
 --  	constant etat_parite1   : Std_Logic_Vector(3 downto 0) := "01001";  -- 9
 --  	constant etat_read0     : Std_Logic_Vector(3 downto 0) := "01010";  -- 10
 --  	constant etat_read1     : Std_Logic_Vector(3 downto 0) := "01011";  -- 11
 --  	constant etat_read2     : Std_Logic_Vector(3 downto 0) := "01100";  -- 12
 --  	constant etat_end      : Std_Logic_Vector(3 downto 0) := "01101";  -- 13

     -- Declaration etat avec enumere
     type T_etat is (
           etat_reset  ,
           etat_wait   ,
           etat_load   ,
           etat_start0 ,
           etat_start1 ,
           etat_send0  ,
           etat_send1  ,
           etat_send2  ,
           etat_parite0,
           etat_parite1,
           etat_read0  ,
           etat_read1  ,
           etat_read2  ,
           etat_end
  );

    signal etat_present, etat_futur : T_etat;


 begin
   reset_s <= reset_i;
   start_s <= start_i;
   high_s  <= high_i;
   low_s   <= low_i;
   loop_end_s <= loop_end_i;
   Fut: process (start_s, high_s, low_s, loop_end_s, etat_present)
   begin
     etat_futur <= etat_reset;
     load_o <= '0';
     busy_o <= '0';
     send_o <= '0';
     par_o  <= '0';
     read_o <= '0';

     case etat_present is
       when etat_reset =>
          load_o <= '0';
          busy_o <= '0';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '0';
         if (start_s = '0') then
           etat_futur <= etat_wait;
         end if;
       when etat_wait =>
          load_o <= '0';
          busy_o <= '0';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '0';
          if (start_s = '1') then
            etat_futur <= etat_load;
          elsif(start_s = '0') then
            etat_futur <= etat_wait;
          end if;
       when etat_load =>
          load_o <= '1';
          busy_o <= '0';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '0';
          etat_futur <= etat_start0;

       when etat_start0 =>
          load_o <= '0';
          busy_o <= '0';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '0';
          etat_futur <= etat_start1;
       when etat_start1 =>
          load_o <= '0';
          busy_o <= '1';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '0';
          if (high_s = '0') then
            etat_futur <= etat_start1;
          elsif(high_s = '1') then
            etat_futur <= etat_send0;
          end if;
       when etat_send0 =>
          load_o <= '0';
          busy_o <= '1';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '0';
          if (low_s = '1') then
            etat_futur <= etat_send1;
          elsif(low_s = '0') then
            etat_futur <= etat_send0;
          end if;
       when etat_send1 =>
          load_o <= '0';
          busy_o <= '1';
          send_o <= '1';
          par_o  <= '0';
          read_o <= '0';
          if (loop_end_s = '1') then
			etat_futur <= etat_parite1;
		  else
			etat_futur <= etat_send2;
		  end if;

      when etat_send2 =>
         load_o <= '0';
         busy_o <= '1';
         send_o <= '0';
         par_o  <= '0';
         read_o <= '0';
         if (loop_end_s = '1') then
           etat_futur <= etat_parite1;
         elsif(high_s = '1' and loop_end_s = '0') then
           etat_futur <= etat_send0;
         elsif(high_s = '0') then
           etat_futur <= etat_send2;
         end if;

       when etat_parite0 =>
          load_o <= '0';
          busy_o <= '1';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '0';
          if (low_s = '1') then
            etat_futur <= etat_parite1;
          elsif(low_s = '0') then
            etat_futur <= etat_parite0;
          end if;
       when etat_parite1 =>
          load_o <= '0';
          busy_o <= '1';
          send_o <= '0';
          par_o  <= '1';
          read_o <= '0';
          if (high_s = '0') then
            etat_futur <= etat_parite1;
          elsif(high_s = '1') then
            etat_futur <= etat_read0;
          end if;
       when etat_read0 =>
          load_o <= '0';
          busy_o <= '1';
          send_o <= '0';
          par_o  <= '1';
          read_o <= '0';
          if (low_s = '1') then
            etat_futur <= etat_read1;
          elsif(low_s = '0') then
            etat_futur <= etat_read0;
          end if;
       when etat_read1 =>
          load_o <= '0';
          busy_o <= '1';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '0';
          if (high_s = '0') then
            etat_futur <= etat_read1;
          elsif(high_s = '1') then
            etat_futur <= etat_read2;
          end if;
       when etat_read2 =>
          load_o <= '0';
          busy_o <= '1';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '1';
          if (low_s = '1') then
            etat_futur <= etat_end;
          elsif(low_s = '0') then
            etat_futur <= etat_read2;
          end if;
       when etat_end =>
          load_o <= '0';
          busy_o <= '1';
          send_o <= '0';
          par_o  <= '0';
          read_o <= '0';
          if (high_s = '0') then
            etat_futur <= etat_end;
          elsif(high_s = '1') then
            etat_futur <= etat_wait;
          end if;
       when others =>
         etat_futur <= etat_reset;
     end case;
   end process;

   Mem: process (clock_i, reset_s)
   begin
     if (reset_s = '1') then
       etat_present <= etat_reset;
     elsif Rising_Edge(clock_i) then
       etat_present <= etat_futur;
     end if;
   end process;
end flot_don;
