#!/bin/bash

# Fetch the tags for the repository
tags=$(crane ls golang)

# Define filters for each case
filter_latest='^latest$'
filter_semver='^[0-9]+\.[0-9]+(\.[0-9]+)?$'
filter_bookworm='^(1-)?bookworm$|^1\.[0-9]+-bookworm$'
filter_bullseye='^(1-)?bullseye$|^1\.[0-9]+-bullseye$'
filter_buster='^(1-)?buster$|^1\.[0-9]+-buster$'
filter_alpine='^(1-)?alpine$|^1\.[0-9]+-alpine$'

# Combine filters using grep with extended regular expressions
filtered_tags=$(echo "$tags" | grep -E "$filter_latest|$filter_semver|$filter_bookworm|$filter_bullseye|$filter_buster|$filter_alpine")

echo "$filtered_tags"
