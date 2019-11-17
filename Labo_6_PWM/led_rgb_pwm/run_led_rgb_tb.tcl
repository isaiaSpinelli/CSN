###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_ctrl_level_rgb_sim.tcl
# Description  : Script de compilation des fichiers et 
#                de lancement de la simulation manuelle
# 
# Auteur       : Etienne Messerli
# Date         : 16.11.2015
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
vsim -voptargs="+acc" work.LED_RGB_tb

#Ouvre et place les fenetres signal et wave    
#do C:/EDA/Tools_REDS/QuestaSim/QuestaSim.do

#ajout signaux composant simuler dans la fenetre wave
add wave UUT/*

#Ajout signaux de référence et d'erreur
add wave -divider "signaux références et erreur"
add wave -position end  sim:/led_rgb_tb/R_Erreur_s
add wave -position end  sim:/led_rgb_tb/G_Erreur_s
add wave -position end  sim:/led_rgb_tb/B_Erreur_s
add wave -position end  sim:/led_rgb_tb/Nbr_Err_v

#lance la console specifique Aff_Min_Max.tcl
#do ../console/Aff_Min_Max.tcl
#lance la console REDS
#do /opt/tools_reds/REDS_console.tcl

#ouvre le fichier format predefini
#do wave_aff_min_max.do




