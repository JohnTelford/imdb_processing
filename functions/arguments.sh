 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

 #!/usr/bin/env bash
echo "command line arguments"

# command line parameters
function help() {
    cat <<EOF
    Parameters
    ===========
    NOTE: All parameter values must be enclosed in quotes 

    -pt     | --primary_title

    -tt      | --title_type
    -ttl     | --title_type_list

    -c       | --category 
    -cl      | --category_list

    -g       | --genres
    -gl      | --genres_list

    -pn      | --primary_name  [example: "first_name last_name"]

    -pp      | --primary_profession
    -ppl     | --primary_profession_list

    -kft      | --known_for_titles

    -by      | --birth_year
    -dy      | --death_year
EOF
}


#show_usage

# named arguments
#echo "named arguments"
while [ ! -z "$1" ]; do
    case "$1" in

    -by | --birth_year)
        shift
        birth_year=$1
        echo "--birthYear $birth_year"
    ;;

     -c | --category)
        shift
        category=$1
            echo $category
            if  rg "${category}" ./lists/category_list.txt  ; then
                echo "${category} is a category"
            else
                echo "${category} is NOT a category"
                cat <<EOF 
Use the command line parameter -cl for a list of categories
EOF
                exit 1
            fi
        echo "--category $category"
    ;;

    -cl | --category_list)
        shift
        printf "\n==============="
        printf "\n%s\n\n" "category_list.txt"
        cat ./lists/category_list.txt
        exit 0
    ;;

   -dy | --death_year)
        shift
        death_year=$1
        echo "--deathYear $death_year"
    ;;

    -h | --help)
        shift
            help
        exit
    ;;

    -g | --genres)
        shift
        genres=$1
            if  rg "${genres}" ./lists/genres_list.txt  ; then
                echo "${genres} is a genres"
            else
                echo "genera  ( ${genres} )   is NOT a valid genres"
                cat <<EOF 
Use the command line parameter -gl for a list of genres
EOF
                exit 1
            fi
    ;;
    -gl | --genres_list)
        shift
        printf "\n==========="
        printf "\n%s\n\n" "list genres"
        cat ./lists/genres_list.txt
        exit 0
        ;;

    -pn | --primary_name)
        shift
        primary_name=$1

            # title_case primary_name
            primary_name=$(gsed -e "s/\b./\u\0/g" <<< $primary_name)

        echo "--primary_name $primary_name"
        ;;

    -pp | --primary_profession)
        shift
        primary_profession=$1

            if  rg "${primary_profession}" ./lists/primary_profession_list.txt  ; then
                echo "${primary_profession} is a primary_profession"
            else
                echo "primary_profession ( ${primary_profession} ) is NOT a valid primary_profession"
                cat <<EOF 
Use the command line parameter -ppl for a list of primary_profession
EOF
                exit 1
            fi
        ;;

    -ppl | --primary_profession_list)
        shift
        printf "\n======================="
        printf "\n%s\n\n" "list primary_profession"
        cat ./lists/primary_profession_list.txt
        exit 0
        ;;
    
    -pt | --primary_title)
        shift
        primary_title=$1
            echo $primary_title
        ;;
        
    -tt | --title_type)
        shift
        category=$1
            echo $title_type
            if  rg "${title_type}" ./lists/title_type_list.txt  ; then
                echo "${title_type} is a title_type"
            else
                echo "${title_type} is NOT a title_type"
                cat <<EOF 
Use the command line parameter -ttll for a list of categories
EOF
            exit 1
        fi
    echo "--title_type $title_type"
;;

    -ttl | --title_type_list)
        shift
        printf "\n==============="
        printf "\n%s\n\n" "title_type_list.txt"
        cat ./lists/title_type_list.txt
        exit 0
    ;;


    *)
        echo "parameter error"
            help
        exit 1
        ;;
    esac
    shift
done
