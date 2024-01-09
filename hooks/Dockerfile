FROM --platform=$BUILDPLATFORM  golang:alpine as builder


RUN apk --no-cache add git ca-certificates bash protobuf unzip

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.30.0
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.3.0

#ENV PATH="$PATH:$(go env GOPATH)/bin"

WORKDIR /go/src/app

# docker build --platform=linux/arm64 -t yuwenhaibo/proto-builder-arm:latest .
# docker build --platform=linux/amd64 -t yuwenhaibo/proto-builder-amd:latest .
# docker manifest create yuwenhaibo/proto-builder yuwenhaibo/proto-builder-arm yuwenhaibo/proto-builder-amd
