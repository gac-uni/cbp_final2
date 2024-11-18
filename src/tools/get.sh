# !/bin/bash
if [ "$#" -ne 1 ]
then
    echo argument missing, pass h to help
else 
    if [ "$1" = "h" ]
    then
        echo name of the directory to get from :/toCluster, will not get subdirectories
    else 
        mkdir $1
        scp giacomo.marcon@hpc2.unitn.it:toCluster/$1/* $1/
    fi
fi
