###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_comp_mux4to1_tb.tcl
# Description  : Script de compilation des fichiers et 
#                de lancement de la simulation automatique
# 
# Auteur       : Etienne Messerli
# Date         : 13.08.2015
#
# Utilise      : Compilation et simulation manip Mux4to1
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date   Description
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
vcom -reportprogress 300 -work work   ../src_tb/mux4to1_tb.vhd

#Chargement fichier pour la simulation
vsim -voptargs="+acc" work.mux4to1_tb 

#ajout signaux composant simuler dans la fenetre wave
add wave UUT/*

#ouvre le fichier format predefini
#do wave_bin_lin_2to4_top_sim.do
