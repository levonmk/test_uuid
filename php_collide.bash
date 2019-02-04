#!/bin/bash

echo `seq 1 $3` | xargs -n 1 -P 100 php generate_uuids.php -a=$1 -n=$2 | node find_collisions.js
