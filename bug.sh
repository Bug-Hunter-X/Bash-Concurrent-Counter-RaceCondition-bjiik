#!/bin/bash

# This script demonstrates a race condition bug.

counter=0

# Function to increment the counter
increment_counter() {
  local current_count=$(cat counter.txt)
  ((current_count++))
  echo $current_count > counter.txt
}

# Create the counter file
echo 0 > counter.txt

# Run the increment_counter function multiple times concurrently
for i in {1..10}; do
  increment_counter &
  sleep 0.1 #Introduce some delay to increase chances of race condition
done

wait

# Print the final counter value
final_count=$(cat counter.txt)
echo "Final counter value: $final_count"