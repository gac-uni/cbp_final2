#!/bin/bash

gmx grompp -f step5_production.mdp -c step5_prod_3.gro  -p topol.top -n index.ndx -t step5_prod_3.cpt -o step5_prod_4.tpr