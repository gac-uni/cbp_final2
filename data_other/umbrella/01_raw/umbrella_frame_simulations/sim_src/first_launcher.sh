#!/bin/bash

jobid=$(qsub equil.pbs | awk '{n=split($0,a,".");print(a[1])}')
echo "launched equilibration job $jobid"
jobid=$(qsub -W depend=afterok:${jobid} run_first.pbs)
echo "launched md job $jobid"
jobid=$(qsub -W depend=afterok:${jobid} run_chain.pbs)
echo "launched md job $jobid"
jobid=$(qsub -W depend=afterok:${jobid} run_chain.pbs)
echo "launched md job $jobid"

