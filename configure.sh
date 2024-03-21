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
fi

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

if [ $1 = "screens" ]; then

    path="$PWD/dist/screens/data"

    cp "$screens"/data/*.psd "$path"
fi

#--------------------------------------------------------------------------------------------------
# Trailer
#--------------------------------------------------------------------------------------------------

if [ $1 = "trailer" ]; then

    path="$PWD/dist/trailer/content"

    cp "$trailer"/content/*.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Character indy
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy" ]; then

    path="$PWD/dist/character/indy/data/voice"

    cp "$indy"/data/voice/*.webm "$path"
fi

#--------------------------------------------------------------------------------------------------
# Room intro
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/intro" ]; then

    path="$PWD/dist/room/intro/data"
    mkdir -p "$path"

    cp "$intro"/data/*.psd "$path"
    cp "$intro"/data/*.png "$path"

    path="$PWD/dist/room/intro/content"

    cp "$intro"/content/*.png "$path"
    cp "$intro"/content/*.jpg "$path"
    cp "$intro"/content/*.mp4 "$path"

    path="$PWD/dist/room/intro/content/music/extra"

    cp "$extra"/intro/music/*.webm "$path"
fi

#--------------------------------------------------------------------------------------------------
# Room attic
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/attic" ]; then

    path="$PWD/dist/room/attic/reference"

    cp "$attic"/reference/*.psd "$path"

    path="$PWD/dist/room/attic/data"

    cp "$attic"/data/*.psd "$path"
    cp "$attic"/data/*.png "$path"

    path="$PWD/dist/room/attic/data/upscale"

    cp "$attic"/data/upscale/*.jpeg "$path"

    path="$PWD/dist/room/attic/data/upscale/base"

    cp "$attic"/data/upscale/base/*.png "$path"

    path="$PWD/dist/room/attic/content"

    cp "$attic"/content/*.png "$path"
    cp "$attic"/content/*.mp4 "$path"

    path="$PWD/dist/room/attic/content/audio"

    cp "$attic"/content/audio/*.mp3 "$path"

    path="$PWD/dist/room/attic/content/music/extra"

    cp "$extra"/attic/music/*.webm "$path"

    path="$PWD/dist/room/attic/content/voice"

    cp "$attic"/content/voice/*.mp3 "$path"
fi
