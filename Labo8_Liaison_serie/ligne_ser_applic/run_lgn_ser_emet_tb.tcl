###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : run_lgn_ser_emet_sim.tcl
# Description  : Script pour simulation manuelle avec REDS console
#                 de l'emetteur pour la ligne serie N bits
#
# Auteur       : Etienne Messerli
# Date         : 22.05.2018
# Version      : 0.0
#
# Utilise      : Labo SysLog2, MSS complexe
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date        Description
#
#
############################################################################


#create library work
vlib work
#map library work to work
vmap work work

#compile all file
do ../comp_lgn_ser_emet.tcl

# top_sim compilation
vcom -reportprogress 300 -work work   ../src_tb/emet_serie_top_tb.vhd

#Chargement fichier pour la simulation
vsim -voptargs="+acc" work.emet_serie_top_tb

#ajout signaux composant simuler dans la fenetre wave
#add wave -position end sim:/emet_serie_top_tb/*
#add wave -position end sim:/emet_serie_top_tb/uut/*

do wave_lgn_ser_emet_tb.do
