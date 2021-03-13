 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "IMDBD.sh"

# IMDb dataset variables
source functions/data_files.sh
source functions/arguments.sh

