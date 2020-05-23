#!/bin/bash

usage() {
    cat - >&2 <<EOF
NAME
    sync.sh - Syncs your dot files :3

SYNOPSIS
    program-name.sh [-h|--help]
    program-name.sh [-r|--remove]
		    [-f|--fetch]

OPTIONS
    -h, --help
	    Prints this and exits

    -r, --remove
	    Removes all old files in the process of syncing.
	    By default, it will backup the files with the
	    following format
		{file_name}.dot.bak

    -f, --fetch
	  Calls git pull origin master for the dot repo.

EOF
}

remove=0
fetch=0

# https://stackoverflow.com/a/33826763/4468167

while [[ "$#" -gt 0 ]]; do
    case $1 in
	-h|--help) usage ; exit 0 ;;
	-r|--remove) remove=1 ;;
	-f|--fetch) fetch=1 ;;
	*) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

if [[ $fetch -eq 1 ]]; then
    git pull origin master
fi

sync () {
    # If there's a existing file backup it

    if [[ -f $2 ]]; then
	case $remove in
	    0) mv $2 $2.dot.bak ;;
	    1) rm $2 ;;
	esac
    fi

    # Make a symbolic link between the repo file 
    # and the target one

    echo "ln -s $(readlink -f $1) $2"
    # ln -vs $(readlink -f $1) $2
}

pushd config

for file in $(find -type f); do
    name=$(basename -- $file)
    dir=${file:2}

    target="~/$dir"

    echo "$file -> $target"
done

popd 

exit 0

