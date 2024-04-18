#!/bin/bash

# 获取当前文件夹下的所有子文件夹
subdirectories=$(find . -mindepth 1 -type d)

# 遍历每个子文件夹
for subdir in $subdirectories; do
  # 拷贝脚本文件到子文件夹
  cp *.sh *.mdp *.in *.py "$subdir"

  # 进入子文件夹
  cd "$subdir"

  # 执行 bash parm.sh 命令
  nohup bash run.sh&

  # 返回上一级目录
  cd ..
done
