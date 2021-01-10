#!/bin/bash
# datasets_summary.sh

# Date
date > datasets_summary.txt

# IMDb Datasets
# https://www.imdb.com/interfaces/

# Datasets
dataset_files_directory="/Volumes/Dev/imdb/imdb_dataset_files/"

# Directory
printf "\nDataset Files\n------------------\n" >> datasets_summary.txt
printf "${dataset_files_directory}\n\n" >> datasets_summary.txt

ls $dataset_files_directory >> datasets_summary.txt

# Stats
# Collect headers_*.csv file names
headers_datasets+=("$(ls ${dataset_files_directory}hdrs* )")

for file_name in $headers_datasets
    do
        header_file_name=("$(ls $file_name  | xargs -n1 basename)")
        printf "\n$header_file_name\n" >> datasets_summary.txt
        cat $file_name | gawk 'NF > 1' >>  datasets_summary.txt

    done


