package main

import (
	"fmt"
	"google.golang.org/grpc"
	"life/api/hello"
	"life/server"
	"net"
)

func main() {
	lister, err := net.Listen("tcp", ":6666")
	if err != nil {
		fmt.Println(err)
		return
	}
	s := grpc.NewServer()
	hello.RegisterServiceServer(s, &server.ServerImpl{})
	err = s.Serve(lister)
	if err != nil {
		return
	}
}
