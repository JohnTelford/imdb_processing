BEGIN {
    FS = ","
}
{ 
    #if ( NR != 1 ) 
    # {
        # if ( $3 != "\\N") 
        # {   
        #     printf "%s ", $1 ;
        # }
        #if (NR < 3)printf "%s,%s,%s\n", "Movie", "Year","Run"
        printf "%s,%s,%s\n",  $3,  $6, $8
    # }
}


