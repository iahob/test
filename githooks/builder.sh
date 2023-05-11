#!/bin/bash
# shellcheck disable=SC2046
echo "current dir:`pwd`"
for file in api/*
do
   if [[ $file = ~\.proto$ ]] ; then
    echo "current file:${file}"
    docker run --rm -v $(pwd):/go/src/app -w /go/src/app yuwenhaibo/proto-builder sh -c '
      protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. *.proto;
    '
  fi

done



sleep 2
