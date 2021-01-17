# Craft cli

# Select list of imdb dataset atributes
xsv select 6 fxl_name.basics.csv | xsv search 2 --no-headers | sort -u > test-attribute.txt 
