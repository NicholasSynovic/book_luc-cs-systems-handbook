#!/bin/bash

# SSH and execute dmidecode on Dijkstra nodes
for i in $(cat /etc/hosts | awk -v 'RS=\n\n' '1;{exit}')
do
    sudo ssh $i '(dmidecode | tee /home/nsynovic/$(hostname)_dmidecode)'
done
