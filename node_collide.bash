#!/bin/bash

echo `seq 1 $3` | xargs -n 1 -P 100 node generate_uuids.js $1 $2 > temp.txt
sort temp.txt | node find_collisions.js
