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

#compile all file 
do ../comp_acqu_pos_top.tcl

#Chargement fichier pour la simulation
vsim work.console_sim 

#ajout signaux composant simuler dans la fenetre wave
add wave UUT/*

#lance la console REDS
do /opt/tools_reds/REDS_console.tcl

#ouvre le fichier format predefini
#do wave_gen_pwm.do




