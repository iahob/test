#!/bin/sh
# shellcheck disable=SC2046
echo "current dir:`$(pwd)`"
docker run --rm -v $(pwd):/go/src/app -w /go/src/app yuwenhaibo/proto-builder sh -c '
  protoc --proto_path=api --go-grpc_out=paths=source_relative:api --go_out=paths=source_relative:api api/hello.proto;
'
sleep 2
