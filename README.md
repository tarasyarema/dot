# dot

> Work in progress.

## usage

Imagine that the folder `config/` is your `~` in your machine.
Put all your config there, and then run `./sync.sh`.

The usage is

```bash
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

```

Some notes:

> Pass the flags separate, i.e. `-r -f`, not like `-rf`.

> The script will make symbolic links. 

Check the current structure of the `config/` folder to understand how it works.

## ideas

Check [idea.md](./idea.md) for progress information.

