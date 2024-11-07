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

    run "college.mp4"         iris-3
    run "college2.mp4"        iris-3
    run "college3.mp4"        iris-3
    run "college4.mp4"        iris-3
    run "interior.mp4"        iris-3
    run "interior3.mp4"       iris-3
    run "interior9.mp4"       iris-3
    run "interior10.mp4"      iris-3
    run "interior11.mp4"      iris-3
    run "interior12.mp4"      iris-3
    run "interior3-sync.mp4"  iris-3 letterbox
    run "interior9-sync.mp4"  iris-3 letterbox
    run "interior10-sync.mp4" iris-3 letterbox
    run "interior11-sync.mp4" iris-3 letterbox
    run "interior12-sync.mp4" iris-3 letterbox
fi
