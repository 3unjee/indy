#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

# NOTE: Update this path with your own asset folder.
assets="/c/users/bunjee/OneDrive/assets/indy"

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

    cp "$deploy"/intro.mp4    "$path"
    cp "$deploy"/attic.mp4    "$path"
    cp "$deploy"/attic2.mp4   "$path"
    cp "$deploy"/trailer.mp4  "$path"
    cp "$deploy"/trailer2.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

if [ $1 = "screens" ]; then

    path="$PWD/dist/screens/data"

    cp "$screens"/data/screen.psd "$path"
fi

#--------------------------------------------------------------------------------------------------
# Trailer
#--------------------------------------------------------------------------------------------------

if [ $1 = "trailer" ]; then

    path="$PWD/dist/trailer/content"

    cp "$trailer"/content/indy.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# Character indy
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy" ]; then

    path="$PWD/dist/character/indy/data/voice"

    cp "$indy"/data/voice/neutral.webm "$path"
fi

#--------------------------------------------------------------------------------------------------
# Room intro
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/intro" ]; then

    path="$PWD/dist/room/intro/data"
    mkdir -p "$path"

    cp "$intro"/data/intro.psd "$path"
    cp "$intro"/data/intro.png "$path"

    path="$PWD/dist/room/intro/content"

    cp "$intro"/content/intro.mp4     "$path"
    cp "$intro"/content/intro2.mp4    "$path"
    cp "$intro"/content/intro3.mp4    "$path"
    cp "$intro"/content/intro.png     "$path"
    cp "$intro"/content/lucasarts.jpg "$path"
    cp "$intro"/content/title.png     "$path"

    path="$PWD/dist/room/intro/content/music"

    cp "$intro"/content/music/intro.webm  "$path"
    cp "$intro"/content/music/splash.webm "$path"
fi

#--------------------------------------------------------------------------------------------------
# Room attic
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/attic" ]; then

    path="$PWD/dist/room/attic/reference"

    cp "$attic"/reference/splash.psd  "$path"
    cp "$attic"/reference/splash2.psd "$path"
    cp "$attic"/reference/splash3.psd "$path"

    path="$PWD/dist/room/attic/data"

    cp "$attic"/data/attic.psd  "$path"
    cp "$attic"/data/attic.png  "$path"
    cp "$attic"/data/attic2.psd "$path"
    cp "$attic"/data/attic3.psd "$path"
    cp "$attic"/data/attic4.psd "$path"
    cp "$attic"/data/attic4.png "$path"

    cp "$attic"/data/indy.psd    "$path"
    cp "$attic"/data/indy.png    "$path"
    cp "$attic"/data/indy2.psd   "$path"
    cp "$attic"/data/indy2.png   "$path"
    cp "$attic"/data/indy3.psd   "$path"
    cp "$attic"/data/indy3.png   "$path"
    cp "$attic"/data/indy4.psd   "$path"
    cp "$attic"/data/indy4.png   "$path"
    cp "$attic"/data/indy5.png   "$path"
    cp "$attic"/data/splash.psd  "$path"
    cp "$attic"/data/splash2.psd "$path"
    cp "$attic"/data/splash3.psd "$path"

    path="$PWD/dist/room/attic/data/upscale"

    cp "$attic"/data/upscale/attic.jpeg "$path"
    cp "$attic"/data/upscale/indy.jpeg  "$path"
    cp "$attic"/data/upscale/indy2.jpeg "$path"

    path="$PWD/dist/room/attic/data/upscale/base"

    cp "$attic"/data/upscale/base/attic4.png "$path"

    path="$PWD/dist/room/attic/content"

    cp "$attic"/content/attic.mp4   "$path"
    cp "$attic"/content/attic.png   "$path"
    cp "$attic"/content/attic2.mp4  "$path"
    cp "$attic"/content/attic2.png  "$path"
    cp "$attic"/content/attic3.mp4  "$path"
    cp "$attic"/content/attic4.mp4  "$path"
    cp "$attic"/content/indy2.mp4   "$path"
    cp "$attic"/content/indy3.png   "$path"
    cp "$attic"/content/splash.png  "$path"
    cp "$attic"/content/splash.mp4  "$path"
    cp "$attic"/content/splash2.png "$path"
    cp "$attic"/content/splash2.mp4 "$path"
    cp "$attic"/content/splash3.png "$path"

    path="$PWD/dist/room/attic/content/audio"

    cp "$attic"/content/audio/splash.mp3 "$path"

    path="$PWD/dist/room/attic/content/music"

    cp "$attic"/content/music/attic.webm "$path"

    path="$PWD/dist/room/attic/content/voice"

    cp "$attic"/content/voice/attic.mp3  "$path"
    cp "$attic"/content/voice/attic2.mp3 "$path"
    cp "$attic"/content/voice/attic3.mp3 "$path"
fi
