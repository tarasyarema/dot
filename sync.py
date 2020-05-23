import os
import shlex
import subprocess
import sys
import logging as log
from json import loads

# from ntpath import basename

log.basicConfig(format='%(levelname)s: %(message)s', level=log.DEBUG)

CONFIG = None
PLAT = sys.platform


def sync():
    files = CONFIG.get("files")
    paths = CONFIG.get("paths")

    for f in files:
        log.info(f)

        if PLAT == "win32" or PLAT == "darwin":
            cp = "copy"
        else:
            cp = "cp"

        target = paths[f]

        # Backup old possible files
        cmd = f"{cp} {target} {target}.bak"

        try:
            subprocess.run(cmd,
                           shell=True,
                           check=False,
                           stdout=subprocess.DEVNULL,
                           stderr=subprocess.DEVNULL
                           )
        except Exception as e:
            log.error(f"could not execute backup '{cmd}': {e}")
            sys.exit(1)

        cmd = f"{cp} {f} {target}"

        try:
            subprocess.run(cmd, shell=True, check=True)
        except Exception as e:
            log.error(f"could not execute cp '{cmd}': {e}")
            sys.exit(1)

    log.info(f"OK")


if __name__ == "__main__":
    try:
        config = loads(open("config.json", "r").read())
    except Exception as e:
        log.error(f"could not load 'config.json': {e}")
        sys.exit(1)

    CONFIG = config

    files = CONFIG.get("files")
    paths = CONFIG.get("paths")

    # Check format config.json is correct

    try:
        assert files is not None, \
            "should have 'files' attribute"
        assert type(files) == list, \
            "attribute 'files' should be a list"

        assert paths is not None, \
            "should have 'paths' attribute"
        assert type(paths) == dict, \
            "attribute 'paths' should be a dict"

        for f in files:
            assert paths.get(f) is not None, \
                f"file '{f}' does not have a path"
    except Exception as e:
        log.error(f"format error of 'config.json': {e}")
        sys.exit(1)

    sync()

    sys.exit(0)
