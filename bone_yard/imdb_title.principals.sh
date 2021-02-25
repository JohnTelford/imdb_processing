#!/bin/bash
echo "title_principales.sh"

# datasets
# HACK  IMDb dataset files have been `ln -s` to the indb_scripts directory


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

# list of title.principals.csv field numbers and names
xsv headers title.principals.csv | xsv table  > imdb_dataset_cache/title_principals/headers_title.principals.csv

# # create  query name_basics cache -  primaryName_birthYean_primaryProfession_cache_name_basics.csv
# gawk -F, \
#     -v imdb_dateset_cache="${imdb_dateset_cache}" \
#     '{
#         nconst = $1

#         primaryName = $2
#         sub(  / /, "_", primaryName )

#         birthYear = $3
#         primaryProfession = $5

#         cache_dir  = imdb_dateset_cache
#         csv_file = cache_dir "/" primaryName "_" birthYear "_" primaryProfession ".csv"
#         # print `cache_name_basics.csv` record to csv_file
#         print $0 > csv_file

#         print nconst > cache_dir "/" primaryName "_" birthYear "_" primaryProfession ".nconst"
#     '} cache_name_basics.csv

exit 0