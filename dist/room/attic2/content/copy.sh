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

dialog()
{
    run "$1.mp4"
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

    run "attic.mp4"  iris-3 48
    run "attic2.mp4" iris-3 48
    run "indy.mp4"   iris-3 60
    run "indy2.mp4"  rhea-1 48 crop
    run "indy4.mp4"  rhea-1 48 crop
    run "indy5.mp4"  iris-3 60
    run "indy6.mp4"  iris-3 60
    run "book.mp4"   iris-3 48
    run "book2.mp4"  iris-3 48
    runWide "attic.mp4"  iris-3 48
    runWide "attic2.mp4" iris-3 48
    runWide "indy.mp4"   iris-3 60
    runWide "indy2.mp4"  rhea-1 48
    runWide "indy4.mp4"  rhea-1 48
    runWide "indy5.mp4"  iris-3 60
    runWide "indy6.mp4"  iris-3 60
    runWide "book.mp4"   iris-3 48
    runWide "book2.mp4"  iris-3 48
fi
