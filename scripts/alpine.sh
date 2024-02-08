#!/bin/bash

# Fetch the tags for the repository
tags=$(crane ls alpine)

# Filter tags since Go 1.16 and exclude Windows tags using semver cli
# Filter the tags for versions greater than or equal to 3.15
filtered_tags=$(echo "$tags" | grep -E '^[0-9]+\.[0-9]+\.[0-9]+(-.*)?$' | while read -r tag; do
  if semver -r ">=1.32.0" "$tag" &>/dev/null; then
    echo "$tag"
  fi
done)

# Output the filtered tags
echo "$filtered_tags"
