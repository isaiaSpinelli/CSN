-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : horloge_top.vhd
-- Description  : Emetteur pour ligne serie synchrone
-- 
-- Auteur       : Sebastien Masle
-- Date         : 16.05.2019
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

library work;
    use work.ligne_serie_pkg.all; 
-------------------------------------------------------------------------------
--| Fichier top de l'application pour l'horloge |------------------------------

entity horloge_top is
        port(
        clk_i         : in    std_logic;
        nReset_i      : in    std_logic;
        init_i        : in    std_logic;
        start_stop_i  : in    std_logic;
        run_o         : out   std_logic;
        emet_busy_o   : out   std_logic;
        err_par_o     : out   std_logic;
        s_clk_o       : out   std_logic;
        s_data_io     : inout std_logic
    );
end horloge_top;


architecture struct of horloge_top is

    --internal signal declaration

    

    --component declaration
    component emet_serie
        generic( N : positive := 4;           -- number of data bits
             VAL_DIV : positive := 20;        -- clock divider for serial clock frequency
             PARITY_CHECK : std_logic := '1'; -- parity check ('1' : check, '0' : do not check)
             TYPE_PAR : boolean := true);     -- parity type  (true = even, false = odd)
        port( 
            clk_i     : in    std_logic;
            reset_i   : in    std_logic;
            start_i   : in    std_logic;   
            data_i    : in    std_logic_vector(NBR_DATA-1 downto 0);
            busy_o    : out   std_logic;
            err_par_o : out   std_logic;
            s_clk_o   : out   std_logic;
            s_data_io : inout std_logic
        );
    end component;
    for all : emet_serie use entity work.emet_serie(struct); 

   component ......
   ...
    
    
    

begin

    -- polarity adaptation
    reset_s <= not nReset_i;
    
    transmitter : emet_serie
        generic map( N => NBR_DATA,
                     VAL_DIV => VAL_DIV,
                     PARITY_CHECK => '1',
                     TYPE_PAR => true)
        port map(clk_i     =>   ,
                 reset_i   =>   ,
                 start_i   =>   ,
                 data_i    =>   ,
                 busy_o    =>   ,
                 err_par_o =>   ,
                 s_clk_o   =>   ,
                 s_data_io => 
        );
    

    a completer ....
    
    
end struct;
