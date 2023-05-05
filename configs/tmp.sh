#!/bin/bash

filename="./sheets/1-otVkXNn6i4tWGki9grXzc4DjG6TdQ_XWTBbJttlESU1050384173.csv"

IFS=',' # Set the field separator to comma
echo "SiteConfig:"
while read -r key value; do
  
  if [[ -n $key && -n $value ]]; then
  value=$(echo "$value" | tr -d '\n')
  value=$(echo "$value" | tr -d '\r')
  # Remove consecutive commas and the last comma if it is the last character in the line
  value=$(echo "$value" | sed -E 's/,{2,}/,/g;s/,$//')
  if [[ -n $key && -n $value ]]; then
        if echo "$value" | grep -q ','; then
            echo "    $key: "
            echo "        - $value" | sed 's/,/\n        - /g'
        else
        echo "    $key: $value"
        fi
    fi
   
  fi
done < "$filename"
