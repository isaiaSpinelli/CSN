###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_comp_mux4to1_sim.tcl
# Description  : Script de compilation des fichiers et lancement
#                de la simulation manuelle la console REDS
# 
# Auteur       : Etienne Messerli
# Date         : 13.08.2015
#
# Utilise      : Compilation et simulation manip Mux4to1
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date       Description
# 1.1  EMI  22.09.2016  Modifier lancement console 
#                       do /opt/tools_reds/REDS_console.tcl
#                         
############################################################################

# Questasim: repertoire de travail ../mux4a1_xxx/comp/

#create library work        
vlib work
#map library work to work
vmap work work

# mux4to1 file compilation
vcom -reportprogress 300 -work work   ../src/mux4to1.vhd

# test bench file compilation
vcom -reportprogress 300 -work work   ../src_tb/console_sim.vhd

#Chargement fichier pour la simulation
vsim -voptargs="+acc" work.console_sim 

#ajout signaux composant simuler dans la fenetre wave
add wave UUT/*

#lance la console REDS
#do ../console/REDS_console_logisim_mod.tcl
do /opt/tools_reds/REDS_console.tcl

#ouvre le fichier format predefini
#do wave_bin_lin_2to4_top_sim.do
