FROM --platform=$BUILDPLATFORM  golang:alpine as builder


RUN apk --no-cache add git ca-certificates bash protobuf unzip
#RUN wget -q -O protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v22.5/protoc-22.5-linux-x86_64.zip && unzip protoc.zip
#RUN mv /go/bin/protoc /usr/local/bin/protoc && rm protoc.zip

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.30.0
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.3.0
#ENV PATH="$PATH:$(go env GOPATH)/bin"

WORKDIR /go/src/app

# docker build --platform=linux/arm64 -t yuwenhaibo/proto-builder-arm:latest .
# docker build --platform=linux/amd64 -t yuwenhaibo/proto-builder-arm:latest .
