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
                    $1 != "movie"          -a \
                    $1 != "trailer"        -a \
                    $1 != "character/indy" -a \
                    $1 != "room/intro"     -a \
                    $1 != "room/attic"     -a \
                    $1 != "room/attic2"    -a \
                    $1 != "room/chase" ]; then

    echo "Usage: configure <all>"
    echo "                 <deploy>"
    echo "                 <screens>"
    echo "                 <movie>"
    echo "                 <trailer>"
    echo "                 <character/indy>"
    echo "                 <room/intro>"
    echo "                 <room/attic>"
    echo "                 <room/attic2>"
    echo "                 <room/chase>"

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
    sh configure.sh movie
    sh configure.sh trailer
    sh configure.sh character/indy
    sh configure.sh room/intro
    sh configure.sh room/attic
    sh configure.sh room/attic2

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

if [ $1 = "movie" -o \
     $1 = "trailer" ]; then

    source="$assets/$1/content"

    echo "$source"

    path="$PWD/dist/$1/content"

    cp "$source"/*.mp4 "$path"

    source="$assets/$1/reference"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/reference"

        if exists "$source"/*.png; then

            cp "$source"/*.png "$path"
        fi
    fi

    source="$extra/$1"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/extra"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
    fi

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Characters
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy" ]; then

    source="$assets/$1/data"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data"

        if exists "$source"/*.psd; then

            cp "$source"/*.psd "$path"
        fi
    fi

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
     $1 = "room/attic" -o \
     $1 = "room/attic2" -o \
     $1 = "room/chase" ]; then

    source="$assets/$1/data"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data"

        if exists "$source"/*.kra; then

            cp "$source"/*.kra "$path"
        fi

        if exists "$source"/*.psd; then

            cp "$source"/*.psd "$path"
        fi

        if exists "$source"/*.png; then

            cp "$source"/*.png "$path"
        fi
    fi

    source="$assets/$1/data/upscale"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/upscale"

        if exists "$source"/*.png; then

            cp "$source"/*.png "$path"
        fi

        if exists "$source"/*.jpeg; then

            cp "$source"/*.jpeg "$path"
        fi
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

        cp "$source"/*.mp4 "$path"

        if exists "$source"/*.png; then

            cp "$source"/*.png "$path"
        fi

        if exists "$source"/*.jpg; then

            cp "$source"/*.jpg "$path"
        fi
    fi

    # NOTE: These are generated by Topaz.
#    source="$assets/$1/content/upscale"

#    if [ -d "$source" ]; then

#        echo "$source"

#        path="$PWD/dist/$1/content"

#        if exists "$source"/*.mp4; then

#            cp "$source"/*.mp4 "$path"
#        fi
#    fi

    source="$assets/$1/content/audio"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/audio"

        cp "$source"/*.mp3 "$path"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
    fi

    source="$assets/$1/content/voice"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/voice"

        cp "$source"/*.mp3 "$path"
    fi

    source="$assets/$1/content/music"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/music"

        if exists "$source"/*.webm; then

            cp "$source"/*.webm "$path"
        fi
    fi

    source="$extra/$1/music"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/music/extra"

        cp "$source"/*.webm "$path"
    fi
fi
