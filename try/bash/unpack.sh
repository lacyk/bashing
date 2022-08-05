#!/bin/bash

# add command < source [PATH_TO_SCRIPT] > to ./.bashrc file
# for example: source /Users/vlv/Desktop/try/bash/play.sh

unpack(){


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
        elif [[ $(file $i | awk '{print $2}') == "Zip" ]]; then 
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
            # echo $i was skipped
        fi
    done

}

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
    elif  [[ $ARG = "-r" || $ARG = "--recursive" ]]; then
        recursion
    elif  [[ $ARG = "-a" || $ARG = "--all" ]]; then
        for i in *; do
            unpacking
        done
    fi
done

for ARG in "$@"; do
    if [[ $ARG = "-v" || $ARG = "--verbose" ]]; then
        echo "Decompressed $counter file(s)..."
        echo "$notarchives file(s) was skipped..."
    fi
done

}