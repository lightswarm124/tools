#!/bin/bash
sudo apt install -y openjdk-8-jdk python-software-properties

#NodeJS
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt install -y nodejs

#Rust
curl https://sh.rustup.rs -sSf | sh
