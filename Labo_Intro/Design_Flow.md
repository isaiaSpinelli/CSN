# Note d'introduction du design Flow

src       ->  travail
src_cpld  ->  pin
src_tb    ->  simulation

## Simulation (vsim - QuestaSim)
src_tb    ->  simulation
comp      -> QuestaSim (cd comp -> vsim -> new lib -> compile src -> compile src_tb (pin) -> simulation src_tb -> add wave (script) -> execute (tools->Tcl->..opt/) )
(Verifier les blocs loader)

## Projet (Quartus)
max V : 5M570ZF256C5

## A donner
src et scripts
