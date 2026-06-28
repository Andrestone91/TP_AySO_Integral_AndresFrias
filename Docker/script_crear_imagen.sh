#!bin/bash

sudo chown vagrant:vagrant /var/lib/docker
sudo mkdir /var/lib/docker/tmp
sudo mkdir /var/lib/docker/containers
sudo mkdir -p /var/lib/docker/buildkit/containerd-overlayfs/cachemounts

docker build -t tp_div_313_andres_frias:latest .

#docker run -d -p 8081:80 -v $PWD/web/file:/usr/share/nginx/html/file/ -t tp_div_313_andres_frias:latest

