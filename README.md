# Race Condition in Bash Script

This repository demonstrates a race condition bug in a simple bash script.

## Bug Description

The script `bug.sh` attempts to increment a counter using multiple concurrent processes. Due to the lack of proper synchronization mechanisms, a race condition can occur where updates to the counter are lost or overwritten, resulting in an incorrect final count.

## Bug Solution

The solution, `bugSolution.sh`, demonstrates a way to solve this bug using flock, a utility that provides file locking, which prevents multiple processes from concurrently accessing and updating the shared counter, solving the race condition problem.