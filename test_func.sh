 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

source functions/arguments.sh
source functions/menues.sh

overview
media_type_lists