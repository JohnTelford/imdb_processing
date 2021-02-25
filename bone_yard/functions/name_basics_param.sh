    while [ ! -z "$1" ]; do
        case "$1" in
            -by | --birthYear)
                shift
                birthYear=$1
                echo "You entered --birthYear $birthYear"
                ;;
            -dy | --deathYear)
                shift
                deathYear=$1
                echo "You entered --deathYear $deathYear"
                ;;
            -h | --help)
                shift
                    echo "Parameters are:"
                    echo "-by | --birthYear"
                    echo "-dy | --deathYear"
                    echo "-h  | --help"
                    echo "-pn | --primaryName"
                    echo "-pp | --primaryProfession"
                exit
                ;;

            -pn | --primaryName)
                shift
                primaryName=$1
                echo "You entered --primaryName $primaryName"
                ;;
            -pp | --primaryProfession)
                shift
                primaryProfession=$1
                echo "You entered --primaryProfession $primaryProfession"
                ;;
            *)
                echo "Error"
                show_usage
                ;;
        esac
        shift
    done
}

# datasets
imdb_dateset_cache="/Volumes/Dev/imdb/imdb_dataset_cache/"
imdb_dataset_in_files="/Volumes/Dev/imdb/imdb_dataset_files/"
imdb_dataset_out_files="/Volumes/Dev/imdb/imdb_processing_out/"

# Note: all fxl_ file have been ln -s 

imdb_dataset_in="$imdb_dataset_in_files$fxl_name"
imdb_dataset_out="$imdb_dataset_out_files$fxl_name"

cache_name="name.basics_cache.csv"
cache_file=${imdb_dateset_cache}$cache_name
cache_name_temp="name.basics_cache_temp.csv"
cache_file_temp=${imdb_dateset_cache}$cache_name_temp

csv_name="name.basics_csv"
csv_file=${imdb_dataset_out_files}$csv_name

fxl_file=${imdb_dataset_in}
# FIXME
shell_name="name.basics_shell.sh"
shell_file=${imdb_dataset_out_files}$shell_name

