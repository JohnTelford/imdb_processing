 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

source ../functions/data_files.sh
source ../functions/arguments.sh

echo "lists.sh"

echo "primary_profession_list"
cat $NBASICS | gawk -F, '{print $5}' | sed -e 's/\\N//' -e 's/primaryProfession//' | sort -u > primary_profession_list.txt &
echo "genres_list"
cat $TBASICS | gawk -F, '{if ( $NF != '\N' ) ; print $NF}' | sed -e 's/\\N//' -e 's/genres//' | sort -u > genres_list.txt &
echo "category_list"
cat $TPRINCIPALS | gawk -F, '{print $4}' | sed -e 's/\\N//' -e 's/category//' | sort -u > category_list.txt &
