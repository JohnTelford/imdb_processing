#!/bin/bash
# start.sh - prompt user for information

cat << EOF
Welcome
EOF

read -p "Chose one or more types of media; movies, tv or other: " response
echo "$response" |  tr '[:upper:]' '[:lower:]' |
gawk  '{ 
    print $0
    field = NF
    for ( f = 1; f  <= field ; f++ ) {
        # if ( $f ~ /^movie/ ) print $f is a valid choice
        # if ( $f ~ /^tv/ ) print $f is a valid choice
        # $f is NOT a valid choice

        switch ( $f ) {
            case "movie" : print $f is a valid choice
            case "tv" : print $f is a valid choice
            default : print $f is NOT a valid choice
        }
    } 
}' 



