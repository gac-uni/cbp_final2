#! /bin/bash

arrstr="$(ls ../simulations_extra4/ | awk -F '_' 'BEGIN{a = ""}{a = a " " $2}END{print a}')"

IFS=" " read -r -a arr <<< "$arrstr"

for str in ${arr[@]}; do
    echo $str
    path="../simulations_extra4/results/sim_"$str"/mdrun_pullf.xvg"
    ptarg="pullf/umbrella"$str"_pullf.xvg"
    cp $path $ptarg
    path="../simulations_extra4/results/sim_"$str"/mdrun.tpr"
    ptarg="tpr/umbrella"$str".tpr"
    cp $path $ptarg
done
