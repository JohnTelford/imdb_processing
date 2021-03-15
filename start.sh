 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "start.sh"

# ln -s of IMDb datasets
source functions/data_files.sh
source functions/arguments.sh

cat << EOF
Please select a media type
EOF

# 
read -p '(1) Choose to view lists of media types: 
    (1) movie-list 
    (2) tv-list
    (3) other-list
    (4) next-step
    (5) quit
    Enter selection: ' media_list
#echo "$media_list"
case $media_list in

    1 | movie-list)
        echo "movie-list"
        cat "lists/movie_type_list.txt"
        echo ""
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

    5 | quit)
        echo ""
        exit 0
        ;;

    *)
        echo "unknown list"
        echo ""
        exit 1
        ;;
esac

# Select types of media
read -p '(2) Select media_type; (1) movies, (2) tv or (3) other: ' media_type
echo "$media_type"
case $media_type  in

    1 | movies)
        echo "movie media"
        read -p 'Enter movie_type:' movie_type
        echo "$movie_type"
        # TODO eheck
        ;;

    2 | tv)
        echo "tv media"
        read -p 'Enter tv_type:' tv_type
        echo "$tv_type"
        # TODO eheck
       ;;

    3 | other)
        echo "other media"
        read -p 'Enter other_type': other_type
        echo "$other_type"
        # TODO eheck
        ;;

    *)
        echo "Unknown media type"
        ;;
esac 
