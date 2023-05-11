 #/bin/sh

protoc --go-grpc_out=paths=source_relative:. --go_out=paths=source_relative:. *.proto;