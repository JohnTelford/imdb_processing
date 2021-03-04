 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "NAME_BASICS.sh"

# ln -s of IMDb datasets
source functions/link_files.sh

# command line parameters
function help() {
    cat <<EOF
    NAME_BASICS.sh parameters

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

#echo "named arguments"
nconst="nm0179163"

rg ${nconst} NAME_BASICS | \
# parse knownForTitles "tt*"
gawk -F, '{ 
    field = NF
    for ( c = field; c >= 1 ; c--) {
       if ($c ~ /^tt/)  print $c 
    }
}' tt
 rg -f tt TITLE_BASICS

