#!/bin/bash
echo "title_principales.sh"



echo $first_name
echo $last_name
echo $profession

search_name="${first_name} ${last_name}"
echo "$search_name"

# datasets
# HACK  IMDb dataset files have been `ln -s` 
# ln -s name.basics.csv name.basics.csv

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
xsv headers title.principals.csv | xsv table  > imdb_dataset_cache/title_principals/headers_title.principals.csv

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