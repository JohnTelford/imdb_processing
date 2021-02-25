# imdb_processing

function title_principales_tconst.sh( )
{
    echo "title_principales_tconst.sh"
#     # tconst "<nconst>"
#     # output xsv_tconst_actor
#     # returns tconst

     fxl_name="fxl_title.principals.csv"
     imdb_dataset_files="/Volumes/Dev/imdb/imdb_dataset_files/"
     imdb_dataset="$imdb_dataset_files$fxl_name"

    # Construct xsv command stack
    echo "xsv select tconst,ordering,nconst,category,job,characters ${imdb_dataset_in}$imdb_dataset \
     | xsv search --select 3 '^*$1$'  \
    | xsv slice  --no-headers --start 1 " > ${imdb_dataset_out_files}xsv_actor_tconst.sh

    # Execute xsv command stack
    chmod +x ${imdb_dataset_out_files}xsv_actor_tconst.sh
    ./xsv_actor_tconst.sh > ${imdb_dataset_out_files}xsv_selected_actor_tconst.csv
    #cat xsv_selected_actor_tconst.csv

    # Process xsv command stack
    selected_actor_tconst=$( wc -l ${imdb_dataset_out_files}xsv_selected_actor_tconst.csv | awk '{print $1}' )
    echo "title_principales_tconst.sh count in $fxl_name: $selected_actor_tconst"
    
    exit
}
