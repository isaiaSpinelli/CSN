###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_comp_add4_full_tb.tcl
# Description  : Script de compilation des fichiers et 
#                de lancement de la simulation
# 
# Auteur       : Gaetan Matthey
# Date         : 16.10.2015
# Version      : 1.0
#
# Utilise      : Compilation bin_lin_2a4.vhd
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date        Description
# 1.1  EMI   11.02.2016  adaptation pour mes fichiers
# 1.2  EMI   06.03.2017  version pour add4 full (carry + overflow)
# 1.3  ISS   22.10.2018  Modification pour addn_full
#                      
############################################################################

#create library work        
vlib work
#map library work to work
vmap work work

# add4 with C and Ovr files compilation
#vcom -reportprogress 300 -work work   ../src/ autre fichier ....
vcom -reportprogress 300 -work work   ../src/addn.vhd
vcom -reportprogress 300 -work work   ../src/add4_full.vhd

# test-bench compilation
vcom -reportprogress 300 -work work   ../src_tb/add4_full_tb.vhd

#Chargement fichier pour la simulation
vsim -novopt work.add4_tb 

#ajout signaux composant simuler dans la fenetre wave
#add wave UUT/*

#ouvre le fichier format predefini
do wave_add4_tb.do


