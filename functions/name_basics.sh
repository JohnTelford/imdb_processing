function name_basics.sh( )

{
    echo "name_basics.sh"
    # name_basics.sh 
    # output: name_basics.csv

    fxl_name="fxl_name.basics.csv"
    cache_name="name_basics_cache.csv"

# Cache file
cache_file=${imdb_dateset_cache}${cache_name}
echo $cache_file
if test -f $cache_file; then 
    echo "Cashe file exists" 
else
    echo "Creating name_basics_cache.csv" 
    touch ${imdb_dateset_cache}name_basics_cache.csv 
    xsv slice ${imdb_dataset_in_files}$fxl_name --start 0 --end 0 >> ${imdb_dateset_cache}name_basics_cache.csv 
fi


    #Construct xsv command stack


    echo $1  $2 
    primaryName="'^*$1$'"
    primaryProfession="'^*$2$'"

    # create xsv shell file

    echo "xsv select 1-6 ${imdb_dataset_in}$fxl_name \
    | xsv search --select 2 ${primaryName} \
    | xsv search --select 5 ${primaryProfession} \
    | xsv select 1-6  \
    | xsv slice  --no-headers  --start 1 " > ${imdb_dataset_out_files}name_basics.sh
    
    # Execute xsv command stack
    chmod +x ${imdb_dataset_out_files}name_basics.sh
    ${imdb_dataset_out_files}name_basics.sh > ${imdb_dataset_out_files}name_basics.csv

    # Check if attributes found
    if [[  -s  ${imdb_dataset_out_files}name_basics.csv ]] ; then
            # Attributes found
            echo "attributes"
        else
            # Attributes not found
            echo "no attributes"
            exit
    fi
    cat ${imdb_dataset_out_files}name_basics.csv

#  Process xsv command stack

# cache
echo "name_basics_cache"
# tmp cache
# 
xsv cat rows  ${imdb_dataset_out_files}name_basics.csv > ${imdb_dataset_out_files}name_basics_cache_temp.csv
# Create new name_basics.csv without duplicates.
sort -u ${imdb_dataset_out_files}name_basics_cache_temp.csv > ${imdb_dataset_out_files}name_basics.csv
}

