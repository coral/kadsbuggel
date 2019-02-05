package main

import (
	"io"
	"io/ioutil"
	"log"

	"github.com/gliderlabs/ssh"
)

func main() {
	dat, err := ioutil.ReadFile("kadsbuggel.txt")
	if err != nil {
		panic(err)
	}
	ssh.Handle(func(s ssh.Session) {
		io.WriteString(s, string(dat))
	})

	log.Fatal(ssh.ListenAndServe(":22", nil))
}
