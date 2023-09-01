package main

import (
	"context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/keepalive"
	"life/api/hello"
	"log"
	"time"
)

const addr = "172.20.42.254:6666"

func main() {
	kl := keepalive.ClientParameters{
		Time:                10 * time.Second, // 10秒没有活动后开始发送保活探测包
		Timeout:             5 * time.Second,  // 发送保活探测包后等待5秒才认为连接已断开
		PermitWithoutStream: true,             // 允许即使没有活动的RPC流也发送保活探测包
	}
	conn, err := grpc.DialContext(context.TODO(), addr,
		grpc.WithTransportCredentials(insecure.NewCredentials()),
		grpc.WithKeepaliveParams(kl))
	if err != nil {
		log.Printf(" err:%v", err)
		return
	}
	i := 0
	for {
		if i > 3000 {
			return
		}
		client := hello.NewServiceClient(conn)
		res, err := client.SayHello(context.TODO(), &hello.Request{})
		log.Printf("msg:%s time:%d err:%v", res.Reply, res.UpdateAt, err)
		i++
		time.Sleep(3 * time.Second)
	}

}
