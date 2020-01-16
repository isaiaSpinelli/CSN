onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /console_sim/uut/clk_i
add wave -noupdate /console_sim/uut/reset_i
add wave -noupdate /console_sim/uut/start_i
add wave -noupdate /console_sim/uut/data_i
add wave -noupdate /console_sim/uut/busy_o
add wave -noupdate /console_sim/uut/err_par_o
add wave -noupdate /console_sim/uut/s_clk_o
add wave -noupdate /console_sim/uut/s_data_io
add wave -noupdate /console_sim/uut/end_sh_s
add wave -noupdate /console_sim/uut/s_clk_s
add wave -noupdate /console_sim/uut/s_data_rx_s
add wave -noupdate /console_sim/uut/s_data_tx_s
add wave -noupdate /console_sim/uut/init_s
add wave -noupdate /console_sim/uut/run_div_s
add wave -noupdate /console_sim/uut/shift_s
add wave -noupdate /console_sim/uut/cal_par_s
add wave -noupdate /console_sim/uut/sel_sdata_s
add wave -noupdate /console_sim/uut/on_sdata_s
add wave -noupdate /console_sim/uut/set_err_par_s
add wave -noupdate /console_sim/uut/ser_out_s
add wave -noupdate /console_sim/uut/parity_s
add wave -noupdate -divider {New Divider}
add wave -noupdate /console_sim/uut/mss_uc/etat_pres
add wave -noupdate /console_sim/uut/div_sclk/det_zero_s
add wave -noupdate /console_sim/uut/div_sclk/div_clk_s
add wave -noupdate /console_sim/uut/div_sclk/CPT_SIZE
add wave -noupdate /console_sim/uut/srg_send/init_i
add wave -noupdate /console_sim/uut/srg_send/en_sh_i
add wave -noupdate /console_sim/uut/srg_send/reg_pres
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
