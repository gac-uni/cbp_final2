#!/bin/bash
if [ "$#" -ne 1 ]
then
    echo argument missing, pass h to help
else 
    if [ "$1" = "h" ]
    then
        echo name of the directory to send to :/toCluster/
    else 
        scp -r $1/ giacomo.marcon@hpc2.unitn.it:toCluster/$1/
    fi
fi
