#!/bin/bash

<<<<<<<< HEAD:data_3eig/01_raw/02_NPT/00_npt_0/first_launcher.sh
jobid=$(qsub job_1.pbs | awk '{n=split($0,a,".");print(a[1])}')
========
jobid=$(qsub chain_job.pbs | awk '{n=split($0,a,".");print(a[1])}')
>>>>>>>> 96a5f591d11f45922d1c97cb99ba305d0d425cdb:src/scripts/continue_launcher.sh
echo "launched job $jobid"
for i in {1..3} # total number of restarts, change it.
do
  jobidold=$jobid
  jobid=$(qsub -W depend=afterok:${jobidold} chain_job.pbs)
  echo "launched job $jobid -depending on $jobidold"
done
