#!/bin/bash

# Usage: ./push-all.sh [-f] [filter] [remote_name]
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

if [ "$1" = "-f" ]; then
   FORCE="-f"
   shift
else
   FORCE=""
fi

if [ \! -z "$1" ]; then
    FILTER="$1"
else
    FILTER=".*"
fi

REMOTE_NAME="$2"

find -maxdepth 3 -mindepth 1 -type d -name ".git" | grep "$FILTER" | while read repo; do
    pushd . >/dev/null
    cd "$repo/.."
    echo -e '\E[37;44m'"\033[1m>>> `pwd`\033[0m"
    git local-push-all $FORCE "$REMOTE_NAME"
    git push --tags -f "$REMOTE_NAME"
    popd >/dev/null
done
