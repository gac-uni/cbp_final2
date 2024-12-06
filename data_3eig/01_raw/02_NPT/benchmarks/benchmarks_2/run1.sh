#!/bin/bash
cd 00_npt_5c
qsub npt_start.pbs
cd ../
cd 00_npt_10c
qsub npt_start.pbs
cd ../
cd 00_npt_15c
qsub npt_start.pbs
cd ../
