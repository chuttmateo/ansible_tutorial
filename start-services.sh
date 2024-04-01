#! /bin/bash
# start all containers and start services (apache2, ssh). Those services are not started by default.

containers=$(docker ps -a -q)

for container in $containers; do
    echo $container
    docker start $container
    docker exec $container service apache2 start
    docker exec $container service ssh start
done