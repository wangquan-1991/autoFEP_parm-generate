import parmed as pmd
  
# convert GROMACS topology to AMBER format
#gmx_top = pmd.load_file('pmaawaterFE20mer2.top', xyz='pmaawaterFE20mer2.gro')
#gmx_top.save('pmaa.top', format='amber')
#gmx_top.save('pmaa.crd', format='rst7')

# convert AMBER topology to GROMACS, CHARMM formats
amber1 = pmd.load_file('complex.prmtop', 'complex.inpcrd')
# Save a GROMACS topology and GRO files
amber1.save('complex.top')
amber1.save('complex.gro')

# 加载 Amber 格式的文件
amber2 = pmd.load_file('LIG.prmtop', 'LIG.inpcrd')

# 保存为 Gromacs 格式的文件
amber2.save('LIG.gro', overwrite=True)
amber2.save('LIG.top', format='gromacs', overwrite=True)

# 加载 Amber 格式的文件
amber3 = pmd.load_file('lig_nowater.prmtop', 'lig_nowater.inpcrd')

# 保存为 Gromacs 格式的文件
amber3.save('LIG_36_nowat.gro', overwrite=True)
amber3.save('LIG_36_nowat.itp', format='gromacs', overwrite=True)                                                                   
