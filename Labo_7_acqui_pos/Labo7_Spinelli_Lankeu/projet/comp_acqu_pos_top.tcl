###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : comp_acqu_pos_top.tcl
# Description  : Script de compilation des fichiers
# 
# Auteur       : Etienne Messerli
# Date         : 07.12.2015
# Version      : 0.0
#
# Utilise      : Compilation projet Acquisition de position table tournante
#                fichier comp_acqu_pos_top.vhd
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date   Description
#                         
############################################################################


#create library work        
vlib work
#map library work to work
vmap work work

#compile files

vcom -reportprogress 300 -work work   ../src/MSS.vhd
vcom -reportprogress 300 -work work   ../src/compteur_position.vhd  
vcom -reportprogress 300 -work work   ../src/flipflop_rs.vhd
  
vcom -reportprogress 300 -work work   ../src/acqu_pos_top.vhd

#compile files for simulation
vcom -reportprogress 300 -work work   ../src_tb/console_sim.vhd
vcom -reportprogress 300 -work work   ../src_tb/acqu_pos_top_tb.vhd
