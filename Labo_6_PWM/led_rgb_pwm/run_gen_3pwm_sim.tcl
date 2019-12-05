###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_ctrl_gen_3pwm_sim.tcl
# Description  : Script de compilation des fichiers et 
#                de lancement de la simulation manuelle
# 
# Auteur       : Etienne Messerli
# Date         : 10.04.2017
#
# Utilise      : lancement de la simulation manuelle de gen_3pwm.vhd
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date   Description
#                         
############################################################################


#compile all file
do ../comp_led_rgb_top.tcl

#Chargement fichier pour la simulation
vsim -voptargs="+acc" work.console_sim(struct_gen_3pwm) 


#ajout signaux composant simuler dans la fenetre wave
add wave UUT/*


#lance la console REDS
do /opt/tools_reds/REDS_console.tcl

#ouvre le fichier format predefini
#do ***.do




