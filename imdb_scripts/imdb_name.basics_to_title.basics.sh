#!/bin/bash
# imdb_name.basics_to_title.basics.sh
#   trial run for rg replacing xsv

# name.basics
echo "name.basics"

# command line parameters
show_usage() {
    echo "name_basice.sh parameters:"
    echo "Note: parameters are case sensitive"

    echo "-h   | --help"
    echo "-fn  | --firstName"
    echo "-ln  | --lastName"
    echo "-p   | --Profession"
    echo "-kft | --knownForTitles"
    echo "-by  | --birthYear"
    echo "-dy  | --deathYear"

    # echo "Syntax Rules"
    # echo "primaryName - Title Case"
    # echo "primaryProfession - actoress or actoress"
}

# named arguments
#echo "parameters"
while [ ! -z "$1" ]; do
    case "$1" in
    -by | --birthYear)
        shift
        birthYear=$1
        echo "--birthYear $birthYear"
        ;;
    -dy | --deathYear)
        shift
        deathYear=$1
        echo "--deathYear $deathYear"
        ;;
    -h | --help)
        shift
        show_usage
        exit
        ;;
    -fn | --firstName)
        shift
        firstName=$1
        echo "--firstName $firstName"
        ;;
    -ln | --lastName)
        shift
        lastName=$1
        echo "--lastName $lastName"
        ;;
    -p | --Profession)
        shift
        Profession=$1
        echo "--Profession"
        ;;
    *)
        echo "parameter error"
        show_usage
        exit
        ;;
    esac
    shift
done

echo $firstName
echo $lastName
echo $Profession

#printf "%s %s," ${firstName} ${lastName} > searchName
#echo "${firstName} ${lastName}," > searchName
searchName="${firstName} ${lastName},\d+"
echo "$searchName"


# datasets
imdb_dateset_cache="/Volumes/Dev/imdb/imdb_dataset_cache/"
imdb_dataset_in_files="/Volumes/Dev/imdb/imdb_dataset_files/"
imdb_dataset_out_files="/Volumes/Dev/imdb/imdb_processing_out/"

# HACK  IMDb dataset files have been `ln -s` 
#fxl_name="fxl_name.basics.csv"
name_basics=name.basics.csv



imdb_dataset_in="$imdb_dataset_in_files$name_basics"
name_basics_in=${name_basics}
imdb_dataset_out="$imdb_dataset_out_files$name_basics"

cache_name="name.basics_cache.csv"
cache_file=${imdb_dateset_cache}$cache_name
cache_name_temp="name.basics_cache_temp.csv"
cache_file_temp=${imdb_dateset_cache}$cache_name_temp

csv_name="name.basics_csv"
csv_file=${imdb_dataset_out_files}$csv_name

shell_name="name.basics_shell.sh"
shell_file=${imdb_dataset_out_files}$shell_name

if [[  -s $cache_file ]]; then
    cf=true
    echo "cache_file $cache_file exists"
else
    cf=false
    echo "creating $cache_file"
    touch ${cache_file}
    # create cache_file header
    xsv slice --start 0 --end 0  ${name_basics_in} > ${cache_file}
fi

#if $cf ; then

    echo "cf_true"
    # # search cache_file. If not found search fxl_file
    # echo "xsv select  1-13 ${cache_file} \
    # | xsv search  ${primaryName} \
    # | xsv search ${primaryProfession} \
    # | xsv slice  --no-headers  --start 1 " >${shell_file}
    # # execute xsv shell
    # chmod +x ${shell_file}
    # ${shell_file} >${csv_file}

#Hurray, rg "^nm*" nameBasicsNconst | gawk '{ print"" > $1}' creates file nameBasics_cache_nm0000078.csv

rg "$searchName" name.basics.csv | gawk -F, '$0 ~ /actor/ ' > ${cache_file}
rg "^nm[0-9]+" ${cache_file} | gawk -F, '{print "nameBasics_cache_"$1"_.csv"}' > nameBasicsNconst
#rg "^nm*" nameBasicsNconst | gawk '{ $1}' 
rg "nm[0-9]+,*" nameBasicsNconst  | gawk -F"_" '{ printf $3 > "$0" }' #{ printf $1 > $1}'
# create file - nameBaiscs_cache_"nm...".csv
#rg "^nm[0-9]+," ${cache_file} | gawk -F, '{printf "nameBasics_cache_"$1".csv" }' > nconst_cache
#rg "^nm[0-9]+," ${cache_file} | gawk -F, '{print "nameBasics_cache_"$1".csv"}' 
#rg "^nm[0-9]+" ${cache_file} | gawk -F, '{ printf $1}' > nconst

#rg "^nm[0-9]+" ${cache_file} | gawk -F, '{ printf $1}' > nconst

 #
 #rg "nm[0-9]+" nconst  | gawk '{ printf "" > $1}' 
#cp ${cache_file} >> nameBasics_cache_rip
#rg "^nm[0-9]+" ${cache_file} | gawk -F, '{print "nameBasics_cache_"$1".csv"}' > nameBasicsNconst
#rg "nm*" nameBasicsNconst  | gawk -F, '{ printf""> $1}'
#cat nameBasicsNconst | gawk  -F, '{ printf  ""> $1}' 
#cat  ${cache_file} >> ${nconst_cache}



echo $?
exit

    # # cache_file search failed
    # if [[ ! -s ${csv_file} ]]; then
    #     cf=false
    #     echo "xsv select  1-13 ${fxl_file} \
    #     | xsv search  ${primaryName} \
    #     | xsv search ${primaryProfession} \
    #     | xsv slice  --no-headers  --start 1 " >${shell_file}
    #     # execute xsv shell
    #     chmod +x ${shell_file}
    #     ${shell_file} >${csv_file}
    # fi
#else
    #echo "cf_false"
    # echo "xsv select  1-13 ${fxl_file} \
    # | xsv search  ${primaryName} \
    # | xsv search ${primaryPr"ofession} \
    # | xsv slice  --no-headers  --start 1 " > ${shell_file}
    # # execute xsv shell
    # chmod +x ${shell_file}
    # ${shell_file} >${csv_file}

#rg "John Wayne,\d+," name.basics.csv | gawk -F, '$0 ~ /actor/ { print $0 }' >> ${cache_file}
#fi
