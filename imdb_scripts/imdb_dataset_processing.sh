#!/bin/bash

echo "imdb_dataset_processing"

# command line parameters
show_usage() {
    echo "imdb_dataset_processing.sh parameters:"
    echo "Note: parameters are case sensitive"

    printf "\n===========\n%s\n" name.basics
    echo "-h   | --help"
    echo "-fn  | --firstName"
    echo "-ln  | --lastName"
    echo "-p   | --Profession"
    echo "-kft | --knownForTitles"
    echo "-by  | --birthYear"
    echo "-dy  | --deathYear"

    printf "\n================\n%s\n" title.principals
    echo "-cat | --category"
    echo "-j   | --job"

    
}
show_usage


# named arguments
#echo "named arguments"
while [ ! -z "$1" ]; do
    case "$1" in

# name.basics    
    -by | --birthYear)
        shift
        birthYear=$1
        echo "--birthYear $birth_year"
        ;;
    -dy | --deathYear)
        shift
        deathYear=$1
        echo "--deathYear $death_year"
        ;;
    -h | --help)
        shift
        show_usage
        exit
        ;;
    -fn | --firstName)
        shift
        first_name=$1
        echo "--firstName $first_name"
        ;;
    -ln | --lastName)
        shift
        last_name=$1
        echo "--lastName $last_name"
        ;;
    -p | --profession)
        shift
        profession=$1
        echo "--profession $profession"
        ;;

    *)
        echo "parameter error"
        show_usage
        exit 1
        ;;
    esac
    shift
done

# echo $job
# echo $last_name
# echo $category

# search_name="${first_name} ${last_name}"
# echo "$search_name"


exit 1
# imdb_name.basics.sh

./imdb_name.basics.sh -fn John -ln Wayne -p actor