#!/bin/sh

# generating compose file
if [ -f assets/XCompose ]
then
  echo "Using existing XCompose file"
else
  echo "Generating new XCompose file"
  python3 src/generate_compose.py assets/XCompose
fi

# storing compose file
cp assets/XCompose ~/.XCompose
