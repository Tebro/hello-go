package main

import "testing"

func TestGettingNumber(t *testing.T) {
	if getNumber() != 1337 {
		t.Error("Wrong number")
	}
}
