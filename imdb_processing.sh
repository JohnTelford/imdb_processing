#!/bin/bash
# imdb_processing

# This is a proof of concept using xsv to select nconst, primaryName, and primaryProfession from the name.basics dataset
# nconst is used to select tconst from the title.principles dataset
# tconst is used to select primaryTitle from title.basics, and data from tconst datasets.
# The datasets fxl prefix indicate the dataset files are fixed length and indexed
# xsv requires 'regex'. '$actor_name' does not work. echo is a workaround 
# I think this structure can be used for all datasets

#=====
# The actor function returns xsv_selected_actor.csv containing the actor nconst
#echo "DEBUG_actor_ncoonst"


#echo "DEBUG_control"
#control

imdb_dataset_in_files="/Volumes/Dev/imdb/imdb_dataset_files/"
imdb_dataset_out_files="/Volumes/Dev/imdb/imdb_processing_out/"
imdb_dataset_in="$imdb_dataset_in_files$fxl_name"
imdb_dataset_out="$imdb_dataset_out_files$fxl_name"

source functions/actor_nconst

actor_nconst  "Robert Downey"
# actor_tcosnt "nm0000078"
# actor_title "tt0075213"

exit