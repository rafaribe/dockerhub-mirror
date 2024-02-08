#!/bin/bash

# Fetch the tags for debian
tags=$(crane ls debian)

# Filter the tags based on the specified regex pattern
filtered_tags=$(echo "$tags" | grep -E '^(bookworm(-[0-9]{8})?|12(\.[0-9]+)?|latest)$|^(bookworm(-[0-9]{8})?(-slim)?|12(\.[0-9]+)?(-slim)?|bullseye(-[0-9]{8})?(-slim)?|11(\.[0-9]+)?(-slim)?|buster(-[0-9]{8})?(-slim)?|10(\.[0-9]+)?(-slim)?|latest)$')

# Filter tags for versions 10, 11, and 12 with and without suffixes
extra_tags=$(echo "$tags" | grep -E '^(10|11|12)(\.[0-9]+)?(-slim)?$')

# Combine the filtered tags
filtered_tags+="$(echo "$extra_tags")"

# Output the filtered tags
echo "$filtered_tags"
