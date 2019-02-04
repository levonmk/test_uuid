#!/bin/bash

echo `seq 1 $3` | xargs -n 1 -P 100 node generate_uuids.js $1 $2 | node find_collisions.js
