# Note d'introduction du design Flow

src       ->  travail
src_cpld  ->  pin
src_tb    ->  simulation

## Simulation (vsim - QuestaSim)
src_tb    ->  simulation
comp      -> QuestaSim (cd comp -> vsim -> new lib -> compile src -> compile src_tb (pin) -> simulation src_tb -> add wave (script) -> execute (tools->Tcl->..opt/) )
(Verifier les blocs loader)

cd comp
vsim
do ../run....
test

corriger src -> compile->compile...(src ET src_tb->comsole_sim.vhd)


## Projet (Quartus)
max V : 		5M570ZF256C5
racine projet : /pr

## A donner
src et scripts
