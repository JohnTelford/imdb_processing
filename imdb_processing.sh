#!/bin/bash

# This is a proof of concept using xsv to select nconst, primaryName, and primaryProfession from the name.basics dataset
# nconst is used to select tconst from the title.principles dataset
# tconst is used to select primaryTitle from title.basics, and data from tconst datasets.
# The datasets fxl prefix indicate the dataset files are fixed length and indexed
# xsv requires 'regex'. '$actor_name' does not work. echo is a workaround 
# I think this structure can be used for all datasets
#=====


# process named arguments
echo "process named arguments"
while [ ! -z "$1" ]; do
    case "$1" in
        -by | --birthYear)
            shift
            birthYear=$1
            echo "You entered --birthYear $birthYear"
            ;;
        -dy | --deathYear)
            shift
            deathYear=$1
            echo "You entered --deathYear $deathYear"
            ;;
        -h | --help)
            shift
                echo "Parameters are:"
                echo "-by | --birthYear"
                echo "-dy | --deathYear"
                echo "-h  | --help"
                echo "-pn | --primaryName"
                echo "-pp | --primaryProfession"
            exit
            ;;

        -pn | --primaryName)
            shift
            primaryName=$1
            echo "You entered --primaryName $primaryName"
            ;;
        -pp | --primaryProfession)
            shift
            primaryProfession=$1
            echo "You entered --primaryProfession $primaryProfession"
            ;;
        *)
            echo "Error"
            show_usage
            ;;
    esac
    shift
done

imdb_dataset_attributes="/Volumes/Dev/imdb/imdb_dataset_attributes/"
imdb_dateset_cache="/Volumes/Dev/imdb/imdb_dataset_cache/"
imdb_dataset_in_files="/Volumes/Dev/imdb/imdb_dataset_files/"
imdb_dataset_out_files="/Volumes/Dev/imdb/imdb_processing_out/"

imdb_dataset_in="$imdb_dataset_in_files$fxl_name"
imdb_dataset_out="$imdb_dataset_out_files$fxl_name"

cache_name="name_basics_cache.csv"
cache_file=${imdb_dateset_cache}$cache_name

csv_name="name_basics.csv"
csv_file=${imdb_dataset_out_files}$csv_name

fxl_name="fxl_name.basics.csv"
fxl_file=${imdb_dataset_in}$fxl_name

shell_name="name_basics.sh"
shell_file=${imdb_dataset_out_files}$shell_name


# functions

 #source functions/name_basics_param.sh
source functions/name_basics.sh
#source functions/title_principales_tconst.sh
#source functions/title_basics_primary_title.sh


# select imdb datasetcd 
name_basics.sh -pn "John Wayne"
# title_principales_tconst.sh "nm0000078"
# title_basics_primary_title.sh "tt0075213"

exit