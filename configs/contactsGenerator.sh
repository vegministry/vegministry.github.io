#!/bin/bash

echo "Contact:"

tail -n +2 $1 | while read line
do
  key=$(echo $line | cut -d',' -f1)
  val=$(echo $line | cut -d',' -f2 | tr -d '\r')

  echo "  $key: $val"
done
