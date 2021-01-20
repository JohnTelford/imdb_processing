function name_basics.sh( )

{
    echo "name_basics.sh"
    shell_name="name_basics.sh"
    csv_name="name_basics.csv"

    cache_name="name_basics_cache.csv"
    cache_file=${imdb_dateset_cache}$cache_name
    csv_file=${imdb_dataset_out_files}$csv_name
    fxl_name="fxl_name.basics.csv"
    fxl_file=${imdb_dataset_in}$fxl_name
    shell_file=${imdb_dataset_out_files}$shell_name

# Cache file

if test -f $cache_file; then 
    echo "Cashe file $cache_name exists" 
else
    echo "Creating $cache_name" 
    touch ${cache_file} 
    xsv slice ${fxl_file} --start 0 --end 0 >> ${cache_file} 
fi

    # Construct xsv command stack

    echo $1  $2 
    primaryName="'^*$1$'"
    primaryProfession="'^*$2$'"

    # create xsv shell file

    # echo "xsv select 1-6 ${fxl_file} \
    # | xsv search --select 2 ${primaryName} \
    # | xsv search --select 5 ${primaryProfession} \
    # | xsv select 1-6  \
        echo "xsv search ${primaryName} ${fxl_file} \
| xsv slice  --no-headers  --start 1 " > ${shell_file}
    
    # execute xsv command stack
    chmod +x ${shell_file}
    ${shell_file} >> ${csv_file}

cat ${csv_file}
exit
    # Check if attributes found
    if [[  -s  ${csv_file} ]] ; then
            # Attributes found
            echo "attributes found"
            xsv cat rows ${csv_file} --output ${cache_file}
            exit
        else
            # Attributes not found
            echo "attributes not found"
            exit
    fi


    exit

#  Process xsv command stack

# cache
echo "name_basics_cache"
# tmp cache
# 
xsv cat rows  ${imdb_dataset_out_files}name_basics.csv > ${imdb_dataset_out_files}name_basics_cache_temp.csv
# Create new name_basics.csv without duplicates.
sort -u ${imdb_dataset_out_files}name_basics_cache_temp.csv > ${imdb_dataset_out_files}name_basics.csv
}

