package main

import (
	"context"
	"fmt"
	"net"
	"time"

	"google.golang.org/grpc"
	hello "test/protocol"
	hello2 "test/protocol/hello"
)

type ServerImpl struct {
	hello2.UnimplementedHelloServiceServer
}

func (s *ServerImpl) SayHello(context.Context, *hello.HelloRequest) (*hello.HelloResponse, error) {
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
	hello2.RegisterHelloServiceServer(s, &ServerImpl{})
	err = s.Serve(lister)
	if err != nil {
		return
	}
}
