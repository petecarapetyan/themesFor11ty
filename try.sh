#!/bin/bash

if [ $# -lt 3 ]; then
  echo 1>&2 "$0: Three args required, for example './try.sh myproject not-five38 [seed, swap, empty]'"
  exit 2
elif [ $# -gt 3 ]; then
  echo 1>&2 "$0: Too many arguments. Only 3 arguments are expected - folder, theme, [seed,empty]"
  exit 2
fi
mkdir ../$1 # makes a sibling 11ty project directory from your first arg
if [ $3 = "seed" ]; then
  cp -r ./base/* ../$1
  cp -R ./seed/* ../$1 # copies some Lorem Ipsum stuff into your project so you'll have data
  cp -r ./$2/_includes ../$1
  cp -r ./$2/css ../$1/static
  rm -rf ../$1/blog # seems this is all broken in more than one way, little value ATM 
elif [ $3 = "swap" ]; then
  echo "swap happened here"
elif [ $3 = "empty" ]; then
  cp -r ./base/* ../$1
  echo "$1 was not seeded with content, but the directories were  written/overwritten"
  # nothing done
else
  # this is lame too, but too lazy to make third argument optional above, ATM
  echo "Third argument has to be seed, or empty, but NOT: $3"
  exit 2
fi

  