#!/bin/bash

# Fetch the tags for the repository
tags=$(crane ls python)

# Define the regex pattern to match versions starting from 3.10 onwards with two digits and exclude "rc" tags
filter_above_310='3\.1[0-9]\..*|3\.[2-9][0-9]\..*'
exclude_rc='rc'

# Combine filters using grep with extended regular expressions
filtered_tags=$(echo "$tags" | grep -E "$filter_above_310" | grep -vE "$exclude_rc" | grep -v "windowsservercore")

if [ -z "$filtered_tags" ]; then
  echo "No matching tags found."
else
  echo "$filtered_tags"
fi
