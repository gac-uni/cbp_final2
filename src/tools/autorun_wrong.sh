#!/bin/bash
ERR_FILE_NAME=GM_hdpr_e
OUT_FILE_NAME=GM_hdpr_o

maxruns=10
counter=0

while [ counter -le maxruns ]
do 
    if [ -e "$ERR_FILE_NAME" ] then
        isdone=$(grep 'Run time exceeded' $ERR_FILE_NAME)
        mv "$ERR_FILE_NAME" "$ERR_FILE_NAME_run_$counter"
        mv "$OUT_FILE_NAME" "$OUT_FILE_NAME_run_$counter"
        if [ -z "$isdone" ] then
            echo "done"
            break
        else
            echo starting run $counter - running npt_resume.pbs
            qsub npt_resume.pbs
        fi
    else 
        echo starting simulation - running npt_start.pbs
        qsub npt_start.pbs
    fi
    ((counter++))


done
