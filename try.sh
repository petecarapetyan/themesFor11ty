#!/bin/bash
# This script is not maintained for public use, kinda lame hacking
# FOR EXPERIENCED SCRIPT USERS ONLY, use only after and accepting as your own

if [ $# -lt 4 ]; then
  echo 1>&2 "$0: Four args `./try.sh myproject not-five38 [seed,keep], [start,not]`"
  exit 2
elif [ $# -gt 4 ]; then
  echo 1>&2 "$0: Too many arguments. Only four arguments are expected - folder, theme, [seed,keep], [start,not]"
  exit 2
fi
mkdir ../$1 # makes a sibling rocket project directory from your first arg
mv ../$1/docs/ ../$1/docx
mkdir -p ../$1/docs/_assets/_static
if [ $3 = "seed" ]; then
  cp -R ./content-seed/docs/* ../$1/docs/ # copies some Lorem Ipsum stuff into your project so you'll have data
  rm -rf ../$1/docx
elif [ $3 = "keep" ]; then
  cp -R ../$1/docx/_assets/_static/* ../$1/docs/_assets/_static/
  rm -rf ../$1/docx/_*
  mv ../$1/docx/* ../$1/docs/
  rm -rf ../$1/docx
elif [ $3 = "empty" ]; then
  rm -rf ../$1/docx
else
  echo "Third argument has to be seed, keep, or empty, NOT: $3"
  exit 2
fi
cp -Rf ./community/* ../$1 # copies the 3 of the 5 basic starter files into your new rocket project
cp ./community/.eleventyignore ../$1 
cp ./community/.gitignore ../$1
cp -Rf ./$2/src/docs ../$1 # copies the theme named by your second argument, into your new project
cd ../$1 # changes directories to your new project
npm i
if [ $4 = "start" ]; then
  npm start
elif [ $4 = "not" ]; then
  echo "$1 was set up with $2 but not started"
else
  echo "Fourth argument has to be 'start', or 'not'"
  exit 2
fi
  