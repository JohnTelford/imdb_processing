# imdb_processing

#=====
# The actor function returns xsv_selected_actor.csv containing the actor nconst

function name_basics_nconst.sh( )

{
    echo "name_basics_nconst.sh"
    # name_basics_nconst primaryName primaryProfession
    # output xsv_selected_actor
    # returns nconst


    #Construct xsv command stack

    fxl_name="fxl_name.basics.csv"

    primaryName="'^*$1$'"
    primaryProfession="'^*$2$'"
    
    echo $1  $2

    # test


    # create xsv shell file

    echo "xsv select 1-6 ${imdb_dataset_in}$fxl_name\
    | xsv search --select 2 ${primaryName}\
    | xsv search --select 5 ${primaryProfession}\
    | xsv select 1-6  "  > ${imdb_dataset_out_files}name_basics_nconst.sh

    # | xsv slice  --no-headers --start 1 \n" > ${imdb_dataset_out_files}name_basics_nconst.sh
    
    # Execute xsv command stack
    chmod +x ${imdb_dataset_out_files}name_basics_nconst.sh
    ${imdb_dataset_out_files}name_basics_nconst.sh > ${imdb_dataset_out_files}name_basics_nconst.csv
    #cat ${imdb_dataset_out_files}name_basics_nconst.csv

    # # Process xsv command stack
    #xsv_selected_actor_nconst=$( wc -l ${imdb_dataset_out_files}name_basics_nconst.csv | awk '{print $1}' )

    
    # echo "$1 $2 name_basics_nconst.sh in ${fxl_name}: ${name_basics_nconst}"

    # case $selected_actor_nconst in

    #     0)
    #         echo "$1 $2 is not in dataset fxl_name.basics.csv" 
    #         exit
    #         ;;

    #     *)
    #         echo "$1 $2 is in dataset $fxl_name"
    #         ;;
    # esac

# cache
echo "name_basics_nconst_cache"
cat ${imdb_dataset_out_files}name_basics_nconst.csv >> ${imdb_dataset_out_files}name_basics_nconst_cache.csv
sort -u ${imdb_dataset_out_files}name_basics_nconst_cache.csv
}

