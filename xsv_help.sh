#!/bin/bash
# 
#xsv --help commands documentation
# 
#xsv cmd --help >> xsh_help.txt

# cat       
printf "cat\n=====\n" > xsh_help.txt
xsv cat --help >> xsh_help.txt

# count     
printf "\n\ncount\n=====\n" >> xsh_help.txt
xsv count --help >> xsh_help.txt
echo >> xsh_help.txt

# fixlengths
printf "\n\nfixlengths\n=====\n" >> xsh_help.txt
xsv fixlengths --help >> xsh_help.txt
echo >> xsh_help.txt

# flatten   
printf "\n\nflatten\n=====\n" >> xsh_help.txt
xsv flatten --help >> xsh_help.txt
echo >> xsh_help.txt

# fmt      
printf "\n\nfmt\n=====\n" >> xsh_help.txt
xsv fmt --help >> xsh_help.txt 
echo >> xsh_help.txt

# frequency 
printf "\n\nfrequency\n=====\n" >> xsh_help.txt
xsv frequency --help >> xsh_help.txt
echo >> xsh_help.txt

# headers   
printf "\n\nheaders\n=====\n" >> xsh_help.txt
xsv headers --help >> xsh_help.txt
echo >> xsh_help.txt

# help   
printf "\n\nhelp\n=====\n" >> xsh_help.txt
xsv help --help >> xsh_help.txt   
echo >> xsh_help.txt

# index    
printf "\n\nindex\n=====\n" >> xsh_help.txt
xsv index --help >> xsh_help.txt 
echo >> xsh_help.txt

# input   
printf "\n\ninput\n=====\n" >> xsh_help.txt
xsv input --help >> xsh_help.txt 
echo >> xsh_help.txt

# join      
printf "\n\njoin\n=====\n" >> xsh_help.txt
xsv join --help >> xsh_help.txt
echo >> xsh_help.txt

# sample    
printf "\n\nsample\n=====\n" >> xsh_help.txt
xsv sample --help >> xsh_help.txt
echo >> xsh_help.txt

# search   
printf "\n\nsearch\n=====\n" >> xsh_help.txt
xsv search --help >> xsh_help.txt 
echo >> xsh_help.txt

# select   
printf "\n\nselect\n=====\n" >> xsh_help.txt
xsv select --help >> xsh_help.txt 
echo >> xsh_help.txt

# slice   
printf "\n\nslice\n=====\n" >> xsh_help.txt
xsv slice --help >> xsh_help.txt  
echo >> xsh_help.txt

# sort     
printf "\n\nsort\n=====\n" >> xsh_help.txt
xsv sort --help >> xsh_help.txt 
echo >> xsh_help.txt

# split   
printf "\n\nsplit\n=====\n" >> xsh_help.txt
xsv split --help >> xsh_help.txt  
echo >> xsh_help.txt

# stats     
printf "\n\nstats\n=====\n" >> xsh_help.txt
xsv stats --help >> xsh_help.txt
echo >> xsh_help.txt

# table     
printf "\n\ntable\n=====\n" >> xsh_help.txt
xsv table --help >> xsh_help.txt
echo >> xsh_help.txt
