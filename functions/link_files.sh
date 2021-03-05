#!/usr/bin/env bash

# Create ln-s for each IMDb dataset to be used in shell scripts
# ln -s of IMDb datasets
# Invoke - `source functions/define_files.sh`

# TODO - Delete ln -s links

for file_name in name.basics title.akas title.basics title.episode title.principals title.ratings title.crew
    do
        FILE_NAME=$file_name
        # Replace . in filename with_
        FILE_NAME=$(gsed 's/\./\_/g' <<< $FILE_NAME)
    
        # Upper case
        FILE_NAME=$(gsed 's/.*/\U&/' <<< $FILE_NAME)
        
        # Create links
        if [ ! -f  $FILE_NAME ] ; then
            echo "ln -s ${file_name}.csv $FILE_NAME - link created"
            source_csv="$file_name.csv"
            ln -s /Volumes/Dev/imdb/imdb_dataset_files/${source_csv} $FILE_NAME
        fi
    done
