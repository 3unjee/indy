#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets/indy"

deploy="$PWD/deploy"
dist="$PWD/dist"

screens="$dist/screens"
trailer="$dist/trailer"

indy="$dist/character/indy"

intro="$dist/room/intro"
attic="$dist/room/attic"

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

    path="$assets/deploy"
    mkdir -p "$path"

    cp "$deploy"/*.mp4 "$path"

    path="$assets/deploy/ambient"
    mkdir -p "$path"

    cp "$deploy"/*.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

if [ $1 = "screens" ]; then

    path="$assets/screens/data"
    mkdir -p "$path"

    cp "$screens"/data/*.psd "$path"
fi

#--------------------------------------------------------------------------------------------------
# Trailer
#--------------------------------------------------------------------------------------------------

if [ $1 = "trailer" ]; then

    path="$assets/trailer/content"
    mkdir -p "$path"

    cp "$trailer"/content/*.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Character indy
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy" ]; then

    path="$assets/character/indy/data/voice"
    mkdir -p "$path"

    cp "$indy"/data/voice/*.webm "$path"
fi

#--------------------------------------------------------------------------------------------------
# Room intro
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/intro" ]; then

    path="$assets/room/intro/data"
    mkdir -p "$path"

    cp "$intro"/data/*.psd "$path"
    cp "$intro"/data/*.png "$path"

    path="$assets/room/intro/content"
    mkdir -p "$path"

    cp "$intro"/content/*.png "$path"
    cp "$intro"/content/*.jpg "$path"
    cp "$intro"/content/*.mp4 "$path"

    path="$assets/room/intro/content/music"
    mkdir -p "$path"

    cp "$intro"/content/music/*.webm "$path"
fi

#--------------------------------------------------------------------------------------------------
# Room attic
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/attic" ]; then

    path="$assets/room/attic/reference"
    mkdir -p "$path"

    cp "$attic"/reference/*.psd  "$path"

    path="$assets/room/attic/data"
    mkdir -p "$path"

    cp "$attic"/data/*.psd  "$path"
    cp "$attic"/data/*.png  "$path"

    path="$assets/room/attic/data/upscale"
    mkdir -p "$path"

    cp "$attic"/data/upscale/*.jpeg "$path"

    path="$assets/room/attic/data/upscale/base"
    mkdir -p "$path"

    cp "$attic"/data/upscale/base/*.png "$path"

    path="$assets/room/attic/content"
    mkdir -p "$path"

    cp "$attic"/content/*.png "$path"
    cp "$attic"/content/*.mp4 "$path"

    path="$assets/room/attic/content/audio"
    mkdir -p "$path"

    cp "$attic"/content/audio/*.mp3 "$path"

    path="$assets/room/attic/content/music"
    mkdir -p "$path"

    cp "$attic"/content/music/*.webm "$path"

    path="$assets/room/attic/content/voice"
    mkdir -p "$path"

    cp "$attic"/content/voice/*.mp3 "$path"
fi
