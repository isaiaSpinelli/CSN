onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider SIGNAUX_ERREUR
add wave -noupdate -radix unsigned /acqu_pos_top_tb/erreur_s
add wave -noupdate -radix decimal /acqu_pos_top_tb/nbr_err_s
add wave -noupdate -radix decimal /acqu_pos_top_tb/nbr_err_dir_cw_s
add wave -noupdate -divider SIGNAUX_REFERENCE
add wave -noupdate -radix decimal /acqu_pos_top_tb/position_ref
add wave -noupdate -radix decimal /acqu_pos_top_tb/position_sync_ref
add wave -noupdate -radix unsigned /acqu_pos_top_tb/dir_cw_ref
add wave -noupdate -radix unsigned /acqu_pos_top_tb/dir_cw_sync_ref
add wave -noupdate -radix decimal /acqu_pos_top_tb/nbr_err_ref
add wave -noupdate -radix decimal /acqu_pos_top_tb/err_ref
add wave -noupdate -divider STIMULI_CAPTEUR
add wave -noupdate -radix unsigned /acqu_pos_top_tb/capt_a_sti
add wave -noupdate -radix unsigned /acqu_pos_top_tb/capt_b_sti
add wave -noupdate -radix unsigned /acqu_pos_top_tb/P0_sti
add wave -noupdate -divider UUT
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/clock_i
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/reset_i
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/init_pos_i
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/capt_a_i
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/capt_b_i
add wave -noupdate /acqu_pos_top_tb/uut/MSS1/Etat_Futur
add wave -noupdate /acqu_pos_top_tb/uut/MSS1/Etat_Present
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/dir_cw_o
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/position_o
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/det_err_o
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/err_o
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/nbr_err_o
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/det_err_s
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/enable_s
add wave -noupdate -radix unsigned /acqu_pos_top_tb/uut/dir_cw_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {262 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 200
configure wave -valuecolwidth 50
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
WaveRestoreZoom {0 ns} {889 ns}
