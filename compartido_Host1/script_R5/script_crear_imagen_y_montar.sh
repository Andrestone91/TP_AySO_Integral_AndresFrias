#!bin/bash

docker build -t tp_div_313_andres_frias:latest $HOME/repogit/UTN-FRA_SO_TP-Integral/docker

docker run -d -p 8081:80 -v $HOME/repogit/UTN-FRA_SO_TP-Integral/docker/web/file:/usr/share/nginx/html/file tp_div_313_andres_frias

