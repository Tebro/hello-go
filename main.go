package main

import "fmt"

func getNumber() int {
	return 1337
}

func getText() string {
	return "Hello World"
}

func main() {
	fmt.Printf("%s %d\n", getText(), getNumber())
}
