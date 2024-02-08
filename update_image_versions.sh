#!/bin/bash

# Usage: ./update_image_versions.sh <image_file> <latest_version>

image_file="$1"
latest_version="$2"

# Check if arguments are provided
if [ -z "$image_file" ] || [ -z "$latest_version" ]; then
  echo "Usage: ./update_image_versions.sh <image_file> <latest_version>"
  exit 1
fi

# Check if the image file exists
if [ ! -f "$image_file" ]; then
  echo "Image file '$image_file' not found."
  exit 1
fi

# Extract the image name from the file name
image=$(basename "$image_file")

# Get newer versions than the latest version
new_versions=$(crane ls docker.io/"$image" | grep -E '^[0-9]+\.[0-9]+\.[0-9]+(-.*)?$' | sort -V | grep -A 1000 "$latest_version" | grep -v "$latest_version")

# If there are newer versions, update the file
if [ -n "$new_versions" ]; then
  echo "$new_versions" >>"$image_file"
  echo "Newer versions added to $image_file:"
  echo "$new_versions"
else
  echo "No newer versions found for $image."
fi
