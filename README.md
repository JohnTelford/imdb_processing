# IMDb Dataset Proof Of Concept Project

**NOTE:** *"IMDb Datasets
Subsets of IMDb data are available for access to customers for personal and non-commercial use. You can hold local copies of this data, and it is subject to our terms and conditions. Please refer to the Non-Commercial Licensing and copyright/license and verify compliance."*

See [IMDb Datasets](https://www.imdb.com/interfaces/) for a list and de

## Overview
A fundamental goal for the IMDb dataset proof of concept project is to have query results from all IMDb datasets be in dataset `CSV` caches

Building results for question such as wanting all the information available for all of John Wayne movies is a job of collecting the information from parsing dataset `CSV` caches, instead of querying the datasets. The cache files are updated with queries not in cache.

The name constan `nconst` and title constant `tconst` values  are indexes used to navigate IMDb datasets



## name.Basics

The IMDb dataset `name.basics` is queried with `primaryName` with capitalized `First Last` person name. The query may be qualified with `birthYear`, `death,Year`, and `primartProfession`.

A name.Basics query with `primaryName` = `John Wayne` and `primaryProfession` = `actor` returns  
`nm0000078,John Wayne,1907,1979,actor,producer,soundtrack,tt0031971,tt0065126,tt0056217,tt0053580`

Likewise, a `name.Basics` query with `primaryName` = `Cecil B. DeMille` and `primaryProfession` = `director` returns  
`nm0001124,Cecil B. DeMille,1881,1959,producer,director,editor,tt0043014,tt0041838,tt0049833,tt0044672`

The `nconst` `nm0000078`
###  primartPprofession
actor, 
actress, 
animation_department, 
art_department, 
art_director, 
assistant, 
assistant_director, 
camera_department, 
casting_department, 
casting_director, 
choreographer, 
cinematographer, 
composer, 
costume_department, 
costume_designer, 
director, 
editor, 
editorial_department, 
electrical_department, 
executive, 
legal, 
location_management, 
make_up_department, 
manager, 
miscellaneous, 
music_department, 
primaryProfession, 
producer, 
production_department, 
production_designer, 
production_manager, 
publicist, 
script_department, 
set_decorator, 
sound_department, 
soundtrack, 
special_effects, 
stunts, 
talent_agent, 
transportation_department, 
visual_effects, 
writer

## IMDb Caching Algorithm

` if cache does not exist` then `touch $cache_file; cf=false`

If `$cf == true` then search `$cache_file > ${csv_file}`

If `$cache_file` search fails then search IMDb dataset file > `${csv_file}`

If `$cf == false` then search IMDb dataset file > `${csv_file}`  
`if $? ==1 then exit 1`

If `$cf == true` then `exit  0` #  $cache_file contains search

### cache management
`cp ${cache_file}  ${cache_file_temp}  #  be safe`

`xsv cat rows   ${csv_file} >> ${cache_file_temp}`

`sort -u ${cache_file_temp} > ${cache_file}`

`exit 0`