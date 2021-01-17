# imdb_cache

Jan 16, 2021

## File Directories

`rad indba` => imdb_dataset_attributes
`rad imdbd` => imdb_datasets
`rad imdbo` => imdb_processing_out
`rad imdbp` => imdb processing

## Processing

### name_basics
Processing starts with quering `mdb_name.basics.csv`. One or more attributes are selected.` primaryName` and `primaryProfession` are used to select a person and profession, such as John Wayne, Actor.

A 'nconst' number is returned If 1 or more attribute are found 

If no attributes are found, the program exits



## Retrieving Attributes

### With Cache
If `imbd_dataset_cash.csv` does not exist, it will be created with a header by `xsv header imdb_dataset.csv > imbd_dataset_cash.csv` 

if `imbd_dataset_cash.csv` is not empty then retrieve attributes `xsv search <attributes> --no-headers dataset_cache.csv > dataset_cache_out.csv` . 
If no attributes then Without Cache

### Without Cache

 `xsv search <attributes> --no-headers imdb_dataset.csv > dataset_out.csv`
 If no attributes then exit



## Cache cat
No-headers for cache

Cat .
Cat cache -> cache_temp
Sort -u cache