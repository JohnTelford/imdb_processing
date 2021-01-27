#!/bin/bash

#echo "title.basics_shell.sh"

# command line parameters
show_usage() {
    echo "title.basics_shell.sh parameters:"
    echo "Note: parameters are case sensitive"

    echo "-ad | --isAdult"
    echo "-ey | --endYear"
    echo "-ge | --genres"
    echo "-h  | --primaryTitle"
    echo "-nc | --originalTit;e"
    echo "-rt | --runtimeMunutes"
    echo "-sy | --startYear"
    echo "-tc | --tconst"
    echo "-tt | --titleType"
    echo "Syntax Rules"
}

# named arguments
#echo "parameters"
while [ ! -z "$1" ]; do
    case "$1" in
    -ad |  --isAdult)
        shift
        characters=$1
        echo "--isAdult $ad"
        ;;
    -ct | --category)
        shift
        category=$1
        echo "--category $category"
        ;;
    -ey | --endYear)
        shift

        show_usage
        exit
        ;;
    -nc | --nconst)
        shift
        nconst=$1
        echo "--nconst $nconst"
        ;;
    -or | --ordering)
        shift
        ordering=$1
        echo "--ordering $ordering"
        ;;
    -tc | --tconst)
        shift
        tconst=$1
        echo "--tconst $tconst"
        ;;
    *)
        echo "parameter error"
        show_usage
        exit
        ;;
    esac
    shift
done

# dataset
imdb_dateset_cache="/Volumes/Dev/imdb/imdb_dataset_cache/"
imdb_dataset_in_files="/Volumes/Dev/imdb/imdb_dataset_files/"
imdb_dataset_out_files="/Volumes/Dev/imdb/imdb_processing_out/"

fxl_name="fxl_title.basics.csv"

imdb_dataset_in="$imdb_dataset_in_files$fxl_name"
imdb_dataset_out="$imdb_dataset_out_files$fxl_name"

cache_name="title.basics_cache.csv"
cache_file=${imdb_dateset_cache}$cache_name
cache_name_temp="title.basics_cache_temp.csv"
cache_file_temp=${imdb_dateset_cache}$cache_name_temp

csv_name="title.basics_out.csv"
csv_file=${imdb_dataset_out_files}$csv_name

fxl_file=${imdb_dataset_in}

shell_name="title.basics_shell.sh"
shell_file=${imdb_dataset_out_files}$shell_name


# cache file
if [[  -s $cache_file ]]; then
    echo "cache_file $cache_file exists"
    cf=true
else
    echo "creating $cache_file"
    touch ${cache_file}
    cf=false
    # create cache_file header
    xsv slice --start 0 --end 0  ${fxl_file} > ${cache_file}
fi
#echo "${cache_file}"
# create xsv shell
tconst="'^*$tconst$'"
echo "$tconst"
#category="'^*$category$'"
#echo "$category"

cf=false
if $cf ; then
     echo "cf_true"
    # search cache_file. If not found search fxl_file
    echo "xsv select  1-33 ${cache_file} \
    | xsv search  ${tconst} \
    | xsv slice  --no-headers  --start 1 " > ${shell_file}
    # execute xsv shell
    chmod +x ${shell_file}
    ${shell_file} >${csv_file}

    #cache_file search failed
    if [[ ! -s ${csv_file} ]]; then
        cf=false
        echo "xsv select  1-33 ${cache_file} \
        | xsv search  ${tconst} \
        | xsv slice  --no-headers  --start 1 " > ${shell_file}
        # execute xsv shell
        chmod +x ${shell_file}
        ${shell_file} >${csv_file}
    fi
else
     echo "cf_false"
     #and_search="(?='${nconst}') (?='$category')" # (?=match ${category})'"
    echo "xsv select  1-33 ${imdb_dataset_in} \
    | xsv search ${tconst} \
    | xsv slice  --no-headers  --start 1 "  > ${shell_file}
    # execute xsv shell
    chmod +x ${shell_file}
    ${shell_file} > ${csv_file}
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
