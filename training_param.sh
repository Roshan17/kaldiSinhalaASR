#!/bin/bash

# every N uttetrence is used to training
export EVERY_N=1
export TEST_SETS="dev test"


#Directories setup
export DATA_ROOT=`pwd`/data # expects subdirectories train + $TEST_SETS
export WORK=`pwd`/lang_prep
export EXP=`pwd`/export
export TGT_MODELS=trained_models

# Specify paths to arpa models. Paths may not contain spaces
export LMs="build0 build2"

#use path to prebuild dictionary or 'build' command in order to build dictionary
export DICTIONARY="build"

# Borders for estimating LM model weight
# LMW is tuned on development set and applied test set
export min_lmw=9
export max_lmw=20

# Number of states for phonem training
export pdf=1200

# Maximium number of Gaussians used for training
export gauss=19200

export train_mmi_boost=0.05

export mmi_beam=16.0
export mmi_lat_beam=10.0

#--fake -> NO CMVN; empty -> CMVN (pykaldi decoders can handle CMVN -> fake)
export fake="--fake"

