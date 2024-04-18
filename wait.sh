#!/bin/bash

# 获取当前文件夹下的所有子文件夹
subdirectories=$(find . -mindepth 1 -maxdepth 1 -type d)

# 遍历每个子文件夹
for subdir in $subdirectories; do
  # 进入子文件夹的complex文件夹并运行指定的命令
  cd "$subdir/complex/"
  nohup bash job_complex.sh &
  complex_pid=$!  # 获取 job_complex.sh 进程的 PID
  wait $complex_pid
  cp complex.top ../lig_protein_water/SYS.itp
  cp npt_100.gro ../lig_protein_water/SYS.gro
  cd ../..

  # 等待 complex 进程完成
  
  #cp "$subdir"/complex/

  # 进入子文件夹的LIG文件夹并运行指定的命令
  cd "$subdir/LIG/"
  nohup bash job_LIG.sh &
  lig_pid=$!  # 获取 job_LIG.sh 进程的 PID
  wait $lig_pid
  cp LIG.top ../lig_water/SYS.itp
  cp npt_100.gro ../lig_water/SYS.gro
  cd ../../

  # 等待 LIG 进程完成
  #wait $lig_pid
done
