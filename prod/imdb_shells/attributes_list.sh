 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "attributes_list.sh"

cat title_principals | gawk -F, '{print $4}' > ./prinary_title_attributes