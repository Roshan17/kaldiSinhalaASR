#!/bin/bash

#copyright (c) Roshan Nadeesha 2018
#20% of data for test
#20% of data for dev
#60% of data for training

mkdir -p test dev train

files=$(ls final_data)
i=1
for file in $files; do
    if [ $i -eq 1 ]
    then
        ln -s final_data/$file train
        ((i++))
    elif [ $i -eq 2 ] 
    then
        ln -s final_data/$file dev
        ((i++))
    elif [ $i -eq 3 ]
    then
        ln -s final_data/$file test
        ((i++))
    elif [ $i -eq 4 ]
    then
        ln -s final_data/$file train
        ((i++))
    elif [ $i -eq 5 ]
    then
        ln -s final_data/$file train
        ((i=1))
    fi
done
