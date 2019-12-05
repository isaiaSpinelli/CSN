###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_acqu_pos_sim.tcl
# Description  : Script de compilation fichiers et lancement simulation
#                manuelle avec REDS_Console
#
# Auteur       : Etienne Messerli
# Date         : 07.12.2015
# Version      : 0.0
#
# Utilise      : Compilation/simulation manuelle acqu_pos_top.vhd
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date   Description
#                         
############################################################################
#------------------------------------
proc simulation_first_steps {} {
  # # Enlever warnings courants en début de simulation
  # Synchronous reset, so wait a while before enabling the warnings

  global StdArithNoWarnings
  global StdNumNoWarnings
  global NumericStdNoWarnings

  set StdArithNoWarnings 1
  set StdNumNoWarnings 1
  set NumericStdNoWarnings 1
  run 100 ns;
  set StdArithNoWarnings 0
  set StdNumNoWarnings 0
  set NumericStdNoWarnings 0
}

#compile all file 
do ../comp_acqu_pos_top.tcl

#Chargement fichier pour la simulation
vsim -novopt work.acqu_pos_top_tb 

#ajout signaux composant simuler dans la fenetre wave
add wave -divider SIGNAUX_ERREUR
add wave -radix unsigned erreur_s
add wave -radix decimal nbr_err_s
add wave -radix decimal nbr_err_dir_cw_s

add wave -divider SIGNAUX_REFERENCE
add wave -radix decimal position_ref
add wave -radix decimal position_sync_ref
add wave -radix unsigned dir_cw_ref
add wave -radix unsigned dir_cw_sync_ref
add wave -radix decimal nbr_err_ref
add wave -radix decimal err_ref

add wave -divider STIMULI_CAPTEUR
add wave -radix unsigned capt_a_sti
add wave -radix unsigned capt_b_sti
add wave -radix unsigned P0_sti

add wave -divider UUT
add wave -radix unsigned uut/*


# Run simulation
simulation_first_steps
config wave -signalnamewidth 1
config wave -namecolwidth 200
config wave -valuecolwidth 50
run -all
wave zoom full



