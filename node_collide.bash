#!/bin/bash

echo `seq 1 $3` | xargs -n 1 -P 100 node generate_uuids.js $1 $2 > temp.txt
cat temp.txt | node find_collisions.js
rm temp.txt
