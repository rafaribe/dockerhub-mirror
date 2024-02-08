#!/bin/bash

# Fetch the tags for the repository
tags=$(crane ls alpine)

# Filter tags since Go 1.16 and exclude Windows tags using semver cli
filtered_tags=$(
  echo "$tags" |
    grep -E '^[0-9]+\.[0-9]+\.[0-9]+(-.*)?$' | \  # Updated regex to match semantic versioning format
  grep -Ev 'windowsservercore|nanoserver' | \     # Exclude Windows tags
  semver -r '>=1.16'
)

# Output the filtered tags
echo "$filtered_tags"
