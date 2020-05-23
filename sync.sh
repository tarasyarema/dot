#!/bin/bash

usage() {
    cat - >&2 <<EOF
NAME
    sync.sh - Syncs your dot files :3

SYNOPSIS
    sync.sh [-h|--help]
    sync.sh [-r|--remove]
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

if [[ $fetch -eq 1 ]]; then
    git pull origin master
fi

sync () {
    if [[ -f $2 ]]; then
	case $remove in
	    0) mv $2 $2.dot.bak ;;
	    1) rm $2 ;;
	esac
    else
	touch $2
    fi

    ln -rvs $1 $2
}
    
for file in $(find config -type f); do
    name=$(basename -- $file)
    dir=${file:7}

    target=~/$dir

    sync $file $target
done

exit 0

