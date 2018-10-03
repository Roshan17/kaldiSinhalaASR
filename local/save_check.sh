#! /bin/bash

EXP=$1 #exp Folder

# make sure that directories exists
#$@ all parameters given to script
conflict=""
for d in $@ ; do
	if [ -d $d ] || [ -f $d ]; then
		conflict="$conflict $d"
	fi
done

# -Z checks empty strings
if [[ ! -z "$conflict" ]]; then
	echo "Running new experimrnts will create following directories"
	echo "Some of them already exists!"
	echo ""
	echo "Existing directories"

	for d in $conflict ; do 
		echo " $d"
	done

	read -p "Sohuld I delete the conflicting directories NOW y/n?"
	case $REPLY in
		[Yy]* ) echo "Deleting $conflict directories"; rm -rf $conflict;;
		* ) echo 'Keeping conflicting directories and existing...'; exit 1;;
	esac
fi

for d in $@ ; do
	mkdir -p $d
done

# Save the variable set up
(set -o posix ; set ) > $EXP/experiment_bash_vars.log
# 