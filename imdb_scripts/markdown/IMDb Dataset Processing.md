---
toc:
    depth_from: 1
    depth_to: 3
    ordered: false
---  
  
#  IMDb Dataset Processing
  
[TOC]

##  Tasks
  
  
- [x]   Shell arguments
- [x]   References
- [ ]   User interface
- [x]   Title case `actor_name`
- [ ]   Create cache directory for each IMDb dataset
  - [x] name_basics directory
*NOTE - check if  `query_results.csv` exists*  
Example query results - `John_Wayne_1907_actor`
    - [x]   `headers_name.basics.csv`
    - [x]   `query_results.csv`
    - [x]   `query_results.nconst`

  - [x] title_principals directory
    - [x]   `headers_title.principals.csv`
    - [ ]   `query_results.csv`
    - [ ]   `query_results.nconst`

  - [x] title_basics directory
  - [x] Environmental variables ln -s to IMDb datasets
  
##  IMDb Entity-relationship Model 
  
  
![IMDb ERD](assets/imdb_erd.png )
  
##  IMDb Datasets Overview
  
  
**NOTE** *"Subsets of IMDb data are available for access to customers for personal and non-commercial use. You can hold local copies of this data, and it is subject to our terms and conditions. Please refer to the Non-Commercial Licensing and copyright/license and verify compliance."* [IMDb Datasets](https://www.imdb.com/interfaces/ ) []
  | Dataset | Contents |
  | :--------- | :---------- |
|  `name.basics.tsv.gz`|    information for names |
|  `title.akas.tsv.gz` |   localized title information |
|  `title.basics.tsv.gz` |   information about titles |
|  `title.crew.tsv.gz`|    director and writer information  |
|  `title.episode.tsv.gz ` |    tv episode information |
|  `title.principals.tsv.gz` |    principal cast / crew for titles |
|  `title.ratings.tsv.gz`|    IMDb rating and votes information for titles
  
##  MDb Datasets Exports

IMDb datasets are exported as environmental variables so shell scripts can easily access them. An example of use is `rg "John Wayne" $name_basics`
```bash
export name_basics=/Volumes/Dev/imdb/imdb_dataset_files/name.basics.csv
export title_akas=/Volumes/Dev/imdb/imdb_dataset_files/title.akas.csv
export title_basics=/Volumes/Dev/imdb/imdb_dataset_files/title.basics.csv
export title_crew=/Volumes/Dev/imdb/imdb_dataset_files/title.crew.csv
export title_episode=/Volumes/Dev/imdb/imdb_dataset_files/title.episode.csv
export title_principals=/Volumes/Dev/imdb/imdb_dataset_files/title.principals.csv
export title_ratings=/Volumes/Dev/imdb/imdb_dataset_files/title.ratings.csv
```

##  Dataset Keys

  
`nconst` is the *name* constant and the first attribute of the `name.basics` dataset. It is used  in querying the `title.principales` dataset.

`nconst` points to `tconst` constants in the `title.principales` dataset.  They are used to query other IMDb datasets as shown in the diagram above.
  
  
##  Query Examples
  
  
The `rg` [ripgrep](https://crates.io/crates/ripgrep ) command line search utility tool   recursively searches dictories using a  `regex` pattern.
  
The query `rg ',John Wayne,\d+,' name.basics.csv | rg 'actor'` produces the record `nm0000078,John Wayne,1907,1979,actor,producer,soundtrack,tt0031971,tt0065126,tt0056217,tt0053580`. This record is saved as a cache file as `imdb_dataset_cache/name_basics/csv_John_Wayne_name.basics`
  
The` \d+,` after `,John Wayne,` in the query regex further qualifies the query so the `primaryName` field is followed immediately by a the `birthYear` field containing digits.
  
The first field from the `name.basics.csv` dataset query is used to query the `title.principals.csv` dataset. The query `rg 'nm0000078,actor,' title.principals.csv` produces a list of `tconst` value and `character` played by the actor. The first record returned from this query is `tt0020691,1,nm0000078,actor,\N,"[""Breck Coleman""]"`,  Each `tconst` value returned  is used to query other IMDb datasets.
  
The record returned by the query `rg 'tt0020691' title.basics.csv` is `tt0020691,movie,The Big Trail,The Big Trail,0,1930,\N,125,Adventure,Romance,Western`
  
The query `rg 'tt0020691` title.principals.csv returns up to 10 records containing the character names of played by other actor and actress, and writers, directors, and other jobs. The record for character *Ruth Cameron* is `tt0020691,2,nm0161451,actress,\N,"[""Ruth Cameron""]"`
  
The query `rg 'nm0161451' name.basics.csv` returns the record `nm0161451,Marguerite Churchill,1910,2000,actress,tt0028478,tt0021606,tt0027545,tt0020691` for the actress who played the character *Ruth Cameron*
  
  
##  dev Directory Structure

```shell
 |-prams_found
 |-datasets_summary.txt
 |-xsh_help.txt
 |-xsv_actor_nconst.sh
 |-IMDb_Datasets.png
 |-rg --help.txt
 |-.DS_Store
 |-imdb_proessingQ.sh
 |-imdb_doc
 | |-.DS_Store
 | |-IMDb Dataset
 | |-imdb_cache
 | | |-.DS_Store
 | | |-imdb_erd.png
 | | |-IMDb.md
 | | |-xsv_commands_help.md
 |-imdb_scripts
 | |-name.csv
 | |-addresses.csv
 | |-nameBasics_tmp_cache.csv
 | |-awk_one_liners.awk
 | |-title.basics_awk_cache_csv.awk
 | |-title.basics_cache.csv
 | |-.DS_Store
 | |-cache_name_basics
 | |-salesinfo.txt
 | |-name.basics_Profession.txt
 | |-imdb_name.basics.sh
 | |-install_imdb_files.sh
 | |-imdb_dataset_cache
 | | |-.DS_Store
 | | |-title_principals
 | | | |-headers_title.principals.csv
 | | |-title_basics
 | | |-name_basics
 | | | |-nconst_John_Wayne_name.basics
 | | | |-csv_John_Wayne_name.basics
 | | | |-headers_name.basics.csv
 | |-title.basics_awk_cache_csv
 | |-fnconst
 | |-csv_cache_awk
 | |-name.basics_director.txt
 | |-shell_testing.sh
 | |-customer.csv
 | |-title.principals_shell.sh
 | |-output
 | |-students.txt
 | |-file_name
 | |-title.basics_shell.sh
 | |-tconst
 | |-cvs_John_Wayne_name.basics
 | |-attributes
 | | |-genres_title.basics.txt
 | | |-title_type_title.basics.txt
 | | |-primary_profession.name.basics.txt
 | |-ls_out
 | |-cache_nameBasics.csv
 | |-nconst
 | |-cache_name_basics.csv
 | |-imdb_cache_stack.sh
 | |-nc
 | |-imdb_title.principals.sh
 | |-imdb_dataset_processing.sh
 | |-name.basice_awk_csv.awk
 | |-hello
 | |-name.basics_shell.sh
 | |-nconst_cache
 | |-title.principals_cache.csv
 | |-test_head.csv
 | |-gawk_test.sh
 |-markdown
 |-xsv_help.sh
 |-xsv_actor
 |-select.sh
 |-name.basics_shell.shQ
 |-xsv_commands.txt
 |-README.md
 |-search_count
 |-datasets_summary.sh
 |-xsv_actor_tconst.sh
 |-xsv_working_examples.txt
 |-functions
 | |-name_basics_param.sh
 | |-title_basics_primary_title.sh
 | |-title_principales_tconst.sh
 |-mermaid
 | |-graph.md
 |-xsv_command
 |-.vscode
 | |-settings.json
 |-assets
 | |-.DS_Store
 |-imdb_dataset_files_timing.sh
 |-imdb_processing.code-workspace
 |-imdb_processing_QQ.sh

  
  
##  References
  
  
[]: [Entity-relationship model](https://en.wikipedia.org/wiki/Entity–relationship_model )
  
[]: [`xsv` - High performance CSV command line toolkit](https://lib.rs/crates/xsv )
  
[]: [Bash Reference Manual](https://www.gnu.org/software/bash/manual/html_node/index.html#SEC_Contents )
  
[]: [Bash Quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html )
  
[]: [`regex` - Regular expression](https://en.wikipedia.org/wiki/Regular_expression )
  
  