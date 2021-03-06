 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "NAME_BASICS.sh"

# ln -s of IMDb datasets
source ../functions/link_files.sh
source ../functions/arguments.sh

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

# return - nconst
# required parameters - primaryName, primaryProfession

# check cache
# ./imdb_dataset_cache/name_basics

# replace space with _
# primary_name=$(sed 's/ /_/' <<< $primary_name)

# # .csv file
# pn_csv=./imdb_dataset_cache/name_basics/csv_${primary_name}_name.basics
# echo $pn_csv
# # FIXME
# if  [ -s $pn_csv ]; then
#     echo "${pn_csv} exists and not empty"
# else
#      echo "${pn_csv} doesn't exist or is empty"
# fi

# #cat ${pn_csv}

# # nconst
# pn_nconst=./imdb_dataset_cache/name_basics/nconst_${primary_name}_name.basics
# FILE=$pn_nconst
# if [ -s ${pn_nconst} ]; then
#     echo "${pn_nconst} exists and not empty"
# else
#      echo "${pn_nconst} doesn't exist or is empty"
# fi

rg "John Wayne,1907" $NAME_BASICS | gawk -F, '$0 ~ /actor/ ' 

# exit 1


# #show_usage

#echo "named arguments"
# nconst="nm0179163"

# rg ${nconst} NAME_BASICS | \
# # parse knownForTitles "tt*"
# gawk -F, '{ 
#     field = NF
#     for ( f = field; f >= 1 ; f--) {
#        if ($f ~ /^tt/)  print $f 
#     }
# }' > tt.csv
#   rg -f tt.csv TITLE_BASICS | gawk -F, '{ printf "%s,%s,%s,%s,%s\n", $1,$2, $3, $6, $9}' | xsv table

#  rg -f tt.csv TITLE_PRINCIPALS | sed 's/\[// ; s/\]// ; s/\\N// ; s/\\N$//'
 #gawk -F, '{ gsub (/"\"["/, "" ,$6) }' #(printf "%s,%s,%s,%s\n",   $2, $3, $4, $6}' | xsv table

