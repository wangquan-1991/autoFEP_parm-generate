gmx grompp -f em.mdp -c complex.gro -p complex.top -o em.tpr  -maxwarn 1&&
gmx mdrun -deffnm em -nb gpu -v &&

gmx grompp -f nvt_20.mdp -c em.gro -r em.gro  -p complex.top -o nvt_20.tpr -maxwarn 3&&

gmx mdrun -gpu_id 0 -deffnm nvt_20 -nb gpu -v

gmx grompp -f npt_100.mdp -c nvt_20.gro -r nvt_20.gro -t nvt_20.cpt -p complex.top -o npt_100.tpr -maxwarn 4&&

gmx mdrun -gpu_id 0 -deffnm npt_100 -nb gpu -v
