#!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "imdb_dataset_processing"

# command line parameters
function help() {
    cat <<EOF
    imdb_dataset_processing.sh parameters

    ===========
    name.basics

    -h   | --help
    -p   | --profession
    -pn  | --primary_name  ["first_name last_name"]
    -lp  | --profession_list
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
while [ ! -z "$1" ]; do
    case "$1" in
    -by | --birth_year)
        shift
        birth_year=$1
        echo "--birthYear $birth_year"
        ;;
    -dy | --death_year)
        shift
        death_year=$1
        echo "--deathYear $death_year"
        ;;
    -h | --help)
        shift
        help
        exit
        ;;
    -fn | --firstName)
        shift
        first_name=$1
        echo "--firstName $first_name"
        ;;
    -g | --genres)
        shift
        genres=$1
        echo "--genera $genres"
        ;;
    -lg | --genres_list)
        printf "\n==========="
        printf "\n%s\n\n" "list genres"
        cat attributes/genres_title.basics.txt
        shift
        ;;
    -p | --profession)
        shift
        profession=$1
        echo "--profession $profession"
        ;;
    -pn | --primary_name)
        shift
        primary_name=$1
        # title case primary_name
        primary_name=$(gsed -e "s/\b./\u\0/g" <<< $primary_name)

        echo "--primary_name $primary_name"
        ;;
    -lp | --profession_list)
        printf "\n==============="
        printf "\n%s\n\n" "list profession"
        cat attributes/primary_profession.name.basics.txt
        shift
        ;;
    -tt | --title_type)
        shift
        title_type=$1
        echo "--title_type $title_type"
        ;;

    -ltt | --title_type_kist)
        printf "\n==============="
        printf "\n%s\n\n" "list title_type"
        cat attributes/title_type_title.basics.txt
        shift
        ;;
    *)
        echo "parameter error"
        show_usage
        exit 1
        ;;
    esac
    shift
done

# return - nconst
# required parameters - primaryName, primaryProfession

# check cache
# ./imdb_dataset_cache/name_basics

# replace space with _
primary_name=$(sed 's/ /_/' <<< $primary_name)

# .csv file
pn_csv=./imdb_dataset_cache/name_basics/${primary_name}*.csv
FILE=$pn_csv
if [ -s ${pn_csv} ]; then
    echo "${pn_csv} exists and not empty"
else
     echo "${pn_csv} doesn't exist or is empty"
fi
cat ${pn_csv}

# nconst
pn_nconst=./imdb_dataset_cache/name_basics/${primary_name}*.nconst
FILE=$pn_nconst
if [ -s ${pn_nconst} ]; then
    echo "${pn_nconst} exists and not empty"
else
     echo "${pn_nconst} doesn't exist or is empty"
fi
cat ${pn_nconst}



exit 1
