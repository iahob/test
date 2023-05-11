package main

import (
	"context"
	"time"

	hello "test/api"
)

type Server struct {
	hello.UnimplementedHelloServiceServer
}

func (s *Server) SayHello(context.Context, *hello.HelloRequest) (*hello.HelloResponse, error) {
	return &hello.HelloResponse{
		Reply: "hello",
		Code:  "100",
		Times: time.Now().Unix(),
	}, nil
}

func main() {

}
