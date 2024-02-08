#!/bin/bash

# Fetch the tags for busybox
tags=$(crane ls busybox)

# Filter the tags for versions greater than or equal to 3.15
filtered_tags=$(echo "$tags" | grep -E '^[0-9]+\.[0-9]+\.[0-9]+(-.*)?$' | while read -r tag; do
  if semver -r ">=1.32.0" "$tag" &>/dev/null; then
    echo "$tag"
  fi
done)

# Add glibc, musl, and uclibc suffixes to filtered tags
suffixes=("glibc" "musl" "uclibc")
for tag in $filtered_tags; do
  for suffix in "${suffixes[@]}"; do
    echo "${tag}-${suffix}"
  done
done

# Add original tags without suffixes
echo "$filtered_tags"

# Add "edge" and "latest" to filtered tags
echo "edge"
echo "latest"
