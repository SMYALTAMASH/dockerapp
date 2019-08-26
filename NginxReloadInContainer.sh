#!/bin/bash
# Reload swarm nginx
nginxServers=$(sudo docker service ps proxy_proxy | grep Runn | awk '{print $4}' | tr "\n" " ")

#### Nginx Reload

for server in ${nginxServers[@]};
do
    processes=$(ssh -n $server sudo docker ps | grep proxy_proxy | awk '{print $1}' | tr "\n" " ")
    for process in ${processes[@]};
    do
        echo "ssh -n $server sudo docker exec $process nginx -s reload"
        ssh -n $server sudo docker exec $process nginx -s reload
    done    
done
