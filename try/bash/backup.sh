#!/bin/bash

# counter for archives
counter=0
# counter for non-archives
notarchives=0

# recursion function that goes through all the directories and applies the commands to each file
recursion(){

    for i in *; do
        if [ -d $i ]; then
            cd $i
            if [[ -z "$(ls -A .)" ]]; then
                echo mock
            else
                recursion
            fi
            cd ..
        else
            unpacking
        fi
    done

}

# file_command checks the extension of the file and decompresses it with the appropriate command
unpacking(){
        if [[ $(file $i | awk '{print $2}') == "Zip" ]]; then 
            unzip -o -q $i
            counter=$((counter+1))
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

}

# loop that checks the arguments passed to the command line [ FILE | DIRECTORY | OPTIONS]
for ARG in "$@"; do
    if [ -d $ARG ]; then
        cd $ARG
        for i in *; do
            unpacking
        done
    elif [ -e $ARG ]; then
        if [[ $(file $ARG | awk '{print $2}') == "Zip" ]]; then 
            unzip -o -q $ARG
            counter=$((counter+1))
        elif [[ $(file $ARG | awk '{print $2}') == "gzip" ]]; then 
            gunzip -d -k -f $ARG
            counter=$((counter+1))
        elif [[ $(file $ARG | awk '{print $2}') == "bzip2" ]]; then 
            bunzip2 -d -k -f -q $ARG
            counter=$((counter+1))
        elif [[ $(file $ARG | awk '{print $2}') == "compress'd" ]]; then 
            uncompress < $ARG > archive
            counter=$((counter+1))
        else
            notarchives=$((notarchives+1))
        fi
    elif  [[ $ARG = "-r" ]]; then
        recursion
    fi
done

for ARG in "$@"; do
    if [[ $ARG = "-v" ]]; then
        echo "Decompressed $counter file(s)..."
        echo "$notarchives file(s) was skipped..."
    fi
done

