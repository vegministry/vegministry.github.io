#!/bin/bash

## install
which jq || sudo apt install  jq
which youtube-dl || sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
which youtube-dl || sudo chmod a+rx /usr/local/bin/youtube-dl

## list of all videos
sermons=$(youtube-dl --ignore-errors --flat-playlist -j "https://www.youtube.com/channel/$1/videos" | jq -r ".id, .title")
# Loop through the lines of the input file
line_num=1
numEntries=0
output=$(
echo "sermonz:\\n"
while IFS= read -r line; do
  if [[ $((line_num % 2)) -eq 1 ]]; then
    # This is an odd-numbered line, so it contains the ID
    id="$line"
  else
    # This is an even-numbered line, so it contains the title
    title=$(echo "$line" |sed "s/\"/'/g")
    # Print the YAML for this video
    echo "  \"$id\": \"$title\"\\n"
    ((numEntries++))
  fi
  ((line_num++))
done <<< "$sermons"
)
echo $output|sed 's/\\n/\n/g' > output
awk 'NR==FNR{new = new $0 ORS; next} /## EOSermons/{f=0} !f{print} /## Start Sermons:/{printf "%s",new; f=1}' output ../_config.yml > tmp
cat tmp > ../_config.yml
rm tmp output

sed -i "s/numSermons: 100/numSermons: $numEntries/" ../_sermons/index.html
