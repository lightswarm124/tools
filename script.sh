#!/bin/bash

sudo add-apt-repository ppa:jonathonf/vim

sudo apt update

sudo apt install -y build-essential curl git make vim tmux;
git clone https://github.com/lightswarm124/scripts.git;

sudo apt -y autoremove autoclean clean
