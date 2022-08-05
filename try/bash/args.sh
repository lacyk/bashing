#!/bin/bash

unpacking(){
    for i in *; do
        if [[ $(file $i | awk '{print $2}') == "Zip" ]]; then 
            unzip -o -q $i
            counter=$((counter+1))
            # echo 1 file was unzipped
        elif [[ $(file $i | awk '{print $2}') == "gzip" ]]; then 
            gunzip -d -k -f $i
            counter=$((counter+1))
        elif [[ $(file $i | awk '{print $2}') == "bzip2" ]]; then 
            bunzip2 -d -k -f -q $i
            counter=$((counter+1))
        elif [[ $(file $i | awk '{print $2}') == "compress'd" ]]; then 
            uncompress < $i > archive
            counter=$((counter+1))
        else
            notarchives=$((notarchives+1))
        fi
    done
}

for ARG in "$@"; do
    if [ -d $ARG ]; then
            cd $ARG
            unpacking
    elif [ -e $ARG ]; then
        unpacking
    fi
done