 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "start.sh"

# ln -s of IMDb datasets
source functions/data_files.sh
source functions/arguments.sh
source functions/media_types.sh

media_type_list
