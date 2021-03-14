 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "Testit.sh"

echo "Welcome"

gawk 'BEGIN {
    printf "Choose a lists of media types: movie-list, tv-list, other-list"
    getline list < /dev/stdin
    print list NF
    }
    {    
        field = NF
        for ( f = 1; f  <= field ; f++ ) {
            switch ( $f ) {
                case "movie-list" : 
                    print  $f " is a valid choice"
                    getline  < "list/title_type_list.txt"
                    print 
                    break
                case "tv-list" : 
                    print $f " is a valid choice"
                    break
                default : 
                    print $f " is NOT a valid choice"
                    break
            }
        } 
        exit 0
    }'



gawk  'BEGIN {
    printf "Choose one or more types of media; movies, tv or other: "
    getline response < /dev/stdin
    #print reaponse
    }
    {    field = NF
    for ( f = 1; f  <= field ; f++ ) {
        switch ( $f ) {
            case "movie" : 
                print  $f " is a valid choice"
                break
            case "tv" : 
                print $f " is a valid choice"
                break
            default : 
                print $f " is NOT a valid choice"
                break
        }
    } 
    exit 0
}'
