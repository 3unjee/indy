#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

upscale="$PWD/upscale"

upscaleWide="$upscale/wide"

temp="$upscale/temp"

tempWide="$upscale/temp/wide"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    cp "$1" "$upscale/$1"
}

exists()
{
    ls "$1" 1> /dev/null 2>&1
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

if [ "$1" = "restore" ]; then

    rm -f "$upscale"/*.mp4
    rm -f "$upscaleWide"/*.mp4

    mv "$temp"/*.mp4     "$upscale"
    mv "$tempWide"/*.mp4 "$upscaleWide"
else
    if exists "$upscale"/*.mp4; then

        mv "$upscale"/*.mp4 "$temp"
    fi

    if exists "$upscaleWide"/*.mp4; then

        mv "$upscaleWide"/*.mp4 "$tempWide"
    fi

    run "intro.mp4"    iris-3
    run "intro2.mp4"   iris-3
    run "intro3.mp4"   iris-3 letterbox
    run "college.mp4"  iris-3
    run "college2.mp4" iris-3
    run "college3.mp4" iris-3

    run "wide/college.mp4" iris-3 default 5110
fi
