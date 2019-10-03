###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_comp_enc_prio_8in_sim.tcl
# Description  : Script de compilation des fichiers et 
#                de lancement de la simulation avec le test-bench
# 
# Auteur       : GAA
# Date         : 31.08.2016
# Version      : 1.0
#
# Utilise      : Compilation enc_prio_8in_top.vhd
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date      Description
# 1.0  EMI 05.10.2016  Adaptation pour version 16 entrees
#                         
############################################################################

#create library work        
vlib work
#map library work to work
vmap work work

# file compilation
vcom -reportprogress 300 -work work   ../src/enc_prio_4in.vhd
vcom -reportprogress 300 -work work   ../src/enc_prio_16in_top.vhd

# test-bench compilation
vcom -reportprogress 300 -work work   ../src_tb/enc_prio_16in_top_tb.vhd

#Chargement fichier pour la simulation
vsim -voptargs="+acc" work.enc_prio_16in_top_tb 

#ajout signaux composant simuler dans la fenetre wave
add wave UUT/*



