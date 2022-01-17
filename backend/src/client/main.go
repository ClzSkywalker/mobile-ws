package main

import (
	"C"
	"context"
	"fmt"
	"sync"

	"ws-server/src/client/client"
	"ws-server/src/server/serv"

	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

//export main
func main() {
	ctx := context.Background()

	group := sync.WaitGroup{}
	go func() {
		root := &cobra.Command{
			Use:     "client",
			Version: "1",
			Short:   "chat demo",
		}
		root.AddCommand(client.NewCmd(ctx, ":8000"))
		if err := root.Execute(); err != nil {
			logrus.WithError(err).Fatal("Could not run command")
		}
	}()
	group.Add(1)
	go func() {
		if err := serv.NewServerStartCmd(ctx, ":8001").Execute(); err != nil {
			logrus.WithError(err).Fatal("client error")
		}
	}()

	group.Add(1)
	group.Wait()
	fmt.Println("game over")
}
