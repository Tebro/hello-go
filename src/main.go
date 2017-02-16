package main

import (
	"fmt"
	"net/http"
)

func getText() string {
	return "Hello World"
}

func getNum() int {
	return 1337
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("Serving request for %s\n", r.URL)
	fmt.Fprintf(w, "%s %d\n", getText(), getNum())
}

func main() {
	fmt.Println("Starting server")
	http.HandleFunc("/", handler)
	http.ListenAndServe(":80", nil)
}
