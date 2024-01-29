#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

# NOTE: Update this path with your own asset folder.
assets="/c/users/bunjee/OneDrive/assets/indy"

deploy="$PWD/deploy"
dist="$PWD/dist"

trailer="$dist/trailer"

indy="$dist/character/indy"

intro="$dist/room/intro"
attic="$dist/room/attic"

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] || [ $1 != "deploy"         -a \
                    $1 != "trailer"        -a \
                    $1 != "character/indy" -a \
                    $1 != "room/intro"     -a \
                    $1 != "room/attic" ]; then

    echo "Usage: configure <deploy>"
    echo "                 <trailer>"
    echo "                 <character/indy>"
    echo "                 <room/intro>"
    echo "                 <room/attic>"

    exit 1
fi

read -p "Run configure for $1 ? (yes/no) " REPLY

if [ "$REPLY" != "yes" ]; then exit 1; fi

#--------------------------------------------------------------------------------------------------
# Deploy
#--------------------------------------------------------------------------------------------------

if [ $1 = "deploy" ]; then

    path="$assets/deploy"

    cp "$path"/attic.mp4    "$deploy"
    cp "$path"/trailer.mp4  "$deploy"
    cp "$path"/trailer2.mp4 "$deploy"
fi
