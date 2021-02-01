cat "john" "wayne" | awk (1 2)

gawk -F, ' $5 ~ /director/ { print $5 ", " }' name.basics.csv | sort -u # name.basics_primaryProfession

gawk -F, ' $5 ~ /director/ { print $2 ", " $5  }' name.basics.csv | sort -u # name.basics_primaryProfession

# search using rg
rg "John Wayne,\d+," fxl_name.basics.csv | gawk -F, '$0 ~ /actor/ { print $1 }' # possible replacment for xsv searach

rg "nm0000078,actor" fxl_title.principals.csv # possible replacement for xsv search

rg "John Wayne,\d+," name.basics.csv | gawk -F, '$0 ~ /actor/ { print $0 }' > tmp | rg "$1,actor" fxl_title.principals.csv # possible replacement for xsv search
