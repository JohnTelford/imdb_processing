 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "unset.sh"

unset -v title_ratings
unset -v title_akas
unset -v name_basics
unset -v title_crew
unset -v title_episode
unset-v  title_principals
unset -v title_ratings

export
