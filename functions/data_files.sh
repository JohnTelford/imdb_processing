#!/usr/bin/env bash

# Create ln-s for each IMDb dataset to be used in shell scripts
# ln -s of IMDb datasets
# Invoke - `source functions/define_files.sh`

NBASICS="/Volumes/Dev/imdb/imdb_dataset_files/name.basics.csv"
TBASICS="/Volumes/Dev/imdb/imdb_dataset_files/title.basics.csv"
TPRINCIPALS="/Volumes/Dev/imdb/imdb_dataset_files/title.principals.csv"

# `for file_name in name.basics title.akas title.basics title.episode title.principals title.ratings title.crew
#     do
#         source_csv="$file_name.csv"

#         echo "$file_name" | 
#         gawk -F. '{
#             pfx = substr ($1,1,1)
#             name = $2
#             printf "%s%s ", pfx , name 
#         }' | gsed 's/.*/\U&/' | cat > file
#         cat file
#        file[1]="/Volumes/Dev/imdb/imdb_dataset_files/${source_csv}"

# done
        # # Replace . in filename with_
        # FILE_NAME=$(gsed 's/\./\-/g' <<< $FILE_NAME)
        #         echo "${FILE_NAME}"

        # # Upper case
        # FILE_NAME=$(gsed 's/.*/\U&/' <<< $FILE_NAME)
        #     echo "${FILE_NAME}"
        # # Create links
        # #if [ ! -f  ${FILE_NAME} ] ; then
        #     source_csv="$file_name.csv"
        #     echo "${FILE_NAME}"
        #     ${FILE_NAME}="/Volumes/Dev/imdb/imdb_dataset_files/${source_csv}"
        #     echo "$FILE_NAME"
            #echo "${file_name}.csv ${FILE_NAME} - file variable created"
        #fi
    #done