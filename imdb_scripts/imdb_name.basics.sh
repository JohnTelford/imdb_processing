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
grep ",$profession," cache_name_basics.csv #> /dev/null
case $? in
    0)
        echo "$?"
        echo ${profission}
        echo "$search_name $profession - found in name.basics.csv"

        #birthYear=""
        #birthYear=xsv select 3 nameBasics_tmp_cache.csv 
        # gawk  'BEGIN {FS=","}{ printf $3 > "{${birthYear}}" }' nameBasics_tmp_cache.csv
        # echo $birth_year
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

# gawk accessing values of bash variables
# it works. required BEGIN
profession="${profession}"
search_name="${search_name}"

gawk -F,  \
     -v search_name="${search_name}" \
     -v profession="${profession} " \
     ' BEGIN {  print "BEGIN" }
            {
                # print search_name
                print $2
                print profession
                print $0 
                print $1
            }
        END { print "END"}' cache_name_basics.csv

        

# create  query name_basics cache -  primaryName_birthYean_primaryProfession_cache_name_basics.csv
gawk -F, \
    -v imdb_dateset_cache="${imdb_dateset_cache}" \
    '{
    { print $0 } 
    {  
        nconst = $1

        primaryName = $2
        sub(  / /, "_", primaryName )
        birthYear = $3
        primaryProfession = $5

        # print imdb_dateset_cache
        cache = imdb_dateset_cache
        # print cache

        file = cache "/" primaryName "_" birthYear "_" primaryProfession ".csv"
        print $0 > file
        # print `cache_name_basics.csv` record to file

        print nconst > cache "/" primaryName "_" birthYear "_" primaryProfession ".nconst"
    }
 '} cache_name_basics.csv


