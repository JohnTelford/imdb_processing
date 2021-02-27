 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "export.sh
"
# export ln -s to IMDb datasets

path="/Volumes/Dev/imdb/imdb_dataset_files"

for file_name in name.basics title.akas title.basics title.episode title.principals title.ratings title.crew
    do
        # unset -v $file_name
        # exit 1
        file_name_csv="$file_name.csv"
        echo $file_name_csv
        file_name=$file_name
        file_name=$(sed 's/\./_/' <<< $file_name)
        echo $file_name
        if  test -f $file_name; then
            echo "$file_name exists"
            rm  $file_name
        else
            echo "$file_name does not exist"
            ln -s ${path}/${file_name_csv} $file_name
            export file_name
            echo $file_name
        fi
    done

# ln -s /Volumes/Dev/imdb/imdb_dataset_files/name.basics.csv name_basics
# export $name_basics

# ln -s /Volumes/Dev/imdb/imdb_dataset_files/title_akas.csv title_akas
# export $title_akas
