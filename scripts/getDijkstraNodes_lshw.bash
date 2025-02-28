#!/bin/bash

# SSH and execute lshw on Dijkstra nodes
for i in $(cat /etc/hosts | awk -v 'RS=\n\n' '1;{exit}')
do
    sudo ssh $i '(lshw | tee /home/nsynovic/$(hostname)_lshw)'
done
