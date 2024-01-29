#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

# NOTE: Update this path with your own asset folder.
assets="/c/users/bunjee/OneDrive/assets/indy"

deploy="$assets/deploy"

trailer="$assets/trailer"

indy="$assets/character/indy"

intro="$assets/room/intro"
attic="$assets/room/attic"

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

    path="$PWD/deploy"

    cp "$deploy"/attic.mp4    "$path"
    cp "$deploy"/trailer.mp4  "$path"
    cp "$deploy"/trailer2.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Trailer
#--------------------------------------------------------------------------------------------------

if [ $1 = "trailer" ]; then

    path="$PWD/dist/trailer/content"

    cp "$trailer"/content/indy.mp4 "$path"
fi
