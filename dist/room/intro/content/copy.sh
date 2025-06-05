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

    restore "$temp"      "$upscale"
    restore "$temp/wide" "$upscale/wide"
else
    move "$upscale"      "$temp"
    move "$upscale/wide" "$temp/wide"

    #----------------------------------------------------------------------------------------------
    # NOTE: copied from upscale.sh

    run "intro.mp4"    iris-3
    run "intro2.mp4"   iris-3
    run "intro3.mp4"   iris-3 letterbox
    run "college.mp4"  iris-3
    run "college2.mp4" iris-3
    run "college3.mp4" iris-3

    run "wide/intro.mp4"    iris-3 default 5110
    run "wide/intro2.mp4"   iris-3 default 5110
    run "wide/college.mp4"  iris-3 default 5110
    run "wide/college2.mp4" iris-3 default 5110
fi
