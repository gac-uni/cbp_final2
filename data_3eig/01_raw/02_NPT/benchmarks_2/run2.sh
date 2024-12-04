#!/bin/bash
cd 00_npt_20c
qsub npt_start.pbs
cd ../
cd 00_npt_25c
qsub npt_start.pbs
cd ../
