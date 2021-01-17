function name_basics_nconst.sh( )

{
    echo "name_basics_nconst.sh"
    # name_basics_nconst primaryName primaryProfession
    # output xsv_selected_attributes
    # returns nconst


    #Construct xsv command stack

    fxl_name="fxl_name.basics.csv"

    echo $1  $2 
    primaryName="'^*$1$'"
    primaryProfession="'^*$2$'"

    # create xsv shell file

    echo "xsv select 1-6 ${imdb_dataset_in}$fxl_name \
    | xsv search --select 2 ${primaryName} \
    | xsv search --select 5 ${primaryProfession} \
    | xsv select 1-6  \
    | xsv slice  --no-headers  --start 1 " > ${imdb_dataset_out_files}name_basics_nconst.sh
    
    # Execute xsv command stack
    chmod +x ${imdb_dataset_out_files}name_basics_nconst.sh
    ${imdb_dataset_out_files}name_basics_nconst.sh > ${imdb_dataset_out_files}name_basics_nconst.csv

    # Check if attributes found
    if [[  -s  ${imdb_dataset_out_files}name_basics_nconst.csv ]] ; then
            # Attributes found
            echo "attributes"
        else
            # Attributes not found
            echo "no attributes"
            exit
    fi
    cat ${imdb_dataset_out_files}name_basics_nconst.csv

#  Process xsv command stack

# cache
echo "name_basics_nconst_cache"
# tmp cache
# 
xsv cat rows  ${imdb_dataset_out_files}name_basics_nconst.csv > ${imdb_dataset_out_files}name_basics_nconst_cache_temp.csv
# Create new name_basics_nconst.csv without duplicates.
sort -u ${imdb_dataset_out_files}name_basics_nconst_cache_temp.csv > ${imdb_dataset_out_files}name_basics_nconst.csv
}

