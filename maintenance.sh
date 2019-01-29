#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get check
sudo apt-get -f -y install
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean
