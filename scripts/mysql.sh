#!/bin/bash

# Fetch the tags for the repository
tags=$(crane ls mysql)

# Define filters for each case
filter_semver='^[0-9]+\.[0-9]+(\.[0-9]+)?$'
filter_innovation='^innovation$'
filter_latest='^latest$'
filter_oraclelinux8='^[0-9]+\.[0-9]+(\.[0-9]+)?-oraclelinux8$'
filter_oracle='^[0-9]+\.[0-9]+(\.[0-9]+)?-oracle$'
filter_debian='^[0-9]+\.[0-9]+(\.[0-9]+)?-(bullseye|debian)$'

# Combine filters using grep with extended regular expressions
filtered_tags=$(echo "$tags" | grep -E "$filter_semver|$filter_innovation|$filter_latest|$filter_oraclelinux8|$filter_oracle|$filter_debian")

echo "$filtered_tags"
