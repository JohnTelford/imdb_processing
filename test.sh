 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "NAME-BASICS.sh"

# ln -s of IMDb datasets
source functions/data_files.sh
source functions/arguments.sh
