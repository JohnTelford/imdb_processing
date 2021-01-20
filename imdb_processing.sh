#!/bin/bash
# imdb_processing
    # Parameters:
        # --primaryName=
        # --birthYear=
        # --deathYear=
        # --primaryProfession=


# This is a proof of concept using xsv to select nconst, primaryName, and primaryProfession from the name.basics dataset
# nconst is used to select tconst from the title.principles dataset
# tconst is used to select primaryTitle from title.basics, and data from tconst datasets.
# The datasets fxl prefix indicate the dataset files are fixed length and indexed
# xsv requires 'regex'. '$actor_name' does not work. echo is a workaround 
# I think this structure can be used for all datasets

#=====
function show_usage
{
    echo "Parameters are:"
    echo "--birthYear"
    echo "--deathYear"
    echo "--help"
    echo "--primaryName"
    echo "--primaryProfession"
    exit
}
# Process arguments
while [ ! -z "$1" ]; do
  case "$1" in
     --primaryName)
         shift
         primaryName=$1
         echo "You entered --primaryName $primaryName"
         ;;
     --birthYear)
         shift
         birthYear=$1
         echo "You entered --birthYear $birthYear"
         ;;
     --deathYear)
        shift
        deathYear=$1
        echo "You entered --deathYear $deathYear"
         ;;
    --primaryProfession)
            shift
            primaryProfession=$1
        echo "You entered --primaryProfession $primaryProfession"
         ;;
    -h|--help)
        shift
        show_usage
        exit
        ;;
     *)
    echo "Error"
        show_usage
        ;;
  esac
shift
done

exit

#echo "DEBUG_control"
#control

imdb_dataset_attributes="/Volumes/Dev/imdb/imdb_dataset_attributes/"
imdb_dateset_cache="/Volumes/Dev/imdb/imdb_dataset_cache/"
imdb_dataset_in_files="/Volumes/Dev/imdb/imdb_dataset_files/"
imdb_dataset_out_files="/Volumes/Dev/imdb/imdb_processing_out/"

imdb_dataset_in="$imdb_dataset_in_files$fxl_name"
imdb_dataset_out="$imdb_dataset_out_files$fxl_name"

# functions
source functions/name_basics.sh
source functions/title_principales_tconst.sh
source functions/title_basics_primary_title.sh

# select imdb datasetcd 
# name_basics.sh  "Maxi Mii" actor
#title_principales_tconst.sh "nm0000078"
#title_basics_primary_title.sh "tt0075213"

exit