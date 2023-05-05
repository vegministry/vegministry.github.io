#!/bin/bash

echo "Service:"

tail -n +2 $1 | while read line
do
  serviceDay=$(echo $line | cut -d',' -f1)
  serviceTime=$(echo $line | cut -d',' -f2 | tr -d '\r')

  echo "  $serviceDay: $serviceTime"
done
