 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "rmlink.sh"

for file_name in name.basics title.akas title.basics title.episode title.principals title.ratings title.crew
    do
        FILE_NAME=$file_name
        # Replace . in filename with_
        FILE_NAME=$(gsed -e "s/\./\_/g" <<< $FILE_NAME)
    
        # Upper case
        FILE_NAME=$(gsed 's/.*/\U&/' <<< $FILE_NAME)
        
        # Unlink
        if [ -f  $FILE_NAME ] ; then
                /bin/rm -f $FILE_NAME
                echo "Removed $FILE_NAME link"
            else
                echo "No $FILE_NAME link"
        fi
    done

