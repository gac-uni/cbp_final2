# !/bin/bash
PERC="/home/giacomo/comp_bio/cbp_final/data_other/umbrella/01_raw/umbrella_frame_simulations/simulations_results"
FILES="sim_0
sim_104
sim_124
sim_139
sim_150
sim_166
sim_180
sim_206
sim_224
sim_236
sim_249
sim_272
sim_291
sim_313
sim_327
sim_351
sim_368
sim_403
sim_35
sim_70
sim_145
sim_17
sim_148
sim_149"

for NAME in $FILES
do 
    # NAME=$(echo $f | awk -v RS=/ 'END{print}')
    f="${PERC}/${NAME}"
    echo "=== COPYING $NAME ==="
    # cp "${f}/mdrun.gro" "${NAME}.gro"
    # cp "${f}/mdrun.tpr" "${NAME}.tpr"
    # cp "${f}/mdrun.xtc" "${NAME}.xtc"
    # cp "${f}/mdrun.edr" "${NAME}.edr"
    NUMNAME=$(echo $NAME | awk -v RS=_ 'END{print}')
    NAMECONF="conf${NUMNAME}.gro"
    cp "${f}/${NAMECONF}" "${NAME}_initial.gro"

    echo "=== REMOVING PBC $NAME ==="
    # echo 1 0 | gmx trjconv -s "${NAME}.tpr" -f "${NAME}.xtc" -o "${NAME}_nbc.xtc" -pbc mol -center

    echo "=== EXTRACTING OBSERVABLES ==="
    # echo 18 16 | gmx energy -f "${NAME}.edr" -o "${NAME}.xvg"

    echo "=== CLEANING DIR ==="
    rm "${NAME}.edr"
    rm "${NAME}.xtc"


done
