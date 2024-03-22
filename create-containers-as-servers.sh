#! /bin/bash

# clean docker containers
#docker rm -f $(docker ps -a -q)

ditros=(ubuntu ubuntu debian)

for ((i = 0; i < ${#ditros[@]}; i++)); do

    echo "${ditros[$i]}-$i starting"
    
    docker run -it -d -p $((2220 + $i)):22 -p $((8080 + $i)):80 --name ${ditros[$i]}-$i ${ditros[$i]}

    docker exec ${ditros[$i]}-$i apt update

    docker exec ${ditros[$i]}-$i apt install -y openssh-server

done