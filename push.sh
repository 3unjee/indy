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
                    $1 != "room/attic" ]; then

    echo "Usage: push <deploy>"
    echo "            <screens>"
    echo "            <trailer>"
    echo "            <character/indy>"
    echo "            <room/intro>"
    echo "            <room/attic>"

    exit 1
fi

read -p "Run push for $1 ? (yes/no) " REPLY

if [ "$REPLY" != "yes" ]; then exit 1; fi

#--------------------------------------------------------------------------------------------------
# Deploy
#--------------------------------------------------------------------------------------------------

if [ $1 = "deploy" ]; then

    source="$PWD/$1"

    path="$assets/$1"
    mkdir -p "$path"

    cp "$source"/*.mp4 "$path"

    source="$PWD/$1/ambient"

    path="$assets/$1"
    mkdir -p "$path"

    cp "$source"/*.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

if [ $1 = "screens" ]; then

    source="$PWD/dist/$1/data"

    path="$assets/$1/data"
    mkdir -p "$path"

    cp "$source"/*.psd "$path"
fi

#--------------------------------------------------------------------------------------------------
# Trailer
#--------------------------------------------------------------------------------------------------

if [ $1 = "trailer" ]; then

    source="$PWD/dist/$1/content"

    path="$assets/$1/content"
    mkdir -p "$path"

    cp "$source"/*.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Characters
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy" ]; then

    source="$PWD/dist/$1/data/voice"

    path="$assets/$1/data/voice"
    mkdir -p "$path"

    cp "$source"/*.webm "$path"
fi

#--------------------------------------------------------------------------------------------------
# Rooms
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/intro" -o \
     $1 = "room/attic" ]; then

    source="$PWD/dist/$1/data"

    path="$assets/$1/data"
    mkdir -p "$path"

    cp "$source"/*.psd "$path"
    cp "$source"/*.png "$path"

    source="$PWD/dist/$1/data/upscale"

    if [ -d "$source" ]; then

        path="$assets/$1/data/upscale"
        mkdir -p "$path"

        cp "$source"/*.jpeg "$path"
    fi

    source="$PWD/dist/$1/data/upscale/base"

    if [ -d "$source" ]; then

        path="$assets/$1/data/upscale/base"
        mkdir -p "$path"

        cp "$source"/*.png "$path"
    fi

    source="$PWD/dist/$1/content"

    path="$assets/$1/content"
    mkdir -p "$path"

    cp "$source"/*.png "$path"
    cp "$source"/*.mp4 "$path"

    if exists "$source"/*.jpg; then

        cp "$source"/*.jpg "$path"
    fi

    source="$PWD/dist/$1/content/audio"

    if [ -d "$source" ]; then

        path="$assets/$1/content/audio"
        mkdir -p "$path"

        cp "$source"/*.mp3 "$path"
    fi

    source="$PWD/dist/$1/content/voice"

    if [ -d "$source" ]; then

        path="$assets/$1/content/voice"
        mkdir -p "$path"

        cp "$source"/*.mp3 "$path"
    fi
fi
