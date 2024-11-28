00_npt_restricted: npt run with restrictions, part of the pre-prod

00_npt: first prod run, 10e6 steps terminated correctly (30c, 20GB)

01_npt_1: second prod run, 12e6 steps terminated correctly (40c, 30GB)

02_npt_2_not_terminated: third prod run, 12e6 steps terminated at 6e6 steps (30c, 30GB)

03_not_terminated: started from 02_npt_2_not_terminated with initial .gro, 03_npt_3 10e6 steps terminated 6e6. 03_npt_3_extended did not really work, the trajectory is overwritten probably.
