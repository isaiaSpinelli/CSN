-------------------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- File         : emet_serie_top_tb.vhd
-- Description  : 
--
-- Author       : Sebastien Masle
-- Date         : 27.08.2019
-- Version      : 0.0
--
-- Dependencies : 
--
--| Modifications |------------------------------------------------------------
-- Version   Author Date               Description
-- 0.0       SMS    27.08.19           Creation
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity emet_serie_top_tb is
-- Test bench does not have any IO
end entity emet_serie_top_tb;

-------------------------------------------------------------------------------

architecture test_bench of emet_serie_top_tb is

    component emet_serie
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
    end component;
    for all : emet_serie use entity work.emet_serie(struct);

    ---------------
    -- Constants --
    ---------------
    constant ERROR_PULSE_C  : time := 4 ns;
    constant CLOCK_PERIOD   : time := 1 us;
    constant DATA_SIZE_C    : positive := 20;
    constant VAL_DIV_C      : positive := 20;
    constant PARITY_CHECK_C : std_logic := '1';
    constant TYPE_PAR_C     : boolean := true;
    
    type data_t is array(natural range<>) of std_logic_vector(DATA_SIZE_C - 1 downto 0);
    
    constant DATA_TO_SEND_C : data_t := ("11010111011010001100",
                                         "10101010101010101010"
                                        );
--     constant DONT_CARE_C    : std_logic_vector(DATA_SIZE_C - 1 downto 0) := (others => '-');
    
    signal sim_completed_s : boolean := false;
    
    -----------
    -- Ports --
    -----------
    signal clk_sti        : std_logic;
    signal reset_sti      : std_logic;
    signal start_sti      : std_logic;
    signal data_s         : std_logic_vector(DATA_SIZE_C-1 downto 0);
    signal busy_obs       : std_logic;
    signal err_par_obs    : std_logic;
    signal s_clk_obs      : std_logic;
    signal s_data_obs     : std_logic;
    signal s_data_io_s    : std_logic;
    signal s_data_io_sti  : std_logic;

    -------------------
    -- Check signals --
    -------------------
    -- Error detection
    shared variable error_counter_v : integer                      := 0;
    signal error_pulse_s            : std_logic                    := '0';
    -- Output verification
    signal busy_ref_s    : std_logic;
    signal err_par_ref_s : std_logic;
    signal s_clk_ref_s   : std_logic;
    signal s_data_ref_s  : std_logic;
    ----------------
    -- Procedures --
    ----------------
    -- Cycle simulator
    procedure cycle(nb_cycle        : integer                      := 1) is
    begin
        for i in 1 to nb_cycle loop
            wait until falling_edge(clk_sti);
            wait for 2 ns;
        end loop;
    end cycle;
 
begin  -- architecture test_bench

    ------------------------------
    -- Components instanciation --
    ------------------------------
    uut : entity work.emet_serie
        generic map(N => DATA_SIZE_C,
                    VAL_DIV => VAL_DIV_C,
                    PARITY_CHECK => PARITY_CHECK_C,
                    TYPE_PAR => TYPE_PAR_C)
        port map(
            clk_i     => clk_sti,
            reset_i   => reset_sti,
            start_i   => start_sti,
            data_i    => data_s,
            busy_o    => busy_obs,
            err_par_o => err_par_obs,
            s_clk_o   => s_clk_obs,
            s_data_io => s_data_io_s
        );

    s_data_obs <= to_x01(s_data_io_s);
    s_data_io_s <= s_data_io_sti;
    
    ------------------------------
    -- Clock generation process --
    ------------------------------
    clk_gen : process
    begin
        while not sim_completed_s loop
            clk_sti <= '1';
            wait for CLOCK_PERIOD/2;
            clk_sti <= '0';
            wait for CLOCK_PERIOD/2;
        end loop;
        wait;
    end process;

    -------------------------
    -- Simulation sequence --
    -------------------------
    seq : process
        -- reset sequence
        procedure reset_seq is
        begin
            reset_sti       <= '1';
            start_sti       <= '0';
            data_s  <= (others => '0');
            s_data_io_sti      <= 'H';
            cycle(2);
            reset_sti         <= '0';
        end reset_seq;
    begin
        -- user notification
        report "Reset Sequence";

        -- Reset system at the beginning
        reset_seq;                      -- reset procedure

        -- user notification
        report "Send data";
        
        send_data : for I in DATA_TO_SEND_C'range loop
            -- set data to send
            data_s <= DATA_TO_SEND_C(I);
            cycle(1);
            -- start transmission
            start_sti  <= '1';
            cycle(1);
            start_sti  <= '0';
            wait until falling_edge(s_clk_obs) for 10 us;
            if s_clk_obs /= '0' then
                report "s_clk signal has never gone low" severity failure;
            end if;
            cycle(DATA_SIZE_C*20);
            if TYPE_PAR_C = true then
                cycle(2*20); -- parity bit + parity error bits
            end if;
            cycle(20); -- stop bit
            cycle(40); -- delay before new transmission
        end loop;
        
        -- end of simulation
        -- user notification
        report ">>----------------------------------------" & LF &
            "         >>  Number of errors found = " & integer'image(error_counter_v) & LF &
            "         >>----------------------------------------";
        report "end of simulation, check log for details";
        sim_completed_s <= true;
        wait;

    end process;
    
    -- ref signals assignement
    ref : process
        variable parity_v : std_logic;
    begin
       -- s_data_io_sti      <= 'H';
        while not sim_completed_s loop
            busy_ref_s      <= '-';
            err_par_ref_s   <= '-';
            s_clk_ref_s     <= '-';
            s_data_ref_s    <= '-';
            
            wait until falling_edge(reset_sti);
            
            busy_ref_s <= '0';
            err_par_ref_s <= '0';
            s_clk_ref_s <= '1';
            s_data_ref_s <= '1';
            
            ref_data : for I in DATA_TO_SEND_C'range loop
                -- calculate parity
                if TYPE_PAR_C = true then
                    parity_v := '1';
                else
                    parity_v := '0';
                end if;
                for J in DATA_TO_SEND_C(I)'range loop
                    parity_v := parity_v xor DATA_TO_SEND_C(I)(J);
                end loop;
                -- set ref signals
                busy_ref_s <= '-';
                wait until rising_edge(start_sti);
                s_data_ref_s <= '-';
                wait until falling_edge(s_clk_obs);
                busy_ref_s   <= '1';
                s_clk_ref_s  <= '0';
                wait for 3*CLOCK_PERIOD;
                s_data_ref_s <= '0';
                wait for 7*CLOCK_PERIOD;
                s_clk_ref_s  <= '1';
                wait for 7*CLOCK_PERIOD;
                s_data_ref_s <= '-';
                wait for 3*CLOCK_PERIOD;
                for J in DATA_TO_SEND_C(I)'range loop
                    s_clk_ref_s  <= '0';
                    wait for 3*CLOCK_PERIOD;
                    s_data_ref_s <= DATA_TO_SEND_C(I)(J);
                    wait for 7*CLOCK_PERIOD;
                    s_clk_ref_s  <= '1';
                    wait for 7*CLOCK_PERIOD;
                    s_data_ref_s <= '-';
                    wait for 3*CLOCK_PERIOD;
                end loop;
                if PARITY_CHECK_C = '1' then
                    -- send parity
                    s_clk_ref_s  <= '0';
                    wait for 3*CLOCK_PERIOD;
                    s_data_ref_s <= parity_v;
                    wait for 7*CLOCK_PERIOD;
                    s_clk_ref_s  <= '1';
                    wait for 7*CLOCK_PERIOD;
                    s_data_ref_s <= '-';
                    wait for 3*CLOCK_PERIOD;
                    -- send err_par
                    -- tester si parity est correct ???? EMI
                    s_clk_ref_s  <= '0';
                    --s_data_io_sti <= '0';  -- pas d'erreur
                    wait for 3*CLOCK_PERIOD;
                    s_data_ref_s <= '1';  -- detection erreur parite EMI
                    err_par_ref_s <= '-';
                    wait for 7*CLOCK_PERIOD;
                    s_clk_ref_s  <= '1';
                    wait for 7*CLOCK_PERIOD;
                    s_data_ref_s <= '-';
                    --s_data_io_sti <= 'H';
                    err_par_ref_s <= '1';
                    wait for 3*CLOCK_PERIOD;
                end if;
                s_clk_ref_s  <= '0';
                wait for 3*CLOCK_PERIOD;
                s_data_ref_s <= '1';    -- stop bit
                wait for 7*CLOCK_PERIOD;
                s_clk_ref_s  <= '1';
                busy_ref_s <= '-';
                wait for 7*CLOCK_PERIOD;
                s_data_ref_s <= '-';
                wait for 3*CLOCK_PERIOD;
                wait for 10*CLOCK_PERIOD;
                s_data_ref_s <= '0';
                busy_ref_s <= '0';
            end loop;
        end loop;
        wait;

    end process;

    -------------------
    -- Check process --
    -------------------
    check_proc : process
    begin
        while not sim_completed_s loop
            wait until falling_edge(clk_sti);
            wait for (CLOCK_PERIOD/2) - 2 ns;

            if busy_ref_s = '-' then
            -- nothing to do
            elsif busy_ref_s /= busy_obs then
                error_pulse_s  <= '1', '0' after ERROR_PULSE_C;
                error_counter_v := error_counter_v + 1;
                report "Error on busy signal" severity ERROR ;
            end if;

            if err_par_ref_s = '-' then
            -- nothing to do
            elsif err_par_ref_s /= err_par_obs then
                error_pulse_s  <= '1', '0' after ERROR_PULSE_C;
                error_counter_v := error_counter_v + 1;
                report "Error on parity error signal" severity ERROR ;
            end if;

            if s_clk_ref_s = '-' then
            -- nothing to do
            elsif s_clk_ref_s /= s_clk_obs then
                error_pulse_s  <= '1', '0' after ERROR_PULSE_C;
                error_counter_v := error_counter_v + 1;
                report "Error on s_clk signal" ; --severity ERROR;
            end if;

            if s_data_ref_s = '-' then
            -- nothing to do
            elsif s_data_ref_s /= To_X01(s_data_obs) then
                error_pulse_s  <= '1', '0' after ERROR_PULSE_C;
                error_counter_v := error_counter_v + 1;
                report "Error on s_data signal" severity ERROR;
            end if;
        end loop;
        wait;
    end process;

end architecture test_bench;
