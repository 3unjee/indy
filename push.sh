#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

# NOTE: Update this path with your own asset folder.
assets="/c/users/bunjee/OneDrive/assets/indy"

dist="$PWD/dist"

indy="$dist/character/indy"

intro="$dist/room/intro"
attic="$dist/room/attic"

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] \
   || \
   [ $1 != "character/indy" -a $1 != "room/intro" -a $1 != "room/attic" ]; then

    echo "Usage: push <character/indy>"
    echo "            <room/intro>"
    echo "            <room/attic>"

    exit 1
fi

read -p "Run push for $1 ? (yes/no) " REPLY

if [ "$REPLY" != "yes" ]; then exit 1; fi

#--------------------------------------------------------------------------------------------------
# Character indy
#--------------------------------------------------------------------------------------------------

if [ $1 = "character/indy" ]; then

    path="$assets/character/indy/reference/body"
    mkdir -p "$path"

    cp "$indy"/reference/body/indy.jpg "$path"

    path="$assets/character/indy/reference/neutral"
    mkdir -p "$path"

    cp "$indy"/reference/neutral/indy.jpg   "$path"
    cp "$indy"/reference/neutral/indy2.webp "$path"
    cp "$indy"/reference/neutral/indy3.png  "$path"

    path="$assets/character/indy/reference/neutral/base"
    mkdir -p "$path"

    cp "$indy"/reference/neutral/base/indy3.jpg "$path"

    path="$assets/character/indy/reference/surprised"
    mkdir -p "$path"

    cp "$indy"/reference/surprised/indy.png  "$path"
    cp "$indy"/reference/surprised/indy2.png "$path"

    path="$assets/character/indy/reference/surprised/base"
    mkdir -p "$path"

    cp "$indy"/reference/surprised/base/indy.jpg  "$path"
    cp "$indy"/reference/surprised/base/indy2.jpg "$path"

    path="$assets/character/indy/data/voice"
    mkdir -p "$path"

    cp "$indy"/data/voice/neutral.webm "$path"
fi

#--------------------------------------------------------------------------------------------------
# Room intro
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/intro" ]; then

    path="$assets/room/intro/content"
    mkdir -p "$path"

    cp "$intro"/content/intro.mp4     "$path"
    cp "$intro"/content/intro2.mp4    "$path"
    cp "$intro"/content/intro3.mp4    "$path"
    cp "$intro"/content/lucasarts.jpg "$path"
    cp "$intro"/content/title.png     "$path"
fi

#--------------------------------------------------------------------------------------------------
# Room attic
#--------------------------------------------------------------------------------------------------

if [ $1 = "room/attic" ]; then

    path="$assets/room/attic/reference"
    mkdir -p "$path"

    cp "$attic"/reference/attic.jpg   "$path"
    cp "$attic"/reference/splash.psd  "$path"
    cp "$attic"/reference/splash.png  "$path"
    cp "$attic"/reference/splash2.psd "$path"
    cp "$attic"/reference/splash2.png "$path"
    cp "$attic"/reference/splash3.psd "$path"
    cp "$attic"/reference/splash3.png "$path"

    path="$assets/room/attic/data"
    mkdir -p "$path"

    cp "$attic"/data/attic.psd  "$path"
    cp "$attic"/data/attic.png  "$path"
    cp "$attic"/data/attic2.psd "$path"

    cp "$attic"/data/indy.psd    "$path"
    cp "$attic"/data/indy.png    "$path"
    cp "$attic"/data/indy2.psd   "$path"
    cp "$attic"/data/indy2.png   "$path"
    cp "$attic"/data/indy3.psd   "$path"
    cp "$attic"/data/indy3.png   "$path"
    cp "$attic"/data/indy3.psd   "$path"
    cp "$attic"/data/indy4.png   "$path"
    cp "$attic"/data/indy5.png   "$path"
    cp "$attic"/data/splash.psd  "$path"
    cp "$attic"/data/splash2.psd "$path"
    cp "$attic"/data/splash3.psd "$path"

    path="$assets/room/attic/data/upscale"
    mkdir -p "$path"

    cp "$attic"/data/upscale/attic.jpeg "$path"
    cp "$attic"/data/upscale/indy.jpeg  "$path"
    cp "$attic"/data/upscale/indy2.jpeg "$path"

    path="$assets/room/attic/content"
    mkdir -p "$path"

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

    path="$assets/room/attic/content/audio"
    mkdir -p "$path"

    cp "$attic"/content/audio/splash.mp3 "$path"

    path="$assets/room/attic/content/music"
    mkdir -p "$path"

    cp "$attic"/content/music/attic.webm "$path"

    path="$assets/room/attic/content/voice"
    mkdir -p "$path"

    cp "$attic"/content/voice/attic.mp3  "$path"
    cp "$attic"/content/voice/attic2.mp3 "$path"
    cp "$attic"/content/voice/attic3.mp3 "$path"
fi
