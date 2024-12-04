#!/bin/bash

gmx grompp -f step5_production.mdp -c step5_restricted.gro  -p topol.top -n index.ndx -t step5_restricted.cpt -o step5_prod_0.tpr