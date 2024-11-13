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

    run "college.mp4"      iris-3
    run "college2.mp4"     iris-3
    run "college3.mp4"     iris-3
    run "college4.mp4"     iris-3
    run "interior.mp4"     iris-3
    run "dialog.mp4"       iris-3
    run "dialog2.mp4"      iris-3
    run "dialog3.mp4"      iris-3
    run "dialog4.mp4"      iris-3
    run "dialog5.mp4"      iris-3
    run "dialog-sync.mp4"  iris-3 letterbox
    run "dialog2-sync.mp4" iris-3 letterbox
    run "dialog3-sync.mp4" iris-3 letterbox
    run "dialog4-sync.mp4" iris-3 letterbox
    run "dialog5-sync.mp4" iris-3 letterbox
fi
