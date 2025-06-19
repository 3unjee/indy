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
    # NOTE: copied from upscale.sh

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
