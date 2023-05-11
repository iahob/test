 #/bin/sh
docker run -v $(pwd):/go/src/app -w /go/src/app yuwenhaibo/proto-builder sh -c '
  protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. *.proto;
'

