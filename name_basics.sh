#!/bin/bash

#echo "name_basics.sh"

# command line parameters
show_usage() {
    echo "name_basice.sh parameters:"
    echo "Note: parameters are case sensitive"

    echo "-by | --birthYear"
    echo "-dy | --deathYear"
    echo "-h  | --help"
    echo "-pn | --primaryName"
    echo "-pp | --primaryProfession"
    echo "-kft | --knownForTitles"
}

# named arguments
#echo "parameters"
while [ ! -z "$1" ]; do
    case "$1" in
    -by | --birthYear)
        shift
        birthYear=$1
        echo "--birthYear $birthYear"
        ;;
    -dy | --deathYear)
        shift
        deathYear=$1
        echo "--deathYear $deathYear"
        ;;
    -h | --help)
        shift
        show_usage
        exit
        ;;
    -pn | --primaryName)
        shift
        primaryName=$1
        echo "--primaryName $primaryName"
        ;;
    -pp | --primaryProfession)
        shift
        primaryProfession=$1
        echo "--primaryProfession $primaryProfession"
        ;;
    *)
        echo "parameter error"
        show_usage
        exit
        ;;
    esac
    shift
done

# datasets
imdb_dateset_cache="/Volumes/Dev/imdb/imdb_dataset_cache/"
imdb_dataset_in_files="/Volumes/Dev/imdb/imdb_dataset_files/"
imdb_dataset_out_files="/Volumes/Dev/imdb/imdb_processing_out/"

# Dataset
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

# title_principales_tconst.sh "nm0000078"
# title_basics_primary_title.sh "tt0075213"

# cache file

if test -f $cache_file; then
    echo "cashe_file $cache_name exists"
else
    echo "creating $cache_file"
    touch ${cache_file}
    # create cache_file header
    xsv slice --start 0 --end 0  ${fxl_file} > ${cache_file}
fi

# create xsv shell

primaryName="'^*$primaryName$'"
primaryProfession="'^*$primaryProfession$'"

# echo "xsv select 1-6 ${fxl_file} \
# | xsv search --select 2 ${primaryName} \
# | xsv search --select 5 ${primaryProfession} \
# | xsv select 1-6  \

#echo "shell_file - ${shell_file}"

# xsv select 1-50 dataset - to determine number of columns

echo "xsv select  1-13 ${fxl_file} \
| xsv search  ${primaryName} \
| xsv search ${primaryProfession} \
| xsv slice  --no-headers  --start 1 " >${shell_file}

# execute xsv shell

chmod +x ${shell_file}
${shell_file} >${csv_file}

cat ${csv_file}
# FIXME  remove exit to execute cache
#exit

# check if parameters found
if [[ ! -s ${csv_file} ]]; then
    # paraeters not found
    echo "1 or more parameters not found"
    exit
fi

# cache
#   remove _cache headers
#   -cache -> _cache_temp
xsv cat rows --no-headers  ${imdb_dateset_cache}name_basics_cache.csv > ${imdb_dateset_cache}name_basics_cache_temp.csv
#${csv_file}
#   cat csv_file rows -> _cache_temp
xsv cat rows --no-headers ${csv_file} >> ${imdb_dateset_cache}name_basics_cache_temp.csv


#   create new name_basics_cache.csv, with header and without duplicates
#   add headers to _cache
sort -u ${imdb_dateset_cache}name_basics_cache_temp.csv > ${imdb_dateset_cache}name_basics_cache.csv
#xsv slice --start 0 --end 0  ${fxl_file} > ${imdb_dateset_cache}name_basics_cache.csv

