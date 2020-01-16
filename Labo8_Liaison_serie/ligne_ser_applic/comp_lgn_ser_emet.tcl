###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : comp_lgn_ser_emet.tcl
# Description  : Script de compilation des fichiers de l'emetteur
#                pour la ligne serie N bits
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


# Complation des paquetages
vcom -reportprogress 300 -work work   ../src/ligne_serie_pkg.vhd

# Complation des fichiers du mult_seq_top
vcom -reportprogress 300 -work work   ../src/divisor.vhd
vcom -reportprogress 300 -work work   ../src/cal_parity.vhd
vcom -reportprogress 300 -work work   ../src/srgn.vhd
vcom -reportprogress 300 -work work   ../src/flipflop_rs.vhd
vcom -reportprogress 300 -work work   ../src/flipflop_t.vhd
vcom -reportprogress 300 -work work   ../src/ctrl_affichage.vhd
vcom -reportprogress 300 -work work   ../src/emet_serie_uc.vhd
vcom -reportprogress 300 -work work   ../src/emet_serie.vhd

vcom -reportprogress 300 -work work   ../src/horloge_top.vhd

