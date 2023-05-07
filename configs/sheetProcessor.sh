#!/bin/bash

mkdir -p "./sheets"
if [ -e "./datasheets.txt" ]; then
    while IFS=, read -r docId sheetId; do
        sheetId=$(echo $sheetId | cut -d' ' -f1)
        wget --output-file="logs.csv" "https://docs.google.com/spreadsheets/d/$docId/export?format=csv&gid=$sheetId" -O "./sheets/$docId$sheetId.csv"
    done < "./datasheets.txt"
fi

## add blank line to the end of all files
for file in ./sheets/*
do
  echo "" >> "$file"
done


file=$(grep -l '^Name,' ./sheets/*)
echo $file
sed -i 's/"""/"/g' $file 
./teamGenerator.sh $file  > team.txt
# sed -n '/## Start Team:/ {p; r ../_config.yml'; :a; n; /## EOTeam/ {p; b}; ba}; p' team.txt > ../_config.yml
# sed -e '/^## Start Team:$/r ../_config.yml' -e '/^## Start Team:$/,/^## EOTeam$/d' team.txt > ../_config.yml
# sed -i '/## Start Team:/,/## EOTeam/c\ 
# ## Start Team:\ 
# $(cat team.txt)\ 
# ## EOTeam' ../_config.yml

awk 'NR==FNR{new = new $0 ORS; next} /## EOTeam/{f=0} !f{print} /## Start Team:/{printf "%s",new; f=1}' team.txt ../_config.yml > tmp
cat tmp > ../_config.yml
rm tmp
rm team.txt


# sed -n '/## Start Team:/ {p; r /path/to/otherfile'; :a; n; /## EOTeam/ {p; b}; ba}; p' inputfile > outputfile
file=$(grep -l '^Event,' ./sheets/*)
echo $file
sed -i 's/"""/"/g' $file 
./eventGenerator.sh $file  > events.txt
awk 'NR==FNR{new = new $0 ORS; next} /## EOEvents/{f=0} !f{print} /## Start Events:/{printf "%s",new; f=1}' events.txt ../_config.yml > tmp
cat tmp > ../_config.yml
rm tmp
rm events.txt

file=$(grep -l '^CalendarItem,' ./sheets/*)
echo "Calendar:$file"
sed -i 's/"""/"/g' $file 
./calendarGenerator.sh $file  > calendar.txt
awk 'NR==FNR{new = new $0 ORS; next} /\/\/## EOCalendar/{f=0} !f{print} /\/\/## Start Calendar:/{printf "%s",new; f=1}' calendar.txt ../assets/js/calendar.js > tmp
cat tmp > ../assets/js/calendar.js
rm tmp
rm calendar.txt

## Service
file=$(grep -l '^ServiceDay,' ./sheets/*)
echo "Service:$file"
sed -i 's/"""/"/g' $file 
./serviceGenerator.sh $file  > calendar.txt
sed -i 's/|;|/,/g' calendar.txt
awk 'NR==FNR{new = new $0 ORS; next} /## EOService/{f=0} !f{print} /## Start Service:/{printf "%s",new; f=1}' calendar.txt ../_config.yml > tmp
cat tmp > ../_config.yml
rm tmp
rm calendar.txt

# Church Contacts
file=$(grep -l '^ChurchContacts,' ./sheets/*)
echo "Contacts:$file"
sed -i 's/"""/"/g' $file 
./contactsGenerator.sh $file  > calendar.txt
sed -i 's/|;|/,/g' calendar.txt
awk 'NR==FNR{new = new $0 ORS; next} /## EOContacts/{f=0} !f{print} /## Start Contacts:/{printf "%s",new; f=1}' calendar.txt ../_config.yml > tmp
cat tmp > ../_config.yml
rm tmp
rm calendar.txt


# Verses
file=$(grep -l '^Verses,' ./sheets/*)
echo "Verses:$file"
sed -i 's/"""/"/g' $file 
./versesGenerator.sh $file  > calendar.txt
sed -i 's/|;|/,/g' calendar.txt
awk 'NR==FNR{new = new $0 ORS; next} /## EOVerses/{f=0} !f{print} /## Start Verses:/{printf "%s",new; f=1}' calendar.txt ../_config.yml > tmp
cat tmp > ../_config.yml
rm tmp
rm calendar.txt


# SiteConfig
file=$(grep -l '^Siteconfig,' ./sheets/*)
echo "SiteConfig:$file"
sed -i 's/"""/"/g' $file 
./siteConfigGenerator.sh $file  > calendar.txt
sed -i 's/|;|/,/g' calendar.txt
awk 'NR==FNR{new = new $0 ORS; next} /## EOSiteConfig/{f=0} !f{print} /## Start SiteConfig:/{printf "%s",new; f=1}' calendar.txt ../_config.yml > tmp
cat tmp > ../_config.yml
rm tmp
rm calendar.txt



