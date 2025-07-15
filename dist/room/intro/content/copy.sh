#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

upscale="$PWD/upscale"

temp="$upscale/temp"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    cp "$1" "$upscale/$1"
}

runWide()
{
    run "$1"
}

exists()
{
    ls "$1" 1> /dev/null 2>&1
}

move()
{
    if exists "$1"/*.mp4; then

        mv "$1"/*.mp4 "$2"
    fi
}

restore()
{
    if exists "$1"/*.mp4; then

        rm -f "$2"/*.mp4

        mv "$1"/*.mp4 "$2"
    fi
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

if [ "$1" = "restore" ]; then

    if ! exists "$temp"/*.mp4; then

        echo "The temp folder does not contain video files."

        exit 0
    fi

    restore "$temp"      "$upscale"
    restore "$temp/wide" "$upscale/wide"
else
    if exists "$temp"/*.mp4; then

        echo "The temp folder already contains video files."

        exit 0
    fi

    move "$upscale"      "$temp"
    move "$upscale/wide" "$temp/wide"

    #----------------------------------------------------------------------------------------------
    # BEGIN copy

    run "intro.mp4"    iris-3 48
    run "intro2.mp4"   iris-3 48
    run "intro3.mp4"   iris-3 48 letterbox
    run "college.mp4"  iris-3 60
    run "college2.mp4" iris-3 60
    run "college3.mp4" iris-3 60
    runWide "intro.mp4"      iris-3 48
    runWide "intro2.mp4"     iris-3 48
    runWide "college.mp4"    iris-3 60
    runWide "college2.mp4"   iris-3 60
    runWide "college3-1.mp4" iris-3 60
    runWide "college3-2.mp4" iris-3 60
fi
