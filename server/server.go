package server

import (
	"context"
	"life/api/hello"
	"time"
)

type ServerImpl struct {
	hello.UnimplementedServiceServer
}

func (s *ServerImpl) SayHello(ctx context.Context, req *hello.Request) (*hello.Response, error) {
	return &hello.Response{
		Reply:    req.Greeting,
		UpdateAt: time.Now().Unix(),
	}, nil
}
