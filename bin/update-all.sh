#!/bin/bash

# Usage: ./update-all.sh [filter] [remote_name]
#
#   Fetches the provided remotes (or all) for every repository whose path
#   matches the provided filter.
#
#   filter allows to filter repository name, and the remote_name allows to
#   only fetch remotes by names.
#
#   If you need to update every repository by remote name, then use the dot
#   "." as the filter like in:
#
#       ./update-all.sh . upstream
#

if [ \! -z "$1" ]; then
    FILTER="$1"
else
    FILTER=".*"
fi

REMOTE_NAME="$2"

function get_upstream_repo {
   git remote -v | grep ^"$REMOTE_NAME" | grep "(fetch)$" | awk '{print $1}'
}

find -maxdepth 3 -mindepth 1 -type d -name ".git" | grep "$FILTER" | while read repo; do
    pushd . >/dev/null
    cd "$repo/.."
    echo ">>> `pwd`"
    STASHED=0
    if [ `git status --porcelain | grep -v ^? | wc -l` -gt 0 ]; then
	STASHED=1
	git stash
    fi
    CURRENT_BRANCH=`git branch | grep ^* | cut -b3-`
    (get_upstream_repo | while read remote; do
	git remote -v | grep ^"$remote" | grep "(fetch)$"
	git fetch "$remote"
	git pull --ff-only "$remote"
    done)
    if [  "$STASHED" -gt 0 ];  then
	git stash pop
    fi
    echo "<<<"
    popd >/dev/null
done
