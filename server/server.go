package server

import (
	"context"
	"life/api/hello"
	"log"
	"time"
)

type ServerImpl struct {
	hello.UnimplementedServiceServer
}

func (s *ServerImpl) SayHello(ctx context.Context, req *hello.Request) (*hello.Response, error) {
	log.Printf("req:%s", req.Greeting)
	return &hello.Response{
		Reply:    req.Greeting,
		UpdateAt: time.Now().Unix(),
	}, nil
}
