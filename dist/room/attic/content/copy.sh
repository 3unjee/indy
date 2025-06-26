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
    # NOTE: copied from upscale.sh

    run "attic.mp4"      iris-3 60
    run "attic2.mp4"     iris-3 60
    run "attic5.mp4"     iris-3 60
    run "attic6.mp4"     iris-3 60
    run "attic7.mp4"     iris-3 60
    run "attic11.mp4"    iris-3 60
    run "attic12.mp4"    iris-3 60
    run "attic18.mp4"    iris-3 60
    run "attic19.mp4"    iris-3 60
    run "attic20.mp4"    iris-3 60
    run "attic22.mp4"    iris-3 24
    run "attic22-60.mp4" iris-3 60
    run "attic24.mp4"    iris-3 60
    run "attic25.mp4"    iris-3 60
    run "indy4.mp4"     iris-3 60
    run "splash3.mp4"   iris-3 60
    run "cross6.mp4"    iris-3 60
    run "cross7.mp4"    iris-3 60
    run "gargoyle6.mp4" iris-3 60
    run "dialog.mp4"     iris-3 60
    run "dialog2.mp4"    iris-3 60
    run "dialog3.mp4"    iris-3 24
    run "dialog3-60.mp4" iris-3 60
    run "dialog-sync.mp4"  iris-3 60 letterbox
    run "dialog2-sync.mp4" iris-3 60 letterbox
    run "dialog3-sync.mp4" iris-3 60 letterbox
    runWide "attic.mp4"     iris-3 60
    runWide "attic2.mp4"    iris-3 60
    runWide "attic5.mp4"    iris-3 60
    runWide "attic6.mp4"    iris-3 60
    runWide "attic7.mp4"    iris-3 60
    runWide "attic12.mp4"   iris-3 60
    runWide "attic18.mp4"   iris-3 60
    runWide "attic19.mp4"   iris-3 60
    runWide "attic20.mp4"   iris-3 60
    runWide "attic22.mp4"   iris-3 24
    runWide "attic24.mp4"   iris-3 60
    runWide "attic25.mp4"   iris-3 60
    runWide "indy4.mp4"     iris-3 60
    runWide "splash3.mp4"   iris-3 60
    runWide "cross6.mp4"    iris-3 60
    runWide "cross7.mp4"    iris-3 60
    runWide "gargoyle6.mp4" iris-3 60
    runWide "dialog2.mp4"   iris-3 60
    runWide "attic11-1.mp4" iris-3 60
    runWide "attic11-2.mp4" iris-3 60
    runWide "dialog3-1.mp4" iris-3 24
    runWide "dialog3-2.mp4" iris-3 24
fi
