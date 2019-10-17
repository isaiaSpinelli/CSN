###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_comp_add4_c_tb.do
# Description  : Script de compilation des fichiers et 
#                de lancement de la simulation
# 
# Auteur       : Gaetan Matthey
# Date         : 16.10.2015
# Version      : 1.0
#
# Utilise      : Compilation add_4_c.vhd
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date        Description
# 1.1  EMI   11.02.2016  adaptation pour mes fichiers
# 2.0  EMI   03.03.2016  adaptation pour version add4 avec carry
#                      
############################################################################

#create library work        
vlib work
#map library work to work
vmap work work

# add4 with C and Ovr files compilation
#vcom -reportprogress 300 -work work   ../src/ autre fichier ....
vcom -reportprogress 300 -work work   ../src/add4.vhd

# test-bench compilation
vcom -reportprogress 300 -work work   ../src_tb/console_sim.vhd

#Chargement fichier pour la simulation
vsim work.console_sim 

#ajout signaux composant simuler dans la fenetre wave
add wave UUT/*

#lance la console REDS
#do ../console/REDS_console_logisim_mod.tcl
do /opt/tools_reds/REDS_console.tcl

#ouvre le fichier format predefini
#do wave_bin_lin_2to4_top_sim.do
