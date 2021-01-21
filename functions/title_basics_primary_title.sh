 function title_basics_primary_title.sh ( )
 {
     echo "title_basics_primary_title.sh"

    name_basics_nconst="'^*$1$'"

     fxl_name="fxl_title.basics.csv"
     imdb_dataset_files="/Volumes/Dev/imdb/imdb_dataset_files/"
     imdb_dataset="$imdb_dataset_files$fxl_name"

     xsv select tconst,titleType,primaryTitle,${imdb_dataset_in}$imdb_dataset \
     | xsv search --select tconst '^tt0075213$'
    #| xsv search --select 1 'tt0075213' 
     #| xsv search --select 4 '^act.*$'

     exit
 }
