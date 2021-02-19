

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

#gawk ' $4 ~ /writer/ ' title.principals.csv

# echo -e "unixtime;host_name;ip_adress;description;2;0;1\n1234567890;hName;hIP;hDesc;2;1;0" |
# gawk -F";" 'BEGIN {OFS=";"} {
#   if (NR<2) next;
#   $1=strftime("%Y-%m-%d %H:%M:%S", $1);
# #   $5=($5==2?"CRITICAL":$5);
# #   $6=($6?"Yes":"No") ; $7=($7?"Yes":"No") ;
#   print}'

# gawk -F, '{
#     $1;
#     $2;
#     $3;
#     print
# }' name.basics.csv

Removes "" and []
gawk 'BEGIN {
    FPAT = "([^,]*)|(\"([^\"]|\"\")*\")" 
}
{
    print "NF = ", NF
    for (i = 6; i <= NF; i++) {
        # get text within [ ]
        if (substr($i, 1, 1) == "\[") {
            len = length($i)
            $i = substr($i, 2, len -2)
        }
        
        # get text within two quotes
        if (substr($i, 1, 1) == "\"") {
            len = length($i)
            $i = substr($i, 2, len - 2)
        }
        printf("$%d = <%s>\n", i, $i)
    }
}' 

# _bsite=$(sed 's|/|\\/|g' <<< $website)
primary_name=$(set 's/ /_/' <<< $primary_name)


