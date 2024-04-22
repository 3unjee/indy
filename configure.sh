#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets/indy"

extra="$assets/../extra/indy"

deploy="$assets/deploy"

screens="$assets/screens"
trailer="$assets/trailer"

indy="$assets/character/indy"

intro="$assets/room/intro"
attic="$assets/room/attic"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

exists() { ls "$1" 1> /dev/null 2>&1 }

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] || [ $1 != "all"            -a \
                    $1 != "deploy"         -a \
                    $1 != "screens"        -a \
                    $1 != "trailer"        -a \
                    $1 != "character/indy" -a \
                    $1 != "room/intro"     -a \
                    $1 != "room/attic" ]; then

    echo "Usage: configure <all>"
    echo "                 <deploy>"
    echo "                 <screens>"
    echo "                 <trailer>"
    echo "                 <character/indy>"
    echo "                 <room/intro>"
    echo "                 <room/attic>"

    exit 1
fi

read -p "Run configure for $1 ? (yes/no) " REPLY

if [ "$REPLY" != "yes" ]; then exit 1; fi

#--------------------------------------------------------------------------------------------------
# All
#--------------------------------------------------------------------------------------------------

if [ $1 = "all" ]; then

    sh configure.sh deploy
    sh configure.sh screens
    sh configure.sh trailer
    sh configure.sh character/indy
    sh configure.sh room/intro
    sh configure.sh room/attic

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Deploy
#--------------------------------------------------------------------------------------------------

if [ $1 = "deploy" ]; then

    path="$PWD/deploy"

    cp "$deploy"/*.mp4 "$path"

    path="$PWD/deploy/ambient"

    cp "$deploy"/ambient/*.mp4 "$path"

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

if [ $1 = "screens" ]; then

    path="$PWD/dist/screens/data"

    cp "$screens"/data/*.psd "$path"

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Trailer
#--------------------------------------------------------------------------------------------------

if [ $1 = "trailer" ]; then

    path="$PWD/dist/trailer/content"

    cp "$trailer"/content/*.mp4 "$path"

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Characters
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy" ]; then

    source="$assets/$1/data/voice"

    path="$PWD/dist/$1/data/voice"

    cp "$source"/*.webm "$path"

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Rooms
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/intro" -o
     $1 = "room/attic" ]; then

    source="$assets/$1/data"

    path="$PWD/dist/$1/data"

    cp "$source"/*.psd "$path"
    cp "$source"/*.png "$path"

    source="$assets/$1/data/upscale"

    if [ -d "$source" ]; then

        path="$PWD/dist/$1/data/upscale"

        cp "$source"/*.jpeg "$path"
    fi

    source="$assets/$1/data/upscale/base"

    if [ -d "$source" ]; then

        path="$PWD/dist/$1/data/upscale/base"

        cp "$source"/*.png "$path"
    fi

    source="$assets/$1/content"

    path="$PWD/dist/$1/content"

    cp "$source"/*.png "$path"
    cp "$source"/*.mp4 "$path"

    if exists "$source"/*.jpg; then

        cp "$source"/*.jpg "$path"
    fi

    source="$assets/$1/content/audio"

    if [ -d "$source" ]; then

        path="$PWD/dist/$1/content/audio"

        cp "$source"/*.mp3 "$path"
    fi

    source="$assets/$1/content/voice"

    if [ -d "$source" ]; then

        path="$PWD/dist/$1/content/voice"

        cp "$source"/*.mp3 "$path"
    fi

    source="$extra/$1/music"

    if [ -d "$source" ]; then

        path="$PWD/dist/$1/content/music/extra"

        cp "$source"/*.webm "$path"
    fi
fi
