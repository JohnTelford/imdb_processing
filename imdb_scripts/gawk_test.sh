

# Iteration 2 - simple and it WORKS
# create nameBasics primaryName_birthYean_primaryProfession_cache_nameBasics.csv
# gawk -F, '{
#     { print $0 } 
#     {  
#         primaryName = $2
#         sub(  / /, "_", primaryName )
#         birthYear = $3
#         primaryProfession = $5
#         csv = "cache_nameBasics.csv"

#         line = primaryName "_" birthYear "_" primaryProfession  "_" csv ; print line
#         printf $0 > line
#     }
# '} cache_nameBasics.csv

# gawk accessing values of bash variables
# xx="This is xx"
# yy="This is yy"
# zz="This is zz"

# gawk -F,  \
#     -v xx="$xx" \
#     -v yy="$yy" \
#     -v zz="$zz" \
#     'BEGIN {
#         print xx 
#         print yy 
#         print zz
# } '

# gawk -F,    -v search_name = "${search_name}" \
#      ' BEGIN {
#         print search_name 
#         print profession
#         print zz
# #     }
# #     {
# #         #/John/ {print found } 
# #    }
# }' cache_nameBasics.csv

