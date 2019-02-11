# test_uuid
Some scripts for testing UUID collision rates

There are some bad UUID generators out there, hopefully this makes it easier to test them.

# usage

```
./test_collisions.bash [algorithm] [uuids_per_execution] [num_executions]
```

## Diff Columns
If any collisions are detected, the final part of the output will be a diff between the actual list of uuids that were generated and a deduplicated version of that list. There are four columns in that file:
```
UUID | Unix Timestamp | Batch Number | Sequence in Batch
```

## Example

```
./test_collisions.bash ./constant.js 2 3
```
will have an output of:
```
Using algorithm ./constant.js to generate 6 UUIDS. 2 per batch * 3 batches. Parallelism 100.
3/3 batches      
       6 UUIDs generated
sorted. Looking for collisions
       1 unique UUIDs found.
5 collisions found
--- temp.unique	2019-02-11 07:57:50.000000000 -0500
+++ temp.sorted	2019-02-11 07:57:50.000000000 -0500
@@ -1 +1,6 @@
 js000000-uuid-4000-0000-constant0000 1549889870825 2 0
+js000000-uuid-4000-0000-constant0000 1549889870828 2 1
+js000000-uuid-4000-0000-constant0000 1549889870828 3 0
+js000000-uuid-4000-0000-constant0000 1549889870830 1 0
+js000000-uuid-4000-0000-constant0000 1549889870831 3 1
+js000000-uuid-4000-0000-constant0000 1549889870834 1 1
```

## Constant

Since uuid generators should collide very rarely, you'll likely not see any.
To prove that everything is working, use the `constant(.php|.js)` implementation, which will always generate the same uuid.

# Expectations

UUIDv4 should collide very rarely. How rarely?
Let's refer to the [wikipedia page](https://en.wikipedia.org/wiki/Universally_unique_identifier#Collisions)

```
the number of random version 4 UUIDs which need to be generated
in order to have a 50% probability of at least one collision
is 2.71 quintillion
...
This number is equivalent to generating
1 billion UUIDs per second
for about 85 years
...
and a file containing this many UUIDs
at 16 bytes per UUID
would be about 45 exabytes
...
many times larger than the largest databases currently in existence
which are on the order of hundreds of petabytes.
```
