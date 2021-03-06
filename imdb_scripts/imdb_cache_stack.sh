#! /bin/bash
echo "imdb_cache_stack.sh"

#   create imdb cache files:
#       name.basics_cache.csv
#       title.principals_cache.csv
#       title.basics_cache.csv

# imdb directories
imdba="/Volumes/Dev/imdb/imdb_dataset_attributes"
imdbc="/Volumes/Dev/imdb/imdb_dataset_cache"
imdbd="/Volumes/Dev/imdb/imdb_dataset_files"
imdbo="/Volumes/Dev/imdb/imdb_processing_out"
imdbp="/Volumes/Dev/imdb/imdb_processing"
imdbs="/Volumes/Dev/imdb/imdb_processing/imdb_scripts/"
# getopts
usage() {
    echo "Usage: $0  -H -F First_name -L Last_name -P profession " 1>&2
}

exit_abnormal () {
    usage
    exit 1
}

while getopts "HF:L:P:" options; do
    case "${options}" in
        H)
            usage
            exit
            ;;
        F)
            F_NAME=${OPTARG}
            # echo $F_NAME
            ;;
        L)
            L_NAME=${OPTARG}
            # echo $L_NAME
            ;;
        P)
            PROFESSION=${OPTARG}
            #echo $PROFESSION
            ;;
        *)
    esac
done


# name.basics_shell_extract nconst
full_name=$(printf "%s %s" $F_NAME $L_NAME)
touch nconst
grep "$full_name" ./name.basics_cache.csv | gawk -F, '/^nm/ { print $1 > "nconst"}' 

# title.principals_extract tconst
touch tconst
nconst=nm0000078
grep ${nconst} ./title.principals_cache.csv | grep "$PROFESSION" | gawk -F, '/^tt/ {print $1 > "tconst"}'

exit 1