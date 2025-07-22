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

if [ $# != 1 -a $# != 2 ] \
   || \
   [ $1 != "all"              -a \
     $1 != "deploy"           -a \
     $1 != "screens"          -a \
     $1 != "movie"            -a \
     $1 != "trailer"          -a \
     $1 != "character/indy"   -a \
     $1 != "character/marcus" -a \
     $1 != "character/kerner" -a \
     $1 != "character/fritz"  -a \
     $1 != "room/intro"       -a \
     $1 != "room/attic"       -a \
     $1 != "room/attic2"      -a \
     $1 != "room/chase" ] \
   || \
   [ $# = 2 -a "$2" != "all" -a "$2" != "upscale" ]; then

    echo "Usage: configure <all>"
    echo "                 <deploy>"
    echo "                 <screens>"
    echo "                 <movie>"
    echo "                 <trailer>"
    echo "                 <character/indy>"
    echo "                 <character/marcus>"
    echo "                 <character/kerner>"
    echo "                 <character/fritz>"
    echo "                 <room/intro>"
    echo "                 <room/attic>"
    echo "                 <room/attic2>"
    echo "                 <room/chase>"
    echo "                 [all | upscale]"

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
    sh configure.sh character/marcus
    sh configure.sh character/kerner
    sh configure.sh character/fritz
    sh configure.sh room/intro
    sh configure.sh room/attic
    sh configure.sh room/attic2
    sh configure.sh room/chase

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

    source="$assets/$1/wide"

    echo "$source"

    path="$PWD/$1/wide"

    cp "$source"/*.mp4 "$path"

    source="$assets/$1/16-9"

    echo "$source"

    path="$PWD/$1/16-9"

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

    if exists "$source"/*.png; then

        cp "$source"/*.png "$path"
    fi

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Characters
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy"   -o \
     $1 = "character/marcus" -o \
     $1 = "character/kerner" -o \
     $1 = "character/fritz" ]; then

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

        if exists "$source"/*.webm; then

            cp "$source"/*.webm "$path"
        fi

        if exists "$source"/*.mp3; then

            cp "$source"/*.mp3 "$path"
        fi
    fi

    source="$assets/$1/data/voice/base"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/voice/base"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi

        if exists "$source"/*.webm; then

            cp "$source"/*.webm "$path"
        fi
    fi

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Rooms
#--------------------------------------------------------------------------------------------------

if [ $1 = "movie"       -o \
     $1 = "trailer"     -o \
     $1 = "room/intro"  -o \
     $1 = "room/attic"  -o \
     $1 = "room/attic2" -o \
     $1 = "room/chase" ] && [ "$2" != "upscale" ]; then

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

    source="$assets/$1/data/wide"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/wide"

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

    source="$assets/$1/data/upscale/jpg"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/upscale/jpg"

        if exists "$source"/*.jpg; then

            cp "$source"/*.jpg "$path"
        fi
    fi

    source="$assets/$1/data/upscale/upload"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/upscale/upload"

        if exists "$source"/*.jpg; then

            cp "$source"/*.jpg "$path"
        fi
    fi

    source="$assets/$1/data/video"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/data/video"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
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

        if exists "$source"/*.wav; then

            cp "$source"/*.wav "$path"
        fi

        if exists "$source"/*.mp3; then

            cp "$source"/*.mp3 "$path"
        fi
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

    source="$assets/$1/content/wide"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/wide"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
    fi

    source="$assets/$1/content/wide/base"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/wide/base"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
    fi

    source="$assets/$1/content/wide/fix"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content/wide/fix"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
    fi

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

        if exists "$source"/*.wav; then

            cp "$source"/*.wav "$path"
        fi

        if exists "$source"/*.mp3; then

            cp "$source"/*.mp3 "$path"
        fi
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

#--------------------------------------------------------------------------------------------------
# Upscale
#--------------------------------------------------------------------------------------------------

if [ "$2" = "all" -o "$2" = "upscale" ]; then

    source="$assets/$1/content/upscale"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
    fi

    source="$assets/$1/content/upscale/wide"

    if [ -d "$source" ]; then

        echo "$source"

        path="$PWD/dist/$1/content"

        if exists "$source"/*.mp4; then

            cp "$source"/*.mp4 "$path"
        fi
    fi
fi
