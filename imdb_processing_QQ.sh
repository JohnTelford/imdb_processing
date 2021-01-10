#!/bin/bash
# imdb_processing

# This is a proof of concept using xsv to select nconst, primaryName, and primaryProfession from the name.basics dataset
# nconst will be used to select tconst from the title.principles dataset
# tconst will be used to select primaryTitle from title.basics, and data from the other tconst datasets.
# The datasets fxl prefix indicate they are fixed length and indexed
# xsv requires 'regex'. '$actor_name' does not work. printf is a workaround 
# I think this structure can be used for all datasets

actor( )
{

    fxl_name="fxl_name.basics.csv"
    imdb_dataset_files="/Volumes/Dev/imdb/imdb_dataset_files/"
    imdb_dataset="$imdb_dataset_files$fxl_name"

    actor_name="'^*$1$'"
    echo $actor_name
    printf "xsv select nconst,primaryName,primaryProfession $imdb_dataset \
    | xsv search --select 2 ${actor_name} \
    | xsv search --select 3 '^act.*$' \
    | xsv select 1,2,3 \
    | xsv slice  --no-headers --start 1\n" > xsv_actor

    # execute
    chmod +x xsv_actor
    time ./xsv_actor

    return
}

# run the function
actor_name="'^*John Wayne.*$'"
actor

