#!/bin/bash

groups=$(sudo docker run -v /vagrant:/app/parallelTests/ acme/parallelTests phpunit -c /app/parallelTests/app --list-groups)

parsed=$(echo $groups | sed "s/-/\t/g")
results=$(echo $parsed | awk '{for(i=9;i<=NF;i++) {print $i}}')

for i in $results; do
   echo $i
done | parallel sudo docker run -v /vagrant:/app/parallelTests/ acme/parallelTests phpunit -c /app/parallelTests/app --group {}
