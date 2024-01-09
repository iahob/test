#!/bin/bash

# 遍历API文件夹下的所有子文件夹
function builder() {
  for dir in $1/*/; do
    dir=${dir%*/}  # 删除末尾的斜杠
    for file in $dir/*.proto; do
      echo $file
      protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. $file
    done
  done
}

builder $1

 