#!/bin/bash

# 获取当前文件夹下的所有子文件夹
subdirectories=$(find . -mindepth 1 -type d)

# 设置最大并发任务数
MAX_CONCURRENT_TASKS=24

# 初始化计数器
task_count=0

# 遍历每个子文件夹
for subdir in $subdirectories; do
  # 拷贝脚本文件到子文件夹
  cp *.sh *.mdp *.in *.py "$subdir"

  # 进入子文件夹
  cd "$subdir"

  # 执行 bash run.sh 命令，并将任务放入后台
  nohup bash run.sh &

  # 增加任务计数器
  ((task_count++))

  # 当达到最大并发任务数时，等待所有任务完成
  if [ "$task_count" -eq "$MAX_CONCURRENT_TASKS" ]; then
    wait
    # 重置任务计数器
    task_count=0
  fi

  # 返回上一级目录
  cd ..
done

# 等待剩余的任务完成
wait