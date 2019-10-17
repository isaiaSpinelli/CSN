###########################################################################
# HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
# Institut REDS, Reconfigurable & Embedded Digital Systems
#
# Fichier      : README.txt
# Description  : Information sur le projet add4
# 
# Auteur       : Etienne Messerli
# Date         : 06.03.2017
#
#--| Modifications |--------------------------------------------------------
# 
#                      
############################################################################

Information sur les différentes simulation de l'add4 possible:

1. simulation manuelle de add4.vhd  à l'aide du fichier console_sim.vhd
     - lancement de la simulation  à l'aide du script:  run_comp_add4_sim.tcl 
     
2. simulation automatique add4.vhd, version avec carry uniquement
     - lancement de la simulation automatique à l'aide du script:  run_comp_add4_c_tb.tcl  
       puis run -all

3. simulation automatique add4.vhd, version full avec carry et overflow
     - lancement de la simulation automatique à l'aide du script:  run_comp_add4_full_tb.tcl      
       puis run -all