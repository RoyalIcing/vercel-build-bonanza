package main

import (
	"fmt"
	bridge "github.com/vercel/go-bridge/go/bridge"
	"net/http"
)

func Handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Hello from Go!</h1>")
}

func main() {
	bridge.Start(http.HandlerFunc(Handler))
}
