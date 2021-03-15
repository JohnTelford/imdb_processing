#!/usr/bin/env bash
# menues

#!/usr/bin/env bash
function overview ()
{
    cat << EOF
Overview
IMDb

EOF
}

function media_type_lists ()
{
    read -p 'Choose to view lists of media types: 
    (1) movie-type 
    (2) tv-list
    (3) other-list
    (4) next-step
    (5) reset
    (6) quit
    Enter selection: ' media_list
#echo "$media_list"
    case $media_list in

        1 | movie-list)
            echo "movie-type"
            cat "lists/movie_type_list.txt"
            echo ""

            read -p 'Enter movie type: movie_type:
            (1) movie
            (2) short
            (3) episode
            Enter selection: ' movie_type
            case $movie_type in
                1 | movie )
                    movie_type="movie"
                ;;

                2 | short )
                    movie_type="short"
                ;;

                3 | episode )
                    movie_type="episode"
                ;;

                *)
                    echo "unknown list"
                    echo ""
                    exit 1

            esac
            ;;

        2 | tv-list)
            echo "tv-list"
            cat "lists/tv_type_list.txt"
            echo ""
            ;;

        3 | other-list)
            echo "other-list"
            cat "lists/other_type_list.txt"
            echo ""      
            ;;

        4 | next-step)
            echo ""
            ;;

        5 | reset)
            tput reset
            ;;
            
        6 | quit)
            exit 0
            echo ""
            ;;

        *)
            echo "unknown list or command"
            echo ""
            exit 1
            ;;
    esac
}

function movie()
{
    read -p "Enter movie"

}