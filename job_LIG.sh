gmx grompp -f em.mdp -c LIG.gro -p LIG.top -o em.tpr  -maxwarn 1&&
gmx mdrun -deffnm em -nb gpu -v &&

gmx grompp -f nvt_20_lig.mdp -c em.gro -r em.gro  -p LIG.top -o nvt_20.tpr -maxwarn 3&&

gmx mdrun -gpu_id 0 -deffnm nvt_20 -nb gpu -v

gmx grompp -f npt_100_lig.mdp -c nvt_20.gro -r nvt_20.gro -t nvt_20.cpt -p LIG.top -o npt_100.tpr -maxwarn 4&&

gmx mdrun -gpu_id 0 -deffnm npt_100 -nb gpu -v
