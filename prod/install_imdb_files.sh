#!/bin/bash
# install_imdb_files

# IMDb update dataset files daily

imdb_dataset_files=/Volumes/Dev/imdb/imdb_dataset_files

/bin/rm -rf $imdb_dataset_files
mkdir $imdb_dataset_files

cd $imdb_dataset_files
echo $PWD

for file_name in name.basics title.akas title.basics title.episode title.principals title.ratings title.crew
    do
        # File names
            # File names
            source_gz="$file_name.tsv.gz"
            source_tsv="$file_name.tsv"
            source_csv="$file_name.csv"
        # -----
        
        # Download ${source_gz}
            printf "Downloading $source_gz\n"
                curl_source="https://datasets.imdbws.com/$source_gz"
                curl -O $curl_source
            printf "unzipping ${source_gz} -> ${source_tsv}\n"
                gunzip -f ${source_gz}
        # -----

        # Processing ${source_gz}
            printf "Converting $source_tsv -> $source_csv\n"
                tr '\t' ',' < $source_tsv > $source_csv
                /bin/rm -f $source_tsv

            # printf "fxl\n"
            #     #  Force a CSV file to have same-length records by either padding or truncating them.
            #     fxl="fxl_"
            #     xsv fixlengths $source_csv > $fxl$source_csv
            #     /bin/rm -f $source_csv
            # printf "index\n" 
            #     # Create an index for a CSV file. This is very quick and provides constant time indexing into the CSV file.
            #     xsv index $fxl$source_csv
                
            # printf "hdrs\n"
            #     #  Show the headers of CSV data. Or show the intersection of all headers between many CSV files.
            #     hdrs="hdrs_"
            #     xsv headers $fxl$source_csv > $hdrs$source_csv
                
            # printf "stats\n"
            #     # Show basic types and statistics of each column in the CSV file. (i.e., mean, standard deviation, median, range, etc.)
            #     stats="stats_"
            #     xsv stats $fixlengths$source_csv | xsv table> $stats$source_csv
        # -----    
    done
