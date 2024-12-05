#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

counter=0

# Function to increment the counter using flock for atomic operations
increment_counter() {
  flock -n -x <(echo)  # Acquire an exclusive lock
  local current_count=$(cat counter.txt)
  ((current_count++))
  echo $current_count > counter.txt
  flock -u <(echo) #Release the lock
}

# Create the counter file
echo 0 > counter.txt

# Run the increment_counter function multiple times concurrently
for i in {1..10}; do
  increment_counter &
done

wait

# Print the final counter value
final_count=$(cat counter.txt)
echo "Final counter value: $final_count"