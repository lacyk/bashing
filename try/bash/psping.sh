#!/bin/bash

# add command < source [PATH_TO_SCRIPT] > to ./.bashrc file OR add this file without <.sh> into $PATH and give it executable permissions chmod +x <FILENAME>

# I added -f option that stands for <FILENAME>
# I know it's a little bit messy because of the repetition, I'm working on improving my skills

COUNT=100000000

while getopts ":c:t:u:f:" arg; do
    case $arg in
        c) COUNT=$OPTARG;;
        t) TIMER=$OPTARG;;
        u) USERNAME=$OPTARG;;
        f) FILENAME=$OPTARG;;
        \?) # Invalid option
        echo "Error: Invalid option"
        exit;;
    esac
done

if [ -z $FILENAME ] ; then 
    echo "Error: Filename expected"
    exit
fi

if [ $TIMER ] ; then
    if [ $USERNAME ] ; then
        echo "Pinging $FILENAME for $USERNAME . . ."
        while [ $TIMER -gt 0 ]; do
            check=`ps -e -u $USERNAME | grep "$FILENAME" | wc -l`
            ans=$(( check-3 ))
            echo "$FILENAME: $ans instance(s) . . ."
            TIMER=$((TIMER-1))
            sleep 1
        done
    elif [ -z $USERNAME ] ; then
        echo "Pinging $FILENAME for any user . . ."
        while [ $TIMER -gt 0 ]; do
            check=`ps -e | grep "$FILENAME" | wc -l`
            ans=$(( check-3 ))
            echo "$FILENAME: $ans instance(s) . . ."
            TIMER=$((TIMER-1))
            sleep 1
        done
    fi
elif [ -z $TIMER ] ; then
    if [ $USERNAME ] ; then
        echo "Pinging $FILENAME for $USERNAME . . ."
    while [ $COUNT -gt 0 ]; do
        check=`ps -e -u $USERNAME | grep "$FILENAME" | wc -l`
        ans=$(( check-3 ))
        echo "$FILENAME: $ans instance(s) . . ."
        COUNT=$((COUNT-1))
        sleep 1
    done
    elif [ -z $USERNAME ] ; then
        echo "Pinging $FILENAME for any user . . ."
    while [ $COUNT -gt 0 ]; do
        check=`ps -e | grep "$FILENAME" | wc -l`
        ans=$(( check-3 ))
        echo "$FILENAME: $ans instance(s) . . ."
        COUNT=$((COUNT-1))
        sleep 1
    done
    fi
fi