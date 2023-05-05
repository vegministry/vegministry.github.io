#!/bin/bash

# Set the input file path
input_file=$1


# Define the output array
# declare -a output=()
# output=()
declare -a output

index=0
echo "events: ["
# Print the header
tail -n +2 $1 | while read line
do
  eventItem=$(echo $line | cut -d',' -f1| tr -d '\r')
  url=$(echo $line | cut -d',' -f2| tr -d '\r')
  start=$(echo $line | cut -d',' -f3| tr -d '\r')
  stop=$(echo $line | cut -d',' -f4 | tr -d '\r')
  if [[ $index -gt 0 ]]; then
    echo ","
  fi
  ((index++))


  event="{"
  event+="\"title\": \"$eventItem\","
  event+="\"url\": \"$url\","
  event+="\"start\": \"$(date -d "$(awk -F'/' '{printf("%04d-%02d-%02d\n",$3,$2,$1)}' <<< $start)" +%Y-%m-%d)\","
  event+="\"end\": \"$(date -d "$(awk -F'/' '{printf("%04d-%02d-%02d\n",$3,$2,$1)}' <<< $stop)" +%Y-%m-%d)\""
  event+="}"
  
  echo $event
done 

echo "]"