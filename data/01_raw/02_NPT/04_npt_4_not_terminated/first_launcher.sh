#!/bin/bash
FIRST_LAUNCHER=npt_start.pbs
RESUMER=npt_resume.pbs

jobid=$(qsub $FIRST_LAUNCHER | awk '{n=split($0,a,".");print(a[1])}')
echo "launched job $jobid"
for i in {1..5} # total number of restarts, change it.
do
  jobidold=$jobid
  jobid=$(qsub -W depend=after:${jobidold} $RESUMER)
  echo "launched job $jobid -depending on $jobidold"
done
