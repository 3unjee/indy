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
    cp "$1" "$upscale"
}

exists()
{
    ls "$1" 1> /dev/null 2>&1
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

if [ "$1" = "restore" ]; then

    if exists "$temp"/*.mp4; then

        rm -f "$upscale"/*.mp4

        mv "$temp"/*.mp4 "$upscale"
    fi
else
    if exists "$upscale"/*.mp4; then

        mv "$upscale"/*.mp4 "$temp"
    fi

    run "attic.mp4"     iris-3
    run "attic2.mp4"    iris-3
    run "attic5.mp4"    iris-3
    run "attic6.mp4"    iris-3
    run "attic7.mp4"    iris-3
    run "attic8.mp4"    iris-3
    run "attic11.mp4"   iris-3
    run "attic12.mp4"   iris-3
    run "attic13.mp4"   rhea-1 crop
    run "attic14.mp4"   rhea-1 crop
    run "attic16.mp4"   iris-3
    run "attic17.mp4"   iris-3
    run "attic18.mp4"   iris-3
    run "attic19.mp4"   iris-3
    run "attic20.mp4"   iris-3
    run "attic21.mp4"   iris-3
    run "indy3.mp4"     iris-3
    run "indy4.mp4"     iris-3
    run "splash3.mp4"   iris-3
    run "desk.mp4"      iris-3
    run "cross6.mp4"    iris-3
    run "cross7.mp4"    iris-3
    run "gargoyle6.mp4" iris-3
fi
