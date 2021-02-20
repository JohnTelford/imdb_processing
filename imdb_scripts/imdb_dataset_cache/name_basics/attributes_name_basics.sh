#!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "attributes_name_basics.sh"

# headers
xsv headers ../../name.basics.csv > csv_headers_name.basics

# csv_John_Wayne
gawk ' '
