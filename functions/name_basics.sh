name_basics.sh () {
    echo "name_basics.sh"

    # process

    # Cache file

    if test -f $cache_file; then 
        echo "Cashe file $cache_name exists" 
    else
        echo "Creating $cache_name" 
        touch ${cache_file} 
        xsv slice ${fxl_file} --start 0 --end 0 >> ${cache_file} 
    fi

    # Construct xsv command stack

primaryName="'^*$primaryName$'"
primaryProfession="'^*$primaryProfession$'"

#regex="(?=match $primaryName)"

    # create xsv shell file

    # echo "xsv select 1-6 ${fxl_file} \
    # | xsv search --select 2 ${primaryName} \
    # | xsv search --select 5 ${primaryProfession} \
    # | xsv select 1-6  \
    echo "${fxl_file}"
    echo "${shell_file}"

    echo "xsv select  1-13 ${fxl_file} \
        | xsv search  ${primaryName} \
        | xsv search ${primaryProfession} \
        | xsv slice  --no-headers  --start 1 " > ${shell_file}
   # | xsv search ${primaryName} \
    # | xsv search ${primaryProfession} \
    
   
    
    # execute xsv command stack
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

    # cache
    # tmp cache
    # 
    xsv cat rows  ${imdb_dataset_out_files}name_basics.csv > ${imdb_dateset_cache}name_basics_cache_temp.csv
    # Create new name_basics.csv without duplicates.
    sort -u ${imdb_dateset_cache}name_basics_cache_temp.csv > ${imdb_dateset_cache}name_basics_cache.csv
}

