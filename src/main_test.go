package main

import "testing"

//TestGetNum tests the simplest function in this app
func TestGetNum(t *testing.T) {
	num := getNum()
	if num != 1337 {
		t.Error("Wrong number returned")
	}
}

func TestGetText(t *testing.T) {
	text := getText()
	if text != "Hello World" {
		t.Error("Wrong text returned")
	}
}
