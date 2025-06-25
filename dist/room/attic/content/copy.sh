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
    run "attic18.mp4"   iris-3
    run "attic19.mp4"   iris-3
    run "attic20.mp4"   iris-3
    run "attic22.mp4"   iris-3
    run "attic24.mp4"   iris-3
    run "attic25.mp4"   iris-3

    run "indy4.mp4"     iris-3
    run "splash3.mp4"   iris-3
    run "desk.mp4"      iris-3
    run "cross6.mp4"    iris-3
    run "cross7.mp4"    iris-3
    run "gargoyle6.mp4" iris-3

    run "dialog.mp4"  iris-3
    run "dialog2.mp4" iris-3
    run "dialog3.mp4" iris-3

    run "dialog-sync.mp4"  iris-3 letterbox
    run "dialog2-sync.mp4" iris-3 letterbox
    run "dialog3-sync.mp4" iris-3 letterbox

    run "wide/attic.mp4"     iris-3 default 5110
    run "wide/attic2.mp4"    iris-3 default 5110
    run "wide/attic5.mp4"    iris-3 default 5110
    run "wide/attic6.mp4"    iris-3 default 5110
    run "wide/attic7.mp4"    iris-3 default 5110
    run "wide/attic12.mp4"   iris-3 default 5110
    run "wide/attic18.mp4"   iris-3 default 5110
    run "wide/attic19.mp4"   iris-3 default 5110
    run "wide/attic20.mp4"   iris-3 default 5110
    run "wide/attic22.mp4"   iris-3 default 5110
    run "wide/attic24.mp4"   iris-3 default 5110
    run "wide/attic25.mp4"   iris-3 default 5110
    run "wide/indy4.mp4"     iris-3 default 5110
    run "wide/splash3.mp4"   iris-3 default 5110
    run "wide/cross6.mp4"    iris-3 default 5110
    run "wide/cross7.mp4"    iris-3 default 5110
    run "wide/gargoyle6.mp4" iris-3 default 5110
    run "wide/dialog2.mp4"   iris-3 default 5110

    run "wide/attic11-1.mp4" iris-3 default 5110
    run "wide/attic11-2.mp4" iris-3 default 5110
    run "wide/dialog3-1.mp4" iris-3 default 5110
    run "wide/dialog3-2.mp4" iris-3 default 5110
fi
