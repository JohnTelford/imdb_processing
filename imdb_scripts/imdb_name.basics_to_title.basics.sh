#!/bin/bash
# imdb_name.basics_to_title.basics.sh
#   trial run for rg replacing xsv

# name.basics
echo "name.basics"

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
        echo "--profession $1"
        ;;
    *)
        echo "parameter error"
        show_usage
        exit
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
imdb_dateset_cache="/Volumes/Dev/imdb/imdb_dataset_cache/"
imdb_dataset_in_files="/Volumes/Dev/imdb/imdb_dataset_files/"
imdb_dataset_out_files="/Volumes/Dev/imdb/imdb_processing_out/"

# HACK  IMDb dataset files have been `ln -s` 
# ln -s fxl_name.basics.csv name.basics.csv
name_basics=name.basics.csv

imdb_dataset_in="$imdb_dataset_in_files$name_basics"
name_basics_in=${name_basics}
imdb_dataset_out="$imdb_dataset_out_files$name_basics"

cache_name="name.basics_cache.csv"
cache_file=${imdb_dateset_cache}$cache_name
cache_name_temp="name.basics_cache_temp.csv"
cache_file_temp=${imdb_dateset_cache}$cache_name_temp

csv_name="name.basics_csv"
csv_file=${imdb_dataset_out_files}$csv_name

shell_name="name.basics_shell.sh"
shell_file=${imdb_dataset_out_files}$shell_name

# search_name name.basics.csv 
 rg "$search_name,\d+" name.basics.csv > cache_nameBasics.csv
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
grep ",$profession," cache_nameBasics.csv #> /dev/null
case $? in
    0)
        echo "$?"
        echo ${profission}
        echo "$search_name $profession - found in name.basics.csv"

        #birthYear=""
        #birthYear=xsv select 3 nameBasics_tmp_cache.csv 
        # gawk  'BEGIN {FS=","}{ printf $3 > "{${birthYear}}" }' nameBasics_tmp_cache.csv
        # echo $birthYear
        # logfile="nameBasics_${fir st_name}_${last_name}_${birthYear}_${profession}.log"
        #xsv select 2,3,5 nameBasics_tmp_cache.csv | gawk '{ print gensub ( / /, "_", 1 ) }' | gawk '{ print gensub ( /,/, "_", "1" ) }' > log_file_tmp

        # touch log_file
        # xsv select 2,3,5  | gawk '{ printf gensub ( / /, ",", 1 )".csv"}' | gawk '{ print $1  > "Qlog.csv"}'  | gawk '{printf"" > $1}'  
        # # FIXME almost_there: Qlog contains name of John,Wayne,1907,actor. How to we log to it?
        # touch log_file.csv
        # cp "Qlog.csv"  log_file.csv
        # #echo $log_file.csv
        # cp nameBasics_tmp_cache.csv  log_file.csv

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

# create nameBasics primaryName_birthYean_primaryProfessionl_cache_nameBasics.csv
gawk -F, '
    { print $0 } 
    {  
        primaryName = $2
        sub(  / /, "_", primaryName )
        birthYear = $3
        primaryProfession = $5
        csv = "cache_nameBasics.csv"

        line = primaryName "_" birthYear "_" primaryProfession  "_" csv ; print line
        printf $0 > line
    }' cache_nameBasics.csv
exit 1