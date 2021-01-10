
#!/bin/bash
# imdb_processing

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
