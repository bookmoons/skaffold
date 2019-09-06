// +build gofuzz

package server

import (
	"fmt"
	"net"

	"github.com/GoogleContainerTools/skaffold/pkg/skaffold/config"
	"github.com/GoogleContainerTools/skaffold/pkg/skaffold/constants"
)

// FuzzTCP fuzzes binary requests to the control API.
func FuzzTCP(fuzz []byte) int {
	// Start control API server
	shutdown, err := Initialize(config.SkaffoldOptions{
		EnableRPC:   true,
		RPCPort:     constants.DefaultRPCPort,
		RPCHTTPPort: constants.DefaultRPCHTTPPort,
	})
	if err != nil {
		panic(err)
	}
	defer shutdown()

	// Connect to control API
	hostport := fmt.Sprintf("localhost:%d", constants.DefaultRPCHTTPPort)
	connection, err := net.Dial("tcp", hostport)
	if err != nil {
		panic(err)
	}

	// Deliver fuzz
	_, err = connection.Write(fuzz)
	if err != nil {
		return 0
	}
	err = connection.Close()
	if err != nil {
		return 0
	}
	return 1
}
