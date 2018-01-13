#!/bin/bash
sudo apt install -y openjdk-8-jdk python-software-properties

#NodeJS
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt install -y nodejs

#Rust & WASM
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup target add wasm32-unknown-emscripten
curl https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz | tar -xv -C ~/
cd ~/emsdk-portable
./emsdk update
./emsdk install sdk-incoming-64-bit
./emsdk activate sdk-incoming-64-bit
emcc -v
