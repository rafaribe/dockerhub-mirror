#!/bin/bash

# Fetch the tags for the repository
tags=$(crane ls node)

# Define filters for each case
filter_semver='^(1[2-9]|[2-9][0-9]+)(\.[0-9]+){0,2}$'
filter_bookworm='^(1[2-9]|[2-9][0-9]+)(\.[0-9]+){0,2}-bookworm$'
filter_current='^current(-.*)?$'
filter_latest='^latest$'
filter_slim='^(1[2-9]|[2-9][0-9]+)(\.[0-9]+){0,2}-(bookworm|bullseye|buster)-slim$'
filter_others='^(1[2-9]|[2-9][0-9]+)(\.[0-9]+){0,2}-(alpine|alpine3.18|alpine3.19|bullseye|buster)$'

# Combine filters using grep with extended regular expressions
filtered_tags=$(echo "$tags" | grep -E "$filter_semver|$filter_bookworm|$filter_current|$filter_latest|$filter_slim|$filter_others")

echo "$filtered_tags"
