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

    echo "Syntax Rules"
    echo "primaryName - Title Case"
   echo "primaryProfession - actoress or actoress"
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

# dataset
imdb_dataset_in="$imdb_dataset_in_files$fxl_name"
imdb_dataset_out="$imdb_dataset_out_files$fxl_name"

cache_name="name_basics_cache.csv"
cache_file=${imdb_dateset_cache}$cache_name
cache_name_temp="name_basics_cache_temp.csv"
cache_file_temp=${imdb_dateset_cache}$cache_name_temp

csv_name="name_basics.csv"
csv_file=${imdb_dataset_out_files}$csv_name

fxl_name="fxl_name.basics.csv"
fxl_file=${imdb_dataset_in}$fxl_name

shell_name="name_basics.sh"
shell_file=${imdb_dataset_out_files}$shell_name


# cache file
if [[  -s $cache_file ]]; then
    echo "cashe_file $cache_file exists"
    cf=true
else
    echo "creating $cache_file"
    touch ${cache_file}
    cf=false
    # create cache_file header
    xsv slice --start 0 --end 0  ${fxl_file} > ${cache_file}
fi

# create xsv shell
primaryName="'^*$primaryName$'"
primaryProfession="'^*$primaryProfession$'"

if $cf ; then

    echo "cf_true"
    # search cache_file. If not found search fxl_file
    echo "xsv select  1-13 ${cache_file} \
    | xsv search  ${primaryName} \
    | xsv search ${primaryProfession} \
    | xsv slice  --no-headers  --start 1 " >${shell_file}
    # execute xsv shell
    chmod +x ${shell_file}
    ${shell_file} >${csv_file}

    # cache_file search failed
    if [[ ! -s ${csv_file} ]]; then
        cf=false
        echo "xsv select  1-13 ${fxl_file} \
        | xsv search  ${primaryName} \
        | xsv search ${primaryProfession} \
        | xsv slice  --no-headers  --start 1 " >${shell_file}
        # execute xsv shell
        chmod +x ${shell_file}
        ${shell_file} >${csv_file}
    fi

else

    echo "cf_false"
    echo "xsv select  1-13 ${fxl_file} \
    | xsv search  ${primaryName} \
    | xsv search ${primaryProfession} \
    | xsv slice  --no-headers  --start 1 " >${shell_file}
    # execute xsv shell
    chmod +x ${shell_file}
    ${shell_file} >${csv_file}
fi

#cat ${csv_file}
# FIXME  remove exit to execute cache
#exit

# check if parameters found
if [[ ! -s ${csv_file} ]]; then
    # paraeters not found
    echo "1 or more parameters not found"
    exit
fi

if $cf ; then
    # bypass cacheprocessing
    exit
fi

# cache
# copy cache_file to _cache_file_temp
cp ${cache_file}  ${cache_file_temp}
echo "1-cache_file"
cat ${cache_file}

#   cat csv_file >> _cache_temp
xsv cat rows   ${csv_file} >> ${cache_file_temp}
echo "2-cache_file_temp"
cat ${cache_file_temp}

#   create new _cache.csv without duplicates 
# FIXME remove cache_file_temp headers. After sort -u add cache_file headers. This will insure the header is there and not tet sorted. This will help with other IMDb datasets
echo "3-cache_file_temp"
cat ${cache_file_temp}

sort -u ${cache_file_temp} > ${cache_file}
echo "3-cache_file" 
cat ${cache_file}
