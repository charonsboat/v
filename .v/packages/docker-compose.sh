#!/bin/sh

# path to docker-compose
docker_compose=/usr/local/bin/docker-compose

# make sure docker-compose is installed
if [ ! -f $docker_compose ]
then
  # download docker-compose binary
  sudo curl -s -o $docker_compose -L "https://github.com/docker/compose/releases/download/1.13.0/docker-compose-$(uname -s)-$(uname -m)"

  # make it executable
  sudo chmod +x $docker_compose
fi

# run `docker-compose up -d` in any supplied paths
if [ $# -gt 0 ]
then
  for project_path in "$@"
  do
    cd "$project_path" && sudo $docker_compose up -d
  done
fi
