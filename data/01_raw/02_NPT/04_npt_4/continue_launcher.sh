#!/bin/bash

jobid=$(qsub chain_job.pbs | awk '{n=split($0,a,".");print(a[1])}')
echo "launched job $jobid"
for i in {1..2} # total number of restarts, change it.
do
  jobidold=$jobid
  jobid=$(qsub -W depend=afterok:${jobidold} chain_job.pbs)
  echo "launched job $jobid -depending on $jobidold"
done
