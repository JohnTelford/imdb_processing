#!/bin/bash
# imdb_processing

# This is a proof of concept using xsv to select nconst, primaryName, and primaryProfession from the name.basics dataset
# nconst is used to select tconst from the title.principles dataset
# tconst is used to select primaryTitle from title.basics, and data from tconst datasets.
# The datasets fxl prefix indicate the dataset files are fixed length and indexed
# xsv requires 'regex'. '$actor_name' does not work. echo is a workaround 
# I think this structure can be used for all datasets

#=====
# The actor function returns xsv_selected_actor.csv containing the actor nconst
#echo "DEBUG_actor_ncoonst"

actor_nconst( )
{
    echo "actor_nconst"
    # actor "<name>"
    # output xsv_selected_actor
    # returns nconst

    

    fxl_name="fxl_name.basics.csv"
    imdb_dataset_in_files="/Volumes/Dev/imdb/imdb_dataset_files/"
    imdb_dataset_out_files"/Volumes/Dev/imdb/imdb_processing_out/"
    imdb_dataset_in="$imdb_dataset_in_files$fxl_name"
    imdb_dataset_out="$imdb_dataset_out_files$fxl_name"

# Construct xsv command stack
actor_name="'^*$1$'"

actor_name="'^*$1$'"
    printf "xsv select nconst,primaryName,primaryProfession $imdb_dataset_in \
    | xsv search --select 2 ${actor_name} \
    | xsv search --select 3 '^act.*$' \
    | xsv select 1,2,3 \
    | xsv slice  --no-headers --start 1 \n" > ${imdb_dataset_out_files}xsv_actor_nconst.sh
    
    # Execute xsv command stack
    chmod +x ${imdb_dataset_out_files}xsv_actor_nconst.sh
    ./${imdb_dataset_out_files}xsv_actor_nconst.sh > ${imdb_dataset_out_files}xsv_selected_actor_nconst.csv
    #cat xsv_selected_actor_nconst.csv

    # Process xsv command stack
    selected_actor_nconst=$( wc -l ${imdb_dataset_out_files}xsv_selected_actor_nconst.csv | awk '{print $1}' )

    
    echo "Actor nconst count in  ${fxl_name}: ${selected_actor_nconst}"

    case $selected_actor_nconst in

        0)
            echo "Actor $1 is not in dataset fxl_name.basics.csv" 
            exit
            ;;

        *)
            echo "Actor $1 is in dataset $fxl_name"
            return
            ;;
    esac

 }


# # The actor function returns nconst
#actor_nconst "John Wayne"

# =====
#echo "DEBUG_actor_tconst"
# The tconst function is invoked with nconst from actor( )

actor_tcosnt( )
{
    echo "actor_tcosnt"
#     # tconst "<nconst>"
#     # output xsv_tconst_actor
#     # returns tconst

     fxl_name="fxl_title.principals.csv"
     imdb_dataset_files="/Volumes/Dev/imdb/imdb_dataset_files/"
     imdb_dataset="$imdb_dataset_files$fxl_name"

    # Construct xsv command stack
    echo "xsv select tconst,ordering,nconst,category,job,characters $imdb_dataset \
     | xsv search --select 3 '^*$1$'  \
    | xsv slice  --no-headers --start 1 " > xsv_actor_tconst.sh

    # Execute xsv command stack
    chmod +x xsv_actor_tconst.sh
    ./xsv_actor_tconst.sh > xsv_selected_actor_tconst.csv
    #cat xsv_selected_actor_tconst.csv

    # Process xsv command stack
    selected_actor_tconst=$( wc -l xsv_selected_actor_tconst.csv | awk '{print $1}' )
    echo "Actor tconst count in $fxl_name: $selected_actor_tconst"
    
    return
}

# # # tt1367024
# # # =====

 actor_title ( )
 {
     echo "actor_title"

    actor_tconst="'^*$1$'"
     fxl_name="fxl_title.basics.csv"
     imdb_dataset_files="/Volumes/Dev/imdb/imdb_dataset_files/"
     imdb_dataset="$imdb_dataset_files$fxl_name"

     xsv select tconst,titleType,primaryTitle, $imdb_dataset \
     | xsv search --select tconst 'tt0075213'
     #| xsv search --select 1 'tt0075213' 
     #| xsv search --select 4 '^act.*$'

     exit
 }


#echo "DEBUG_control"
#control
actor_nconst "Robert Downey" 
# actor_tcosnt "nm0000078"
# actor_title "tt0075213"

exit