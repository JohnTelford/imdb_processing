#function show_usage

# {
#     echo "Parameters are:"
#     echo "-by | --birthYear"
#     echo "-dy | --deathYear"
#     echo "-h  | --help"
#     echo "-pn | --primaryName"
#     echo "-pp | --primaryProfession"
#     exit

# }

function  name_basics_param

{
    # Process arguments
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
                show_usage
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
    done

{



