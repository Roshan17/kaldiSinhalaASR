#!/bin/bash

#copyright Roshan Nadeesha
#This script is used to converting flac files to wav files after listing all audio files in sinhala data set.

#checking whether sox is installed
#command -v sox >/dev/null 2>&1 || { echo >&2 "I require sox but it's not installed.  Aborting."; exit 1; }
#type sox >/dev/null 2>&1 || { echo >&2 "I require sox but it's not installed.  Aborting."; exit 1; }
hash sox 2>/dev/null || { echo >&2 "I require sox but it's not installed.  Aborting."; exit 1; }


#list flac files in the directories converting them to wave files
main_directories=$(ls extracted)
mkdir -p final_data
for directory in $main_directories; do
    sub_directories=$(ls "extracted/$directory/data")
    for sub_directory in $sub_directories; do
        files=$(ls "$directory/data/$sub_directory")
        for file in $files; do
            basename="${file%.*}"
            sox file -r 16000 -c 1 -b 16 "final_data/$basename.wav"
        done
    done
done




    