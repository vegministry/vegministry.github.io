#!/bin/bash

# Set the input file path
input_file=$1

# Print the header
echo "events:"

tail -n +2 $1 | while read line
do
  event=$(echo $line | cut -d',' -f1)
  date=$(echo $line | cut -d',' -f2)
  description=$(echo $line | cut -d',' -f3)
  status=$(echo $line | cut -d',' -f4 | tr -d '\r')

  echo "  $event:"
  echo "    Date: $date"
  echo "    Description: $description"
  echo "    Status: $status"
done 
