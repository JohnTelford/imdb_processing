 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "TITLE_PRINCIPALS.sh"

# ln -s of IMDb datasets
source functions/link_files.sh

# command line parameters
function help() {
    cat <<EOF
    TITLE_PRINCIPALS.sh parameters

    ===========
    name.basics

    -h   | --help
    -pn  | --primary_name  [example: "first_name last_name"]
    -pp  | --primary_profession
    -lp  | --primary_profession_list
    -kft | --known_for_titles
    -by  | --birthYear
    -dy  | --deathYear
    
    ============
    title.basics
    -g   | --genres
    -lg  | --genres_list
    -tt  | --title_type
    -ltt | --title_type_list
EOF
}


#show_usage

# named arguments
#echo "named arguments"
