#!/bin/bash
FIRST_LAUNCHER=npt_start.pbs
RESUMER=npt_resume.pbs
ERR_FILE=GM_hdpr_e
OUT_FILE=GM_hdpr_o

jobid=$(qsub $RESUMER | awk '{n=split($0,a,".");print(a[1])}')
echo "launched job $jobid"
for i in {1..5} # total number of restarts, change it.
do
  jobidold=$jobid
  local_err_file="$ERR_FILE-$i"
  jobid=$(qsub -W depend=afterok:${jobidold} -e $local_err_file $RESUMER | awk '{n=split($0,a,".");print(a[1])}')
  echo "launched job $jobid -depending on $jobidold"
done
