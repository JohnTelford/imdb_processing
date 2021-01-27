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
        it ($4 ==)
        print $4
    }
}


gawk \
'{FS=","; \
if($4 == "actor") print $0; next;}\
' title_principales_out.csv