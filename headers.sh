 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "headers.sh"

xsv headers name_basics > headers/name_basics_header
xsv headers title_akas > headers/title_akas_header
xsv headers title_basics > headers/title_basics_header
xsv headers title_crew > headers/title_crew_header
xsv headers title_episodes > headers/title_episodes_header
xsv headers title_principals > headers/title_principals_header
xsv headers title_ratings > headers/title_ratings_header


