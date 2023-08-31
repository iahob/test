package main

import (
	"context"
	"fmt"
	"life/protocol/common"
	"net"
	"time"

	"google.golang.org/grpc"
	"life/protocol/hello"
)

type ServerImpl struct {
	hello.UnimplementedHelloServiceServer
}

func (s *ServerImpl) SayHello(context.Context, *common.HelloRequest) (*common.HelloResponse, error) {
	return &hello.HelloResponse{
		Reply: "hello",
		Code:  "100",
		Times: time.Now().Unix(),
	}, nil
}

func main() {
	lister, err := net.Listen("tcp", ":8000")
	if err != nil {
		fmt.Println(err)
		return
	}
	s := grpc.NewServer()
	hello.RegisterHelloServiceServer(s, &ServerImpl{})
	err = s.Serve(lister)
	if err != nil {
		return
	}
}
