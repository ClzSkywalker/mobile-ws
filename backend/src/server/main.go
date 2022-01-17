package main

import (
	"C"
)
import (
	"context"
	"flag"
	"ws-server/src/client/client"
	"ws-server/src/server/serv"

	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

const version = "v1"

func main() {
	flag.Parse()

	root := &cobra.Command{
		Use:     "chat",
		Version: version,
		Short:   "chat demo",
	}
	ctx := context.Background()

	root.AddCommand(serv.NewServerStartCmd(ctx, ":8000"))
	root.AddCommand(client.NewCmd(ctx, ":8000"))

	if err := root.Execute(); err != nil {
		logrus.WithError(err).Fatal("Could not run command")
	}
}

//export clientServer
func clientServer() {
	ctx := context.Background()
	if err := client.NewCmd(ctx, ":8000").Execute(); err != nil {
		logrus.WithError(err).Fatal("client error")
	}
	if err := serv.NewServerStartCmd(ctx, ":8001").Execute(); err != nil {
		logrus.WithError(err).Fatal("client error")
	}
}
