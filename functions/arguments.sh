 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "command line arguments"

# command line parameters
function help() {
    cat <<EOF
    imdb_dataset_processing.sh parameters

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
    -g | --genres)
        shift
        genres=$1
        #  FIXME check against list
        echo "--genera $genres"
        ;;
    -lg | --genres_list)
        shift

            printf "\n==========="
            printf "\n%s\n\n" "list genres"
            cat ./genres_title.basics.txt
            exit 0
        ;;
    -pn | --primary_name)
        shift
        primary_name=$1

            # title_case primary_name
            primary_name=$(gsed -e "s/\b./\u\0/g" <<< $primary_name)

        echo "--primary_name $primary_name"
        ;;
    -pp | --primary_profession)
        shift
        primary_profession=$1

            if  rg "${primary_profession}" attributes/primary_profession.name.basics.txt  ; then
                echo "${primary_profession} is a primary_profession"
            else
                echo "${primary_profession} is NOT a primary_profession"
                exit 1
            fi

        ;;
    -lp | --primary_profession_list)
        shift

            printf "\n======================="
            printf "\n%s\n\n" "list primary_profession"
            cat ./primary_profession.name.basics.txt
            exit 0

        ;;
    -tt | --title_type)
        shift
        title_type=$1
            echo $title_type

            if  rg "${title_type}" ./title_type_title.basics.txt  ; then
                echo "${title_type} is a title_type"
            else
                echo "${title_type} is NOT a title_type"
                exit 1
            fi

        echo "--title_type $title_type"
        ;;
    -ltt | --title_type_list)
        shift

            printf "\n==============="
            printf "\n%s\n\n" "list title_type"
            cat ./title_type_title.basics.txt
            exit 0
        ;;
    *)
        echo "parameter error"
            help
        exit 1
        ;;
    esac
    shift
done
