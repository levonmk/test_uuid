#!/bin/bash

UUID_ALGORITHM=$1
BATCH_SIZE=$2
NUM_BATCHES=$3
PARALLELISM=100

NUM_UUIDS=$((BATCH_SIZE*NUM_BATCHES))

echo "Using algorithm ${UUID_ALGORITHM} to generate ${NUM_UUIDS} UUIDS. ${BATCH_SIZE} per batch * ${NUM_BATCHES} batches. Parallelism ${PARALLELISM}."

rm temp.txt
if [[ $UUID_ALGORITHM =~ ^.*\.js$ ]]; then
    GENERATE_COMMAND="node generate_uuids.js $UUID_ALGORITHM $BATCH_SIZE {}"
else
    GENERATE_COMMAND="php generate_uuids.php -a=$UUID_ALGORITHM -n=$BATCH_SIZE -b={}"
fi
echo `seq 1 ${NUM_BATCHES}` | xargs -n 1 -P 100 -I {} bash -c "printf \"\r{}/${NUM_BATCHES} batches      \" && ${GENERATE_COMMAND} >> temp.txt"
echo

ACTUAL_UUIDS=`cat temp.txt | wc -l`
echo "${ACTUAL_UUIDS} UUIDs generated"

sort temp.txt > temp.sorted
echo "sorted. Looking for collisions"

awk '{print $4,$3,$2,$1}' temp.sorted | uniq -f 3 | awk '{print $4,$3,$2,$1}' > temp.unique
UNIQUE_UUIDS=`cat temp.unique | wc -l`
echo "$UNIQUE_UUIDS unique UUIDs found."

COLLISIONS=$((ACTUAL_UUIDS-UNIQUE_UUIDS))
if (( COLLISIONS > 0 )); then
    echo "$COLLISIONS collisions found"
    diff -U 1 temp.unique temp.sorted
fi
