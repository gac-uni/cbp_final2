import os
import jinja2
import numpy as np

all_frames = "umbrella_window_extra4.txt"
all_frames = np.loadtxt(all_frames, dtype=int, comments = "#")


templateLoader = jinja2.FileSystemLoader(searchpath="./")
templateEnv = jinja2.Environment(loader=templateLoader)
t_equil = templateEnv.get_template("t_equil.pbs")
t_run_first = templateEnv.get_template("t_run_first.pbs")
t_run_chain = templateEnv.get_template("t_run_chain.pbs")

for frame in all_frames:
    sframe = str(frame)
    # getting the correct gro file
    grofile = "frames/conf"+sframe+".gro"
    # generating the appropriate directory
    newdir = "simulations_extra4/"+"sim_"+sframe+"/"
    os.system("mkdir "+newdir)
    # generating the appropriate templates
    equil = t_equil.render({"input_conf": "conf"+sframe, "deffnm": "equil"})
    run_first = t_run_first.render({"input_conf": "equil", "deffnm": "mdrun"})
    run_chain = t_run_chain.render({"input_conf": "mdrun", "deffnm": "mdrun"})
    # copy everything over
    os.system("cp -r sim_src/* "+newdir)
    os.system("cp "+grofile+" "+newdir)
    with open(newdir+"equil.pbs", "w") as f:
        f.write(equil)
    with open(newdir+"run_first.pbs", "w") as f:
        f.write(run_first)
    with open(newdir+"run_chain.pbs", "w") as f:
        f.write(run_chain)


