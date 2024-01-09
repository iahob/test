#!/bin/bash

## 遍历API文件夹下的所有子文件夹
#function builder() {
#  for dir in $1/*/; do
#    dir=${dir%*/}  # 删除末尾的斜杠
#    for file in $dir/*.proto; do
#      echo $file
#      protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. $file
#    done
#  done
#}

protoc -I=./$1 --go_out=plugins=grpc,paths=source_relative:./$1 ./$1/**/*.proto


#builder $1

 