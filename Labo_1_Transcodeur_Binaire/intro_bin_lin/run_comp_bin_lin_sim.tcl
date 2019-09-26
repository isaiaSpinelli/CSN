###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : comp_bin_lin.do
# Description  : Script de compilation des fichiers et 
#                de lancement de la simulation manuel avec Top_Sim
# 
# Auteur       : Etienne Messerli
# Date         : 17.09.2014
# Version      : 1.0
#
# Utilise      : Compilation bin_lin_2a4.vhd
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date       Description
# 2.0  EMI  15.02.2019  Mise a jour
#
############################################################################


#create library work        
vlib work
#map library work to work
vmap work work

# bin-lin file compilation
#decommenter la ligne de la description souhaitee
vcom -reportprogress 300 -work work   ../src/bin_lin_2to4_tdv.vhd
#vcom -reportprogress 300 -work work   ../src/bin_lin_2to4_logic.vhd


# top_sim compilation
vcom -reportprogress 300 -work work   ../src_tb/console_sim.vhd

#Chargement fichier pour la simulation
vsim -novopt work.console_sim 

#ajout signaux composant simuler dans la fenetre wave
add wave UUT/*

#lance la console REDS
do /opt/tools_reds/REDS_console.tcl

#ouvre le fichier format predefini
#do wave_bin_lin_2to4_top_sim.do




