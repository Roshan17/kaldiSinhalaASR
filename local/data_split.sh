#!/bin/bash

every_n=1

[ -f path.sh ] && . ./path.sh # source the path
. utils/parse_options.sh || exit 1; #exit at a error

# $# number of arguments (positional parameters) passed
if [[ $# -ne 4 ]]; then
	echo "Usage: local/data_splt.sh [--every-n 30] <data-directory> <local-directory> <LMs> <Test-Sets> <tgt-dir>";
	exit 1;
fi

# shift process arguments one by one
DATA=$1; shift       #data folder
locdata=$2; shift    #lang_prep/local folder
LMs=$1; shift		 #build0 and build1 
test_sets=$1; shift  #dev
tgt_dir=$1; shift	 #test

echo "LMS $LMs test_sets $test_sets"

echo "=== Starting Intitial Data Preparation ..."
echo "---Making test/train data split from $Data taking $every_n recording..."

mkdir -p $locdata

i=0
for s in $test_sets train ; do
	mkdir $locdata/$s
	