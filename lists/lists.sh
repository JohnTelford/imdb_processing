 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

source ../functions/data_files.sh
source ../functions/arguments.sh

echo "lists.sh"

echo "primary_profession_list"
cat $NBASICS | gawk -F, '{print $5}' | gsed -e 's/\\N//' -e 's/primaryProfession//' | sort -u > primary_profession_list.txt &
echo "genres_list"
cat $TBASICS | gawk -F, '{if ( $NF != '\N' ) ; print $NF}' | gsed -e 's/\\N//' -e 's/genres//' | sort -u > genres_list.txt &
echo "type_list"
cat $TBASICS | gawk -F, '{print $2}' | gsed -e 's/\\N//' -e 's/titleType//' | sort -u > title_type_list.txt &
echo "category_list"
 $TPRINCIPALS | gawk -F, '{print $4}' | gsed -e 's/\\N//' -e 's/category//' | sort -u > category_list.txt &
