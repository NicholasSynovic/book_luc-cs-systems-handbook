#!/bin/bash

# SSH and execute hostnamectl on Dijkstra nodes
for i in $(cat /etc/hosts | awk -v 'RS=\n\n' '1;{exit}')
do
    sudo ssh $i '(hostnamectl | tee /home/nsynovic/$(hostname)_hostnamectl)'
done
