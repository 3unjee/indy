#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets/indy"

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

if [ $# != 1 ] || [ $1 != "deploy"         -a \
                    $1 != "screens"        -a \
                    $1 != "trailer"        -a \
                    $1 != "character/indy" -a \
                    $1 != "room/intro"     -a \
                    $1 != "room/attic"     -a \
                    $1 != "room/attic2" ]; then

    echo "Usage: push <deploy>"
    echo "            <screens>"
    echo "            <trailer>"
    echo "            <character/indy>"
    echo "            <room/intro>"
    echo "            <room/attic>"
    echo "            <room/attic2>"

    exit 1
fi

read -p "Run push for $1 ? (yes/no) " REPLY

if [ "$REPLY" != "yes" ]; then exit 1; fi

#--------------------------------------------------------------------------------------------------
# Deploy
#--------------------------------------------------------------------------------------------------

if [ $1 = "deploy" ]; then

    source="$PWD/$1"

    echo "$source"

    path="$assets/$1"
    mkdir -p "$path"

    cp "$source"/*.mp4 "$path"

    source="$PWD/$1/ambient"

    path="$assets/$1/ambient"
    mkdir -p "$path"

    cp "$source"/*.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

if [ $1 = "screens" ]; then

    source="$PWD/dist/$1/data"

    echo "$source"

    path="$assets/$1/data"
    mkdir -p "$path"

    cp "$source"/*.psd "$path"
fi

#--------------------------------------------------------------------------------------------------
# Trailer
#--------------------------------------------------------------------------------------------------

if [ $1 = "trailer" ]; then

    source="$PWD/dist/$1/content"

    echo "$source"

    path="$assets/$1/content"
    mkdir -p "$path"

    cp "$source"/*.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Characters
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy" ]; then

    source="$PWD/dist/$1/data"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/data"
        mkdir -p "$path"

        cp "$source"/*.psd "$path"
    fi

    source="$PWD/dist/$1/data/voice"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/data/voice"
        mkdir -p "$path"

        cp "$source"/*.webm "$path"
    fi
fi

#--------------------------------------------------------------------------------------------------
# Rooms
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/intro" -o \
     $1 = "room/attic" -o \
     $1 = "room/attic2" ]; then

    source="$PWD/dist/$1/data"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/data"
        mkdir -p "$path"

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

    source="$PWD/dist/$1/data/upscale"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/data/upscale"
        mkdir -p "$path"

        if exists "$source"/*.jpeg; then

            cp "$source"/*.jpeg "$path"
        fi
    fi

    source="$PWD/dist/$1/data/upscale/base"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/data/upscale/base"
        mkdir -p "$path"

        cp "$source"/*.png "$path"
    fi

    source="$PWD/dist/$1/data/video"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/data/video"
        mkdir -p "$path"

        cp "$source"/*.mp4 "$path"
    fi

    source="$PWD/dist/$1/data/video/base"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/data/video/base"
        mkdir -p "$path"

        cp "$source"/*.mp4 "$path"
    fi

    source="$PWD/dist/$1/data/video/sync"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/data/video/sync"
        mkdir -p "$path"

        cp "$source"/*.mp4 "$path"
    fi

    source="$PWD/dist/$1/data/voice"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/data/voice"
        mkdir -p "$path"

        cp "$source"/*.mp3 "$path"
    fi

    source="$PWD/dist/$1/content"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/content"
        mkdir -p "$path"

        cp "$source"/*.mp4 "$path"

        if exists "$source"/*.png; then

            cp "$source"/*.png "$path"
        fi

        if exists "$source"/*.jpg; then

            cp "$source"/*.jpg "$path"
        fi
    fi

    source="$PWD/dist/$1/content/upscale"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/content"
        mkdir -p "$path"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
    fi

    source="$PWD/dist/$1/content/audio"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/content/audio"
        mkdir -p "$path"

        cp "$source"/*.mp3 "$path"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
    fi

    source="$PWD/dist/$1/content/voice"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/content/voice"
        mkdir -p "$path"

        cp "$source"/*.mp3 "$path"
    fi

    source="$PWD/dist/$1/content/music"

    if [ -d "$source" ]; then

        echo "$source"

        path="$assets/$1/content/music"
        mkdir -p "$path"

        if exists "$source"/*.webm; then

            cp "$source"/*.webm "$path"
        fi
    fi
fi
