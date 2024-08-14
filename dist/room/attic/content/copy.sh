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

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

if [ "$1" = "restore" ]; then

    rm -f "$upscale"/*.mp4

    mv "$temp"/*.mp4 "$upscale"
else
    mv "$upscale"/*.mp4 "$temp"

    run "attic.mp4"     iris-3
    run "attic2.mp4"    iris-3
    run "attic5.mp4"    iris-3
    run "attic6.mp4"    iris-3
    run "attic7.mp4"    iris-3
    run "attic8.mp4"    iris-3
    run "attic11.mp4"   iris-3
    run "attic12.mp4"   iris-3
    run "indy3.mp4"     iris-3
    run "indy4.mp4"     iris-3
    run "splash3.mp4"   iris-3
    run "desk.mp4"      iris-3
    run "cross6.mp4"    iris-3
    run "cross7.mp4"    iris-3
    run "gargoyle6.mp4" iris-3
fi
