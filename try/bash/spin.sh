#!/bin/bash

spinner=( '|' '/' '-' '\' )
# spinner=( Ooooo oOooo ooOoo oooOo ooooO )

copy(){
    echo Coping files...
    spin &
    pid=$!
    for i in ` seq 1 5 `
    do 
        sleep 1 
    done

    kill $pid
    echo ""
}

spin(){
    while [ 1 ]
    do
        for i in "${spinner[@]}"; do
            echo -ne "\r$i"
            sleep 0.5
        done
    done
}

copy


