-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : emet_serie.vhd
-- Description  : Emetteur pour ligne serie synchrone
--
-- Auteur       : Etienne Messerli
-- Date         : 22.05.2018
-- Version      : 0.0
--
-- Utilise      : Labo SysLog2 MSS_cplx, emetteur pour ligne serie synchrone
--
--| Modifications |------------------------------------------------------------
-- Version  Date   Auteur     Description
--
-------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity emet_serie is
    generic( N : positive := 4;               -- number of data bits
             VAL_DIV : positive := 20;        -- clock divider for serial clock frequency
             PARITY_CHECK : std_logic := '1'; -- parity check ('1' : check, '0' : do not check)
             TYPE_PAR : boolean := true);     -- parity type  (true = even, false = odd)
    port( clk_i     : in    std_logic;
          reset_i   : in    std_logic;
          start_i   : in    std_logic;
          data_i    : in    std_logic_vector(N-1 downto 0);
          busy_o    : out   std_logic;
          err_par_o : out   std_logic;
          s_clk_o   : out   std_logic;
          s_data_io : inout std_logic
   );
end emet_serie;

architecture struct of emet_serie is

   --internal signal declaration
   signal reset_s : std_logic;
   signal nReset_s : std_logic;
   signal start_s : std_logic;
   signal data_s : std_logic_vector(N+1 downto 0);
   signal data_load_s : std_logic_vector(N+1 downto 0);
   signal load_s : std_logic;
   signal busy_s : std_logic;
   signal send_s : std_logic;
   signal par_s  : std_logic;
   signal read_s : std_logic;
   signal loop_end_s : std_logic;
   signal parite_s : std_logic;
   signal s_clk_div : std_logic;
   signal s_high : std_logic;
   signal s_low : std_logic;
   signal data_par_s : std_logic;
   signal load_div_s : std_logic;
   signal s_clk : std_logic;
   signal err_par_pres : std_logic;
   signal err_par_fut : std_logic;
   signal s_data_send : std_logic;

   --component declaration
   component flipflop_rs
     port(clk_i    : in     std_logic;
          reset_i  : in     std_logic;
          R_i      : in     std_logic;
          S_i      : in     std_logic;
          Q_o      : out    std_logic
     );
   end component;

   component flipflop_t
       port(clk_i    : in     std_logic;
            reset_i  : in     std_logic;
            T_i      : in     std_logic;
            Q_o      : out    std_logic
       );
   end component;

   component dff_en is
 		port(
 			clk_i    : in     std_logic;
 			D_i      : in     std_logic;
 			en_i     : in     std_logic;
 			nReset_i : in     std_logic;
 			Q_o      : out    std_logic
 		);
 	end component ;

  component cal_parity is
    port(
 		clk_i    	: in     std_logic;
     reset_i  	: in     std_logic;
 		data_i    : in     std_logic;
 		load_i    : in     std_logic;
 		en_i        : in     std_logic;
     parite_o  : out    std_logic
   );
 end component ;

 component divisor is
   port(
 		reset_i  	: in std_logic;
         clk_i    	: in std_logic;
         en_i	 	: in std_logic;
         load_i	 	: in std_logic;
         clk_div_o	: out std_logic
        );
end component ;

component srgn is
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
end component ;


component emet_serie_uc is
  port(
         clock_i       : in  std_logic;  --Horloge du systeme
         reset_i       : in  std_logic;  --Remise a Zero asychrone
         start_i       : in  std_logic;  --Initialisation a zero, sychrone, des compteurs (pos, idx, err)
         high_i        : in  std_logic;  --Encodeur phase A
         low_i         : in  std_logic;  --Encodeur phase BB
         loop_end_i    : in  std_logic;  --Encodeur phase BB
         load_o        : out std_logic;  --Direction: '1' CW (horaire), '0' CCW (anti-horaire)
         busy_o        : out std_logic;  --Detection d'une erreur (double changement A et B)
         send_o        : out std_logic;  --Insignal reset_s : std_logic;dication de maintien
         par_o         : out std_logic;  --Direction: '1' CW (horaire), '0' CCW (anti-horaire)
         read_o        : out std_logic  --Indication de maintien
      );
end component ;


   for all : flipflop_rs use entity work.flipflop_rs(flot_don);
   for all : flipflop_t use entity work.flipflop_t(flot_don);
   for all : dff_en use entity work.dff_en(comport);
   for all : cal_parity use entity work.cal_parity(flot_don);
   for all : divisor use entity work.divisor(flot_don);
   for all : srgn use entity work.srgn(flot_don);
   for all : emet_serie_uc use entity work.emet_serie_uc(flot_don);

begin -- Struct
-- polarity adaptation
nReset_s <= not reset_i;
reset_s <= reset_i;
data_load_s <= '0' & data_i & '1';
data_par_s <= data_s(data_s'high) and (not loop_end_s);
load_div_s <= load_s;
s_low <= s_clk and s_clk_div;
s_high <= (not s_clk) and s_clk_div;
s_clk_o <= s_clk when busy_s = '1' else
           '1';
s_data_io <= s_data_send when busy_s = '1' else
             '1';
s_data_send <= parite_s when par_s = '1' else
               data_s(data_s'high);
err_par_pres <= s_data_io when read_s = '1' else
                err_par_fut;
err_par_o <= err_par_fut;
                
busy_o <= busy_s;


  -- Instance port mappings.
srgn1 : srgn
port map (
    reset_i     => reset_s,
    clk_i       => clk_i,
    en_i        => send_s,
    load_i      => load_s,
    val_shift_i => '0',
    data_i      => data_load_s,
    data_send_o => data_s,
    loop_end_o  => loop_end_s
);

cal_parity1 : cal_parity
port map (
  clk_i    	=> clk_i,
  reset_i  	=> reset_s,
  data_i    => data_par_s,
  load_i    => load_s,
  en_i      => send_s,
  parite_o  => parite_s
);

divisor1 : divisor
port map (
    reset_i  	=> reset_s,
    clk_i    	=> clk_i,
    en_i	 	  => '1',
    load_i	  => load_s,
    clk_div_o => s_clk_div
);

flipflop_t1 : flipflop_t
port map (
    clk_i    => clk_i,
    reset_i  => reset_s,
    T_i      => s_clk_div,
    Q_o      => s_clk
);

dff_en1 : dff_en
port map (
  clk_i    => clk_i,
  D_i      => start_i,
  en_i     => '1',
  nReset_i => nReset_s,
  Q_o      => start_s
);

emet_serie_uc1 : emet_serie_uc
port map (
  clock_i       => clk_i,
  reset_i       => reset_s,
  start_i       => start_s,
  high_i        => s_high,
  low_i         => s_low,
  loop_end_i    => loop_end_s,
  load_o        => load_s,
  busy_o        => busy_s,
  send_o        => send_s,
  par_o         => par_s,
  read_o        => read_s
);

flipflop_rs1 : flipflop_rs
port map (
    clk_i    => clk_i,
    reset_i  => reset_s,
    R_i      => load_s,
    S_i      => err_par_pres,
    Q_o      => err_par_fut
);









end struct;
