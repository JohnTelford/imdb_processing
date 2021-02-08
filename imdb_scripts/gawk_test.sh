
# Iteration 1
# gawk -F, '
#     { print $0 } 
#     {  
#         sub(  / /, "_", $2 ) ; printf $2 # primaryName
#         printf "_" $3 #birthYear
#         printf "_" $5 # primaryProfession 
#         print ".csv" 
#         print csv
#     }' nameBasics_tmp_cache.csv

# Iteration 2
gawk -F, '
    { print $0 } 
    {  
        sub(  / /, "_", $2 )
        line = $2 "_" $3 "_" $5  ; print line
        printf $0 > line
    }' nameBasics_tmp_cache.csv


