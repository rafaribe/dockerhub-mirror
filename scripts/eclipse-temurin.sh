#!/bin/bash

# Fetch the tags for the repository
tags=$(crane ls eclipse-temurin)

# Define filters for each case
filter_semver='^(1[2-9]|[2-9][0-9]+)(\.[0-9]+){0,2}$'
filter_openj9='^.*-openj9(-.*)?$'
filter_hotspot='^.*-hotspot(-.*)?$'
filter_alpine='^.*-alpine(-.*)?$'

# Combine filters using grep with extended regular expressions
filtered_tags=$(echo "$tags" | grep -E "$filter_semver|$filter_openj9|$filter_hotspot|$filter_alpine")

echo "$filtered_tags"
