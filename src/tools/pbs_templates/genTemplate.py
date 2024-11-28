from jinja2 import Environment, PackageLoader
import templates

# associate template with relative dictionaries
fillers = {
    "t_run_start.pbs": ["pbs_parameters", "gmx_grompp", "gmx_mdrun"],
    "t_run_resume.pbs": ["pbs_parameters", "gmx_mdrun"]
}

def genTemplate(template_name, full_template_name_out, all_dicts):
    env = Environment(
        loader=PackageLoader("templates")
    )
    
    template = env.get_template(template_name)
    
    with open(full_template_name_out, "w") as f:
        d_complete = {}
        for string in fillers[template_name]:
            d_complete.update(all_dicts[string])
        f.write(template.render(**d_complete))
