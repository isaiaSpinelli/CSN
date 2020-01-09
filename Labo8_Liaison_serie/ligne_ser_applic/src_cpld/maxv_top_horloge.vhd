------------------------------------------------------------------------------------------
-- HEIG-VD ///////////////////////////////////////////////////////////////////////////////
-- Haute Ecole d'Ingenerie et de Gestion du Canton de Vaud
-- School of Business and Engineering in Canton de Vaud
------------------------------------------------------------------------------------------
-- REDS Institute ////////////////////////////////////////////////////////////////////////
-- Reconfigurable Embedded Digital Systems
------------------------------------------------------------------------------------------
--
-- File                 : maxv_top.vhd
-- Author               : Gilles Curchod
-- Date                 : 28.05.2013
-- Target Devices       : Altera MAXV 5M570ZF256C5
--
-- Context              : Max_V_Board Project : Hardware bring-up
--
------------------------------------------------------------------------------------------
-- Description :
--   Top of the CPLD
------------------------------------------------------------------------------------------
-- Information :
--
------------------------------------------------------------------------------------------
-- Modifications :
-- Ver   Date        Engineer     Chnages
-- 0.0   See header  GCD          Initial version
-- 1.0   25.09.2014  EMI          Adaptation to use for CSN lab 
-- 1.1   23.03.2015  KGS          Connection with console reds
-- 1.2   20.03.2018  EMI          Adaptation pour labo ALU 2018
--
------------------------------------------------------------------------------------------
--  Used for:
--    Integration of alu12_top.vhd  15.03.2015
------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.maxv_pkg.all;

library work;
  use work.ligne_serie_pkg.all; 

entity maxv_top is
  port(
    --| Clocks, Reset |---------------------------------------------------------------------
    Clk_Gen_i                : in    std_logic;                      -- CLK_GEN
    Clk_Main_i               : in    std_logic;                      -- CLK_MAIN
    --| Inout devices |---------------------------------------------------------------------
    Con_25p_io               : inout std_logic_vector(25 downto 1);  -- CON_25P_*
    Con_80p_io               : inout std_logic_vector(79 downto 2);  -- CON_80P_*
    Mezzanine_io             : inout std_logic_vector(20 downto 5);  -- MEZZANINE_*
    --| Input devices |---------------------------------------------------------------------
    Encoder_A_i              : in    std_logic;                      -- ENCODER_A
    Encoder_B_i              : in    std_logic;                      -- ENCODER_B
    nButton_i                : in    std_logic_vector( 8 downto 1);  -- NBUTTON_*
    nReset_i                 : in    std_logic;                      -- NRESET
    Switch_i                 : in    std_logic_vector( 7 downto 0);  -- SWITCH_*
    --| Output devices |--------------------------------------------------------------------
    nLed_o                   : out   std_logic_vector( 7 downto 0);  -- NLED_*
    Led_RGB_o                : out   std_logic_vector( 2 downto 0);  -- LED_RGB_*
    nSeven_Seg_o             : out   std_logic_vector( 7 downto 0)   -- NDSP_SEG (dp, g downto a)
  );
end maxv_top;

architecture struct of maxv_top is

    constant MAX10_DESIGN_KNOWN   : std_logic_vector(1 downto 0) := "01";
    constant MAX10_DESIGN_UNKNOWN : std_logic_vector(1 downto 0) := "10";

    -- configuration du design sur la carte MAX10 : "000010" correspond au design de
    -- récepteur de ligne serie synchrone 20 bits avec parité
    constant MAX10_DESIGN_CONFIG : std_logic_vector(5 downto 0) := "000010";
    
    type db_array_t is array (nButton_i'range) of unsigned(3 downto 0);

    --| Intermediate signals |--------------------------------------------------------------
    signal Reset_s          : std_logic;
    
    signal debounce_cpt_s    : db_array_t;
    signal button_sync1_s    : std_logic_vector(nButton_i'range);
    signal button_sync2_s    : std_logic_vector(nButton_i'range);
    signal diff_button_s     : std_logic_vector(nButton_i'range);
    signal filtered_button_s : std_logic_vector(nButton_i'range);
    
    signal Con_25p_DI_s     : std_logic_vector(Con_25p_io'range);
    signal Con_25p_DO_s     : std_logic_vector(Con_25p_io'range);
    signal Con_25p_OE_s     : std_logic_vector(Con_25p_io'range);
    signal Con_80p_DI_s     : std_logic_vector(Con_80p_io'range);
    signal Con_80p_DO_s     : std_logic_vector(Con_80p_io'range);
    signal Con_80p_OE_s     : std_logic_vector(Con_80p_io'range);
    signal Mezzanine_DI_s   : std_logic_vector(Mezzanine_io'range);
    signal Mezzanine_DO_s   : std_logic_vector(Mezzanine_io'range);
    signal Mezzanine_nOE_s  : std_logic;
    signal Button_s         : std_logic_vector(nButton_i'range);
    signal Led_s            : std_logic_vector(nLed_o'range);
    signal Seven_Seg_s      : std_logic_vector(nSeven_Seg_o'range); -- order: dp, g f e d c b a

    signal s_clk_s          : std_logic;
    signal top_sec_s        : std_logic;
    
    signal confirm_design_s : std_logic_vector(1 downto 0);

    --| Internal signals |------------------------------------------------------------------
    constant VAL_N : natural range 1 to 16 := 12; --integration avec 12 bits
    signal Cpt_s : unsigned(19 downto 0);
    signal tmp_s : std_logic_vector(11 downto 0);
    --| Components declaration |------------------------------------------------------------
    component horloge_top is
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
    end component;
    for all : horloge_top use entity work.horloge_top(struct);
  
begin

    confirm_design_s <= Con_80p_DI_s(73 downto 72);

    ----------------------------------------------------------------------------------------
    --| INPUTS PROCESSING |-----------------------------------------------------------------
    Reset_s <= not nReset_i;
    Button_s <= not nButton_i;
    
    ----------------------------------------------------------------------------------------
    --| OUTPUT PROCESSING |-----------------------------------------------------------------
    nLed_o <= not Led_s;
    nSeven_Seg_o <= not Seven_Seg_s;
    
    ----------------------------------------------------------------------------------------
    --| Unused output allocation |----------------------------------------------------------
    Led_RGB_o <= (others => '0');
    Seven_Seg_s(Seven_Seg_s'high-1 downto 0) <= (others => '0');
    Seven_Seg_s(Seven_Seg_s'high) <= Cpt_s(Cpt_s'high); -- decimal point blink at 1Hz
    
    --| Filtrage des boutons |--------------------------------------------------------------
    debouncing: for I in nButton_i'range generate
        process (Clk_Main_i, Reset_s)
        begin
            if Reset_s = '1' then
                button_sync1_s(I)    <= '0';
                button_sync2_s(I)    <= '0';
                filtered_button_s(I) <= '0';
            elsif rising_edge(Clk_Main_i) then
                button_sync1_s(I) <= Button_s(I);
                button_sync2_s(I) <= button_sync1_s(I);
                if debounce_cpt_s(I) = 0 then  -- si Button(i) stable => mise a jour
                    filtered_button_s(I)  <= button_sync2_s(I);
                end if;
            end if;
        end process;
        
        diff_button_s(I) <= button_sync1_s(I) xor button_sync2_s(I);
        
        process (Clk_Main_i, Reset_s)
        begin
            if Reset_s = '1' then
                debounce_cpt_s(I) <= (others => '0');
            elsif rising_edge(Clk_Main_i) then
                if diff_button_s(I) = '1' then -- load lorsque diff_button_s
                    debounce_cpt_s(I) <= (others => '1'); --charge valeur max
                elsif debounce_cpt_s(I) /= 0 then 
                    debounce_cpt_s(I) <= debounce_cpt_s(I) - 1;
                end if;
            end if;
        end process;
    end generate debouncing;
  
    ----------------------------------------------------------------------------------------
    --| Tri-state declaration for the 80p connector |---------------------------------------
    
    --  --Configuration port 80 poles pour la Console_REDS_logisim
    --   # - Pin(s) 08 downto 02 as inputs # Leds           | 80pConnPort1
    --   # - Pin(s) 16 downto 09 as inputs # Result_A( 7:0) | 80pConnPort2
    --   # - Pin(s) 24 downto 17 as inputs # Result_A(15:8) | 80pConnPort3
    --   # - Pin(s) 32 downto 25 as inputs # Result_B( 7:0) | 80pConnPort4
    --   # - Pin(s) 40 downto 33 as inputs # Result_B(15:8) | 80pConnPort5
    --   # - Pin(s) 48 downto 41 as outputs # Val_A(7:0)    | 80pConnPort6
    --   # - Pin(s) 56 downto 49 as outputs # Val_A(15:8)   | 80pConnPort7
    --   # - Pin(s) 64 downto 57 as outputs # Val_B(7:0)    | 80pConnPort8
    --   # - Pin(s) 72 downto 65 as outputs # Val_B(15:8)   | 80pConnPort9

    -- define direction for 80 poles
    --    '0' = out,   '1' = in 
    -- MAX10 leds config pin
    Con_80p_OE_s(79 downto 74) <= (others => '1');
    -- MAX10 leds confirm
    Con_80p_OE_s(73 downto 72) <= (others => '0');
    Con_80p_OE_s(71 downto 32) <= (others => '0'); -- unused
    Con_80p_OE_s(30)           <= '1' when confirm_design_s = MAX10_DESIGN_KNOWN else '0';
    Con_80p_OE_s(29 downto  2) <= (others => '0'); -- unused
    
    --| Tri-state declaration for the 25p connector |---------------------------------------
    -- the 25poles connector with EINEV 287 console interface:
    -- Tri-state declaration :
    -- In/out pin map :
    -- Con_25p_DO_s( 8 downto  1) : LED (L7 downto L0)
    -- Con_25p_DI_s(16 downto  9) : Switch (S7 downto S0)
    -- Con_25p_DO_s(20 downto 17) : Hex0 (LSB) (D3 to D0)
    -- Con_25p_DO_s(24 downto 21) : Hex1 (MSB) (D3 to D0)
    -- Con_25p_DI_s(25)           : Clk

    Con_25p_OE_s( 8 downto  1) <= (others => '1'); -- outputs
    Con_25p_OE_s(16 downto  9) <= (others => '0'); -- inputs
    Con_25p_OE_s(24 downto 17) <= (others => '1'); -- outputs
    Con_25p_OE_s(25) <= '0'; -- input

    tri_state_25p_loop: for I in Con_25p_io'right to Con_25p_io'left generate
        Con_25p_io(I) <= Con_25p_DO_s(I) when Con_25p_OE_s(I) = '1' else 'Z';
    end generate;

    Con_25p_DI_s <= to_X01(Con_25p_io);
    
    ----------------------------------------------------------------------------------------
    --| Components intanciation |-----------------------------------------------------------
    U1: horloge_top 
        port map (clk_i        => Clk_Main_i,
                  nReset_i     => nReset_i,
                  init_i       => filtered_button_s(2),
                  start_stop_i => filtered_button_s(1),
                  run_o        => Led_s(2),
                  emet_busy_o  => Led_s(0),
                  err_par_o    => Led_s(1),
                  s_clk_o      => s_clk_s,
                  s_data_io    => Con_80p_io(31)
     );
    
    Led_s(7 downto 3) <=  (others => '0'); --eteindre autres leds
    
    -- MAX10 leds config
    Con_80p_DO_s(79 downto 74) <= MAX10_DESIGN_CONFIG;
    
    -- description of the tristate port for 80 pole
    Con_80p_DO_s(30) <= s_clk_s when Con_80p_OE_s(30) = '1' else
                        'Z';
                        
    con_80pole_tristate1 : for i in 2 to 30 generate
        -- 80P Connector (79 downto 2)-- pins 1 and 80 are not connected to FPGA (connected to GND)
        Con_80p_io(i)    <=  Con_80p_DO_s(i)  when Con_80p_OE_s(i) = '1'  else
                                    'Z';
        Con_80p_DI_s(i)  <=  Con_80p_io(i);
    end generate;
    con_80pole_tristate2 : for i in 32 to 79 generate
        -- 80P Connector (79 downto 2)-- pins 1 and 80 are not connected to FPGA (connected to GND)
        Con_80p_io(i)    <=  Con_80p_DO_s(i)  when Con_80p_OE_s(i) = '1'  else
                                    'Z';
        Con_80p_DI_s(i)  <=  Con_80p_io(i);
    end generate;


    ---------------------------------------------------------------------------------------
    --| Signal blink at 1Hz |---------------------------------------------------------------
    process (Clk_Main_i, Reset_s)
    begin
        if Reset_s = '1' then
        Cpt_s <= (others => '0');
        elsif rising_edge(Clk_Main_i) then
        Cpt_s <= Cpt_s +1;
        end if;
    end process;
    
end struct;

