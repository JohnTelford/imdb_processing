BEGIN {
    FS = ","
}
{ 
    if ( NR != 1 ) 
    {
        # if ( $3 != "\\N") 
        # {   
        #     printf "%s ", $1 ;
        # }
        print $0
    }
}