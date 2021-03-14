 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "TEST.sh"

# ln -s of IMDb datasets
source functions/data_files.sh
source functions/arguments.sh

echo "Welcome"

# media type lista
read -p 'Choose a lists of media types: (1) movie-list, (2) tv-list, (3) other-list: ' media_list
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

    *)
        echo "unknown list"
        echo ""
        ;;
esac

# media_type
read -p 'Choose one or more types of media; (1) movies, (2) tv or (3) other: ' media_type
#echo "$media_type"
case $media_type  in

    1 | movie)
        echo "movie media"
        ;;

    2 | tv)
        echo "movie media"
        ;;

    3 | other)
        echo "other media"
        ;;

    *)
        echo "Unknown media type"
        ;;
esac 
