#!/bin/bash

file="extracted/uttk_spk_text.tsv"
mkdir -p train test dev
mkdir -p localdata
i=0
while IFS= read line
do
    utt_id=$(echo "$line" | cut -f1)
    spk_id=$(echo "$line" | cut -f2)
    transcript=$(echo "$line" | cut -f3)
    file_path=$(extracted/$utt_id.wav)
    if [ $i -eq 0 ] 
    then
        echo "$utt_id $transcript" >> localdata/train/trans.txt
        echo "$utt_id $file_path" >> localdata/train/wav.scp
        echo "$utt_id $spk_id" >> localdata/train/utt2spk

    elif [ $i -eq 1 ]
    then
        echo "$utt_id $transcript" >> localdata/dev/trans.txt
        echo "$utt_id $file_path" >> localdata/dev/wav.scp
        echo "$utt_id $spk_id" >> localdata/dev/utt2spk
    elif [ $i -eq 2 ]
    then
        echo "$utt_id $transcript" >> localdata/test/trans.txt
        echo "$utt_id $file_path" >> localdata/test/wav.scp
        echo "$utt_id $spk_id" >> localdata/test/utt2spk
    elif [ $i -eq 3 ]
    then
        echo "$utt_id $transcript" >> localdata/train/trans.txt
        echo "$utt_id $file_path" >> localdata/train/wav.scp
        echo "$utt_id $spk_id" >> localdata/train/utt2spk
    elif [ $i -eq 4 ]
    then
        echo "$utt_id $transcript" >> localdata/train/trans.txt
        echo "$utt_id $file_path" >> localdata/train/wav.scp
        echo "$utt_id $spk_id" >> localdata/train/utt2spk
    fi
done < "$file"


