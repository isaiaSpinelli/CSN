###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_comp_enc_prio_4in_sim.do
# Description  : Script de compilation des fichiers et 
#                de lancement de la simulation avec la console
# 
# Auteur       : GAA
# Date         : 31.08.2016
# Version      : 1.0
#
# Utilise      : Compilation enc_prio_4in.vhd
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date   Description
#                         
############################################################################


#create library work        
vlib work
#map library work to work
vmap work work

#file compilation
vcom -reportprogress 300 -work work   ../src/enc_prio_4in.vhd

# console_sim compilation
vcom -reportprogress 300 -work work   ../src_tb/console_sim.vhd

#Chargement fichier pour la simulation
vsim work.console_sim

#ajout signaux composant simuler dans la fenetre wave
add wave UUT/*

#lance la console REDS
do /opt/tools_reds/REDS_console.tcl

#ouvre le fichier format predefini
#do ***.do




