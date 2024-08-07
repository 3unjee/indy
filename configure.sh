#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets/indy"

extra="$assets/../extra/indy"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

exists()
{
    ls "$1" 1> /dev/null 2>&1
}

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

    source="$assets/$1"

    echo "$source"

    path="$PWD/$1"

    cp "$source"/*.mp4 "$path"

    source="$assets/$1/ambient"

    echo "$source"

    path="$PWD/$1/ambient"

    cp "$source"/*.mp4 "$path"

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

if [ $1 = "screens" ]; then

    source="$assets/$1/data"

    echo "$source"

    path="$PWD/dist/$1/data"

    cp "$source"/*.psd "$path"

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Trailer
#--------------------------------------------------------------------------------------------------

if [ $1 = "trailer" ]; then

    source="$assets/$1/content"

    echo "$source"

    path="$PWD/dist/$1/content"

    cp "$source"/*.mp4 "$path"

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Characters
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy" ]; then

    source="$assets/$1/data/voice"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/voice"

        cp "$source"/*.webm "$path"
    fi

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Rooms
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/intro" -o \
     $1 = "room/attic" ]; then

    source="$assets/$1/data"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data"

        cp "$source"/*.psd "$path"
        cp "$source"/*.png "$path"
    fi

    source="$assets/$1/data/upscale"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/upscale"

        cp "$source"/*.jpeg "$path"
    fi

    source="$assets/$1/data/upscale/base"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/upscale/base"

        cp "$source"/*.png "$path"
    fi

    source="$assets/$1/data/video"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/video"

        cp "$source"/*.mp4 "$path"
    fi

    source="$assets/$1/data/video/base"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/video/base"

        cp "$source"/*.mp4 "$path"
    fi

    source="$assets/$1/data/video/sync"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/video/sync"

        cp "$source"/*.mp4 "$path"
    fi

    source="$assets/$1/data/voice"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/voice"

        cp "$source"/*.mp3 "$path"
    fi

    source="$assets/$1/content"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content"

        cp "$source"/*.png "$path"
        cp "$source"/*.mp4 "$path"

        if exists "$source"/*.jpg; then

            cp "$source"/*.jpg "$path"
        fi
    fi

    source="$assets/$1/content/audio"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/audio"

        cp "$source"/*.mp3 "$path"
    fi

    source="$assets/$1/content/voice"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/voice"

        cp "$source"/*.mp3 "$path"
    fi

    source="$extra/$1/music"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/music/extra"

        cp "$source"/*.webm "$path"
    fi
fi
