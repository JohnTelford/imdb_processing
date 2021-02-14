#!/bin/bash
# imdb_name.basics.sh
echo "imdb_name.basics.sh"


# command line parameters
show_usage() {
    echo "name_basice.sh parameters:"
    echo "Note: parameters are case sensitive"

    echo "-h   | --help"
    echo "-fn  | --firstName"
    echo "-ln  | --lastName"
    echo "-p   | --Profession"
    echo "-kft | --knownForTitles"
    echo "-by  | --birthYear"
    echo "-dy  | --deathYear"

    # echo "Syntax Rules"
    # echo "primaryName - Title Case"
    # echo "primaryProfession - actoress or actoress"
}

# named arguments
#echo "named arguments"
while [ ! -z "$1" ]; do
    case "$1" in
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

echo $first_name
echo $last_name
echo $profession

search_name="${first_name} ${last_name}"
echo "$search_name"

# datasets
# HACK  IMDb dataset files have been `ln -s` 
# ln -s name.basics.csv name.basics.csv
imdb_dateset_cache="/Volumes/Dev/imdb/imdb_dataset_cache/name_basics"
imdb_dataset_out_files="/Volumes/Dev/imdb/imdb_processing_out/"

name_basics=name.basics.csv

imdb_dataset_in="$imdb_dataset_in_files$name_basics"
imdb_dataset_out="$imdb_dataset_out_files$name_basics"

cache_name="cache_name_basics.csv"
cache_file=${imdb_dateset_cache}$cache_name
cache_name_temp="name.basics_cache_temp.csv"
cache_file_temp=${imdb_dateset_cache}$cache_name_temp

csv_name="name.basics_csv"
csv_file=${imdb_dataset_out_files}$csv_name

shell_name="name.basics_shell.sh"
shell_file=${imdb_dataset_out_files}$shell_name

# search_name name.basics.csv 
 rg "$search_name,\d+," name.basics.csv > cache_name_basics.csv
case $? in
    0) 
        echo "$?"
        echo "$search_name - found in name.basics.csv dataset search"
        ;;
   1) 
        echo "$?"
        echo "$search_name - not found in name.basics.csv dataset search faild"1
        exit 1
        ;;
    *) 
        shift
         ;;
esac

# search cache for profession  
grep ",$profession," cache_name_basics.csv
case $? in
    0)
        echo "$?"
        echo ${profission}
        echo "$search_name $profession - found in name.basics.csv"
        ;;
    1) 
        echo "$?"
        echo "$search_name $profession - not found in name.basics.csv"
        exit 1
        ;;
    *) 
        shift
        ;;
esac 

# list of name.basics.csv field numbers and names
xsv headers name.basics.csv | xsv table  > "${imdb_dateset_cache}/headers_name.basics.csv"

# create  query name_basics cache -  primaryName_birthYean_primaryProfession_cache_name_basics.csv
gawk -F, \
    -v imdb_dateset_cache="${imdb_dateset_cache}" \
    '{
        nconst = $1

        primaryName = $2
        sub(  / /, "_", primaryName )
        birthYear = $3
        primaryProfession = $5

        cache_dir  = imdb_dateset_cache
        csv_file = cache_dir "/" primaryName "_" birthYear "_" primaryProfession ".csv"
        # print `cache_name_basics.csv` record to csv_file
        print $0 > csv_file

        print nconst > cache_dir "/" primaryName "_" birthYear "_" primaryProfession ".nconst"
    '} cache_name_basics.csv

exit 0