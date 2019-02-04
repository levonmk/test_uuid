# test_uuid
Some scripts for testing UUID collision rates

There are some bad UUID generators out there, hopefully this makes it easier to test them.

# usage

```
./(node|php)_collide.bash [algorithm] [uuids_per_execution] [num_executions]
```

## Example

```
./node_collide.bash ./constant.js 5 7
```
will have an output of:
```
35 'js000000-uuid-4000-0000-constant0000'
```

## Constant

Since uuid generators should collide very rarely, you'll likely not see any output.
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
