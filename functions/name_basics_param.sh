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