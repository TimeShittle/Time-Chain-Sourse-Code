.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/TimeChain/go-TimeChain/cmd/swarm
	go build -o bin/Shittle     github.com/TimeChain/go-TimeChain/cmd/Shittle
	go build -o bin/bootnode github.com/TimeChain/go-TimeChain/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/TimeChain/go-TimeChain/swarm/...
