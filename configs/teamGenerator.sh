#!/bin/bash

echo "team:"

tail -n +2 $1 | while read line
do
  name=$(echo $line | cut -d',' -f1)
  image=$(echo $line | cut -d',' -f2)
  position=$(echo $line | cut -d',' -f3)
  facebook=$(echo $line | cut -d',' -f4)
  instagram=$(echo $line | cut -d',' -f5)
  whatsapp=$(echo $line | cut -d',' -f6)
  linkedin=$(echo $line | cut -d',' -f7)
  twitter=$(echo $line | cut -d',' -f8)
  telegram=$(echo $line | cut -d',' -f9)
  email=$(echo $line | cut -d',' -f10 | tr -d '\r')

  echo "  $name:"
  echo "    Position: $position"
  if [[ ! -z "$image" ]]; then
    echo "    Image: \"$image\""
  fi
  if [[ ! -z "$facebook" ]]; then
    echo "    Facebook: \"$facebook\""
  fi
  
  if [[ ! -z "$instagram" ]]; then
    echo "    Instagram: \"$instagram\""
  fi
  
  if [[ ! -z "$whatsapp" ]]; then
    echo "    Whatsapp: \"$whatsapp\""
  fi
  
  if [[ ! -z "$linkedin" ]]; then
    echo "    LinkedIn: \"$linkedin\""
  fi
  
  if [[ ! -z "$twitter" ]]; then
    echo "    Twitter: \"$twitter\""
  fi
  
  if [[ ! -z "$telegram" ]]; then
    echo "    Telegram: \"$telegram\""
  fi
  
  if [[ ! -z "$email" ]]; then
    echo "    Email: \"$email\""
  fi
done
