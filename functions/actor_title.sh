 #!/bin/bash

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
