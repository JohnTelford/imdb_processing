name_basics.sh () {
    echo "name_basics.sh"

    # process

    # Cache file

    if test -f $cache_file; then 
        echo "Cashe file $cache_name exists" 
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

    echo "${shell_file}"

# xsv select 1-50 dataset - to determine number of columns

    echo "xsv select  1-50 ${fxl_file} \
    | xsv search  ${primaryName} \
    | xsv search ${primaryProfession} \
    | xsv slice  --no-headers  --start 1 " > ${shell_file}
    
    # Execute xsv shell

    chmod +x ${shell_file}
    ${shell_file} > ${csv_file}

    cat ${csv_file}
    xsv count --no-headers ${csv_file} 
    echo $search_count
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

    #  Process xsv command stack

    # Cache
    # tmp cache
    # 
    xsv cat rows  ${imdb_dataset_out_files}name_basics.csv > ${imdb_dateset_cache}name_basics_cache_temp.csv

    # TODO   remove ..cache.csv header.before deduplicate 
   # Create new name_basics.csv without duplicates.
    sort -u ${imdb_dateset_cache}name_basics_cache_temp.csv > ${imdb_dateset_cache}name_basics_cache.csv
     # TODO   add .cache.csv headeer after deduplication

}

