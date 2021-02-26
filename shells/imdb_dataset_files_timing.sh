#!/bin/bash
# imdb_timing_test

# -----
imdb_dataset_files_timing=/Volumes/Dev/imdb/imdb_dataset_files_timing

cd $imdb_dataset_files_timing

# Testing file
file_name_test=title.basics

# Delete files
/bin/rm -f *$file_name_test*
# -----

# -----
# File names
    source_gz="$file_name_test.tsv.gz"
    source_tsv="$file_name_test.tsv"
    source_csv="$file_name_test.csv"
    source2_csv="${file_name_test}2.csv"

# Process file prefix
    fxl="fxl_"         # fixlengths
    noidx="noindex_"   # no index
    # index does not need prefes since it produces a .idx file

# -----
# Download ${source_gz}
    printf "Downloading $source_gz\n"
        curl_source="https://datasets.imdbws.com/$source_gz"
        time curl -O $curl_source
    
    printf "\nunzipping ${source_gz} -> ${source_tsv}\n"
        time gunzip -f ${source_gz}
# -----

# Processing $source_tsv
    printf "\nConverting $source_tsv -> $source_csv\n"
        time tr '\t' ',' < $source_tsv > $source_csv
    #
    
    printf "\nfixlengths\n"
        #  Force a CSV file to have same-length records by either padding or truncating them.
        time xsv fixlengths $source_csv > $fxl$source_csv

        cp ./$source_csv $source2_csv
        time xsv fixlengths $source2_csv > $noidx$fxl$source_csv
    
    printf "index\n"
        # Create a csv.idx for a csv file. This is very quick and provides constant time indexing into the CSV file.
        time xsv index $fxl$source_csv
        # $noidx$fxl$source_csv


