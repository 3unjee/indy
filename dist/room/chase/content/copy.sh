#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

# BEGIN code
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
# END code

    #----------------------------------------------------------------------------------------------
    # BEGIN copy

    run "college.mp4"      iris-3 60
    run "college2.mp4"     iris-3 60
    run "college3.mp4"     iris-3 60
    run "college4.mp4"     iris-3 60
    run "interior.mp4"     iris-3 30
    run "interior9.mp4"    iris-3 60
    dialog "dialog"  iris-3 30
    dialog "dialog2" iris-3 30
    dialog "dialog3" iris-3 30
    dialog "dialog4" iris-3 30
    dialog "dialog5" iris-3 30
    run "dialog-sync.mp4"  iris-3 30 letterbox
    run "dialog2-sync.mp4" iris-3 30 letterbox
    run "dialog3-sync.mp4" iris-3 30 letterbox
    run "dialog4-sync.mp4" iris-3 30 letterbox
    run "dialog5-sync.mp4" iris-3 30 letterbox
    runWide "college2.mp4"  iris-3 60
    runWide "college3.mp4"  iris-3 60
    runWide "college4.mp4"  iris-3 60
    runWide "interior.mp4"  iris-3 30
    runWide "interior4.mp4" iris-3 30
    runWide "interior5.mp4" iris-3 30
    runWide "interior6.mp4" iris-3 30
    runWide "interior7.mp4" iris-3 30
    runWide "interior8.mp4" iris-3 30
    runWide "interior9.mp4" iris-3 60
fi
