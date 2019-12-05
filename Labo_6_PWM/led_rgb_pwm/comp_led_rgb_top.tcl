###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : comp_led_rgb_top.tcl
# Description  : Script de compilation des fichiers
# 
# Auteur       : Etienne Messerli
# Date         : 16.11.2015
#
# Utilise      : Compilation des fichiers commande led rgb (led_rgb_top.vhd)
#                labo CSN Led_rgb 2015
#
#--| Modifications |--------------------------------------------------------
# Ver  Aut.  Date   Description
#                         
############################################################################


#create library work        
vlib work
#map library work to work
vmap work work

# gen_3pwm files compilation
vcom -reportprogress 300 -work work   ../src/cpt_div_2n.vhd
vcom -reportprogress 300 -work work   ../src/cpt_periode_pwm.vhd
vcom -reportprogress 300 -work work   ../src/cpt_pwm_out.vhd
vcom -reportprogress 300 -work work   ../src/gen_3pwm.vhd

# level converter compilation
vcom -reportprogress 300 -work work   ../src/level_converter.vhd

# gestion mode compilation
vcom -reportprogress 300 -work work   ../src/gestion_mode.vhd

# led_rgb_top file compilation
vcom -reportprogress 300 -work work   ../src/led_rgb_top.vhd

# test-bench compilation
vcom -reportprogress 300 -work work   ../src_tb/LED_RGB_tb.vhd
vcom -reportprogress 300 -work work   ../src_tb/console_sim.vhd
