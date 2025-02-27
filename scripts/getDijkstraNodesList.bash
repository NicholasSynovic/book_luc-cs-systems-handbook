#!/bin/bash

# Return the IP address, domain name, and hostname of nodes on Dijkstra
# Run on the login node
cat /etc/hosts | awk -v 'RS=\n\n' '1;{exit}'
