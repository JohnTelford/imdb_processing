#!/bin/bash

echo "name_basics.sh"

show_usage() {
    echo "name_basice.sh parameters:"
    echo "-by | --birthYear"
    echo "-dy | --deathYear"
    echo "-h  | --help"
    echo "-pn | --primaryName"
    echo "-pp | --primaryProfession"
    echo "-kft | --knownForTitles"
}

# process named arguments
#echo "process named arguments"
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

# Datasets
imdb_dataset_attributes="/Volumes/Dev/imdb/imdb_dataset_attributes/"
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

# Cache file

if test -f $cache_file; then
    echo "cashe_file $cache_name exists"
else
    echo "Creating $cache_name"
    touch ${cache_file}
    #xsv slice ${fxl_file} --start 0 --end 0 >> ${cache_file}
fi

# Construct xsv command stack

primaryName="'^*$primaryName$'"
primaryProfession="'^*$primaryProfession$'"

# Create xsv shell file

# echo "xsv select 1-6 ${fxl_file} \
# | xsv search --select 2 ${primaryName} \
# | xsv search --select 5 ${primaryProfession} \
# | xsv select 1-6  \

echo "shell_file - ${shell_file}"

# xsv select 1-50 dataset - to determine number of columns

echo "xsv select  1-13 ${fxl_file} \
    | xsv search  ${primaryName} \
    | xsv search ${primaryProfession} \
    | xsv slice  --no-headers  --start 1 " >${shell_file}

# Execute xsv shell

chmod +x ${shell_file}
${shell_file} >${csv_file}

cat ${csv_file}
xsv count --no-headers ${csv_file}
echo $search_count
exit

# Check if attributes found
if [[ -s ${csv_file} ]]; then
    # Attributes found
    echo "attributes found"
    xsv cat rows ${csv_file} --output ${cache_file}
    exit
else
    # Attributes not found
    echo "attributes not found"
    exit
fi

#  Process xsv command stack

# Cache
# tmp cache
#
xsv cat rows ${imdb_dataset_out_files}name_basics.csv >${imdb_dateset_cache}name_basics_cache_temp.csv

# TODO   remove ..cache.csv header.before deduplicate
# Create new name_basics.csv without duplicates.
sort -u ${imdb_dateset_cache}name_basics_cache_temp.csv >${imdb_dateset_cache}name_basics_cache.csv
# TODO   add .cache.csv headeer after deduplication