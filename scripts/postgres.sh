#!/bin/bash

# Fetch the tags for the repository
tags=$(crane ls postgres)

# Define filters for each case
filter_semver='^(1[3-9]|[2-9][0-9]+)(\.[0-9]+){0,2}$'
filter_bookworm='^(1[3-9]|[2-9][0-9]+)(\.[0-9]+){0,2}-bookworm$'
filter_bullseye='^(1[3-9]|[2-9][0-9]+)(\.[0-9]+){0,2}-bullseye$'
filter_alpine='^(1[3-9]|[2-9][0-9]+)(\.[0-9]+){0,2}-alpine'

# Combine filters using grep with extended regular expressions
filtered_tags=$(echo "$tags" | grep -E "$filter_semver|$filter_bookworm|$filter_bullseye|$filter_alpine")

echo "$filtered_tags"
