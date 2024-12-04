#!/bin/bash

gmx grompp -f {{f_mdp}} -c {{f_conf}} {{f_restr}} -p {{f_topol}} {{f_index}} {{f_checkpoint}} -o {{f_out}}