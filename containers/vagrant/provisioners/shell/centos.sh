#!/bin/bash

sudo yum install -y git wget
sudo yum update -y

wget --continue https://storage.googleapis.com/TimeShittle/go1.8.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz

Shittle_PATH="~vagrant/go/src/github.com/TimeChain/go-TimeChain/build/bin/"

echo "export PATH=$PATH:/usr/local/go/bin:$Shittle_PATH" >> ~vagrant/.bashrc
