#!/bin/bash
cd 00_npt_30c
qsub npt_start.pbs
cd ../
cd 00_npt_35c
qsub npt_start.pbs
cd ../
