#使用antechamber利用bcc方法生成小分子力场参数，如果确定小分子电荷，可在后面添加 -nc 电荷数
antechamber -fi pdb -fo mol2 -i LIG.pdb -o LIG.mol2 -c bcc -s 2 -nc 1 &&
parmchk2 -i LIG.mol2 -f mol2 -o LIG.frcmod &&
echo 1
tleap -f tleap.in &&
echo 2
python3 AmbtoGMX.py &&
obabel LIG.pdb -ipdb -omol -O LIG.mol&&
echo quanbuwanchrngled
mkdir complex 
mkdir LIG
mkdir lig_water
mkdir lig_protein_water
cp job_complex.sh *mdp complex.gro complex.top complex/ 
#cd complex 
#nohup bash job_complex.sh&
#cd ..
cp job_LIG.sh *mdp LIG.gro LIG.top LIG/
#cd LIG
#nohup bash job_LIG.sh&
#cd ..

