package serv

import (
	"context"

	"github.com/spf13/cobra"
)

type ServerStartOptions struct {
	id     string
	listen string
}

// NewServerStartCmd creates a new http server command
func NewServerStartCmd(ctx context.Context, port string) *cobra.Command {
	opts := &ServerStartOptions{}

	cmd := &cobra.Command{
		Use:   "chat",
		Short: "Starts a chat server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return RunServerStart(ctx, opts)
		},
	}
	cmd.PersistentFlags().StringVarP(&opts.id, "serverid", "i", "demo", "server id")
	cmd.PersistentFlags().StringVarP(&opts.listen, "listen", "l", port, "listen address")
	return cmd
}

func RunServerStart(ctx context.Context, opts *ServerStartOptions) error {
	server := NewServerStruct(opts.id, opts.listen)
	defer server.Shutdown()
	return server.Start()
}
