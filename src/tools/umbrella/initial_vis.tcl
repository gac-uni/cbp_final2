set base [mol new sim_0_initial.gro]
mol modselect 0 $base protein
mol modstyle 0 $base NewCartoon
mol addrep $base 
mol modselect 1 $base resname MTX
mol modstyle 1 $base Licorice
set baseprot [atomselect $base "protein"]

set counter 0
foreach m {0 17 35 70 104 124 139 145 148 149 150 166 180 206 224 236 249 272 291 313 327 351 368 403} {
    incr counter
    set curr [mol new "sim_${m}_initial.gro"]
    mol modselect 0 $curr resname MTX
    mol modstyle 0 $curr Licorice
    mol modcolor 0 $curr ColorID $counter
    set all [atomselect $curr "all"]
    set prot [atomselect $curr "protein"]
    set M [measure fit $baseprot $prot]
    $all move $M
}
