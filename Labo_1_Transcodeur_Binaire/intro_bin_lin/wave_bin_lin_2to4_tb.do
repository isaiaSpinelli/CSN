onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bin_lin_2to4_tb/Val_Bin_Sti
add wave -noupdate /bin_lin_2to4_tb/Val_Lin_Obs
add wave -noupdate /bin_lin_2to4_tb/Val_lin_Ref
add wave -noupdate /bin_lin_2to4_tb/erreur
add wave -noupdate -radix unsigned /bin_lin_2to4_tb/Nb_Erreur
add wave -noupdate /bin_lin_2to4_tb/Fin_sim
add wave -noupdate -divider {Signaux UUT}
add wave -noupdate /bin_lin_2to4_tb/uut/bin_i
add wave -noupdate /bin_lin_2to4_tb/uut/lin_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 224
configure wave -valuecolwidth 87
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ns} {956 ns}
