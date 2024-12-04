#!/bin/bash

jobid=$(qsub job_1.pbs | awk '{n=split($0,a,".");print(a[1])}')
echo "launched job $jobid"
for i in {1..3} # total number of restarts, change it.
do
  jobidold=$jobid
  jobid=$(qsub -W depend=afterok:${jobidold} chain_job.pbs)
  echo "launched job $jobid -depending on $jobidold"
done
