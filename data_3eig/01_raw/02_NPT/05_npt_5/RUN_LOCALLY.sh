#!/bin/bash

gmx grompp -f step5_production.mdp -c step5_prod_4.gro  -p topol.top -n index.ndx -t step5_prod_4.cpt -o step5_prod_5.tpr