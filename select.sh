#!/bin/bash
# xsv select

# Datasets directory
dataset_files="/Volumes/Dev/imdb_dataset_files/fixlengths_"

# NOTE: Only use fixlengths ${dataset_files}<file>

# xsv select nconst,primaryName,knownForTitles ${dataset_files}name.basics.csv | xsv sample 10 | xsv table

# xsv join nconst ${dataset_files}name.basics.csv \
#     tconst ${dataset_files}title.episode.csv \
# |xsv select knownForTitles | xsv sample 10 | xsv table

xsv join --no-case nconst,knownForTitles ${dataset_files}name.basics.csv \
   tconst,primaryTitle ${dataset_files}title.basics.csv