#!/bin/bash

# Usage: ./push-all.sh [filter] [remote_name]
#
#   Pushes all repositories that match (in their paths) the filter to the
#   provided remote.  All local branches are tried to be pushed.  See
#   companion update-all.sh script.
#
#   filter allows to filter repository name, and the remote_name allows to
#   only fetch remotes by names.
#
#   If you need to push every repository by remote name, then use the dot "."
#   as the filter like in:
#
#       ./push-all.sh . upstream
#

if [ \! -z "$1" ]; then
    FILTER="$1"
else
    FILTER=".*"
fi

REMOTE_NAME="$2"

find -maxdepth 3 -mindepth 1 -type d -name ".git" | grep "$FILTER" | while read repo; do
    pushd . >/dev/null
    cd "$repo/.."
    echo ">>> `pwd`"
    git local-push-all "$REMOTE_NAME"
    popd >/dev/null
done