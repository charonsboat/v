#!/bin/sh

# add docker gpg key
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# add docker repo
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'

# update apt repos
sudo apt-get update

# install docker
sudo apt-get install -y docker-engine

# add yourself to the docker group (yay, no sudo!)
sudo usermod -aG docker $(whoami)
