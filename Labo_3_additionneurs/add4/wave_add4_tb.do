onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /add4_tb/Nbr_A_sti
add wave -noupdate /add4_tb/Nbr_B_sti
add wave -noupdate /add4_tb/Cin_sti
add wave -noupdate /add4_tb/Somme_obs
add wave -noupdate /add4_tb/Somme_ref
add wave -noupdate /add4_tb/Cout_obs
add wave -noupdate /add4_tb/Cout_ref
add wave -noupdate /add4_tb/Ovr_obs
add wave -noupdate /add4_tb/Ovr_ref
add wave -noupdate /add4_tb/Erreur_s
add wave -noupdate -radix unsigned /add4_tb/Nbr_Err_v
add wave -noupdate -divider {Internal signal}
add wave -noupdate /add4_tb/uut/cin_i
add wave -noupdate /add4_tb/uut/cout_o
add wave -noupdate /add4_tb/uut/ovr_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {47492 ns} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {46943 ns} {51425 ns}
