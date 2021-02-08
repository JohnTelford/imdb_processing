
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

# Iteration 2 - simple and it WORKS
gawk -F, '
    { print $0 } 
    {  
        primaryName = $2
        sub(  / /, "_", primaryName )
        birthYear = $3
        primaryProfession = $5
        csv = "cache_nameBasics.csv"

        line = primaryName "_" birthYear "_" primaryProfession  "_" csv ; print line
        printf $0 > line
    }' nameBasics_tmp_cache.csv


