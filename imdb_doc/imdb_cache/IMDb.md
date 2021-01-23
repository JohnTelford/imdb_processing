# IMDb
[Internet Movie Database](https://www.imdb.com)

Jan 17, 2021

## rad imdb directories
    'imdb' => '/Volumes/Dev/imdb'
    'imdba' => '/Volumes/Dev/imdb/imdb_dataset_parametrs'
    'imdbc' => '/Volumes/Dev/imdb/imdb_dataset_cache'
    'imdbd' => '/Volumes/Dev/imdb/imdb_dataset_files'
    'imdbo' => '/Volumes/Dev/imdb/imdb_processing_out'
    'imdbp' => '/Volumes/Dev/imdb/imdb_processing'

## IMDb Datasets Entity-relationship Model

![IMDb Dataset Headers](./imdb_erd.png)

<!-- ## Flowchart

<!-- ```mermaid
graph TD;
    A-->B;
    A-->|Short Cut| D;
    A-->C;
    B-->|Do it| D;
    C-->D;
​``` --> 



Processing

*Note:* `dataset` refers to an IMDb dataset

### name.basics Dataset
The dataset for named_basice
```
Parameters are:
-by | --birthYear
-dy | --deathYear
-h  | --help
-pn | --primaryName
-pp | --primaryProfession
```

Processing starts with querying the `name.basics.csv` dataset. It is one of the 6 `IMDb datasets` One or more parametrs are used, such as` primaryName` and `primaryProfession` to select a person and profession, such as *John Wayne, Actor*. Other parametrs are available for more specific selections such as,`birthYear`, `deathYear` and `knowForTitles` 

The csv row or rows are selected from the `name.basics` dataset containing all values for the selected parametrs, including 'nconst'. It is the key to the rest of the IMDb datasets. All selected rows are added to the `name.basics_cache.csv` file. If no parametrs are found, the program exits.

### title.principles dataset

<!-- ```
TODO correct paramaters for this IMDb dataset
Parameters are:
-by | --birthYear
-dy | --deathYear
-h  | --help
-pn | --primaryName
-pp | --primaryProfession
​``` -->

The `title.principles.csv` dataset uses `nconst` selected from the `name.basics` dataset to retrieved rows with the `tconst` attribute , and the other parametrs such as `ordering`, `category`, `job`, and `characters`. Four other IMDb Datasets use `tconst`. All selected rows are added to the `title.principles_cache.csv` file.  

## Retrieving parametrs

### Cache

The dataset `_cache.csv` is first queried. If it fails then the IMDb Dataset is queried and successes are added to its `_cache.csv` and deduplicated.

The purpose of each  dataset cache is to speed up collecting more parametrs from previous queries. All the rows of an IMDb Dataset of successful queries are added to the dataset `_cache.csv`. It is faster to query dataset `_cache.csv` to find additional parameters than starting at  `name.basics`for `nconst` and the  `title.principles` for `tconst`,  to query other IMDB Datasets.

#### With Cache

If `imbd_dataset_cache.csv` does not exist, it will be created with a header using `xsv slice IMDb_dataset.csv --start 0 end 0 > imbd_dataset_cache.csv` 

if `imbd_dataset_cache.csv` does exist then it will be used to retrieve parametrs `xsv search <parametrs> --no-headers dataset_cache.csv > dataset_cache_out.csv` . 
If no parametrs then Without Cache

### Cache Design
If query parameters are successful

#### Without Cache

 `xsv search <parametrs> --no-headers IMDb_dataset.csv > dataset_out.csv`
 If no parametrs then exit



## Cache cat
No-headers for cache

Cat .
Cat cache -> cache_temp
Sort -u cache
```