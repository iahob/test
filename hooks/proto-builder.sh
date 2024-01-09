#!/bin/bash

# 递归函数，用于处理指定路径下的所有.proto文件
function generate_protobuf() {
  local directory="$1"
  for file in "$directory"/*.proto; do
    if [ -f "$file" ]; then
      protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. "$file"
    fi
  done
  for subdir in "$directory"/*/; do
    if [ -d "$subdir" ]; then
      generate_protobuf "$subdir"
    fi
  done
}
generate_protobuf $1
 