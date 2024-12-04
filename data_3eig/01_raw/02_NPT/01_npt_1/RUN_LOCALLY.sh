#!/bin/bash

gmx grompp -f step5_production.mdp -c step5_prod_0.gro  -p topol.top -n index.ndx -t step5_prod_0.cpt -o step5_prod_1.tpr