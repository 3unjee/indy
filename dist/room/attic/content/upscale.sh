#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

root="$PWD"

ffmpeg="$PWD/../../../../../Sky/tools/ffmpeg"

input="$PWD"

output="$PWD/upscale"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    if [ $# = 3 ]; then

        sh topaz.sh "$input/$1" "$output/$1" "$2" "$3" 3840 2160 60
    else
        sh topaz.sh "$input/$1" "$output/$1" "$2" default 3840 2160 60
    fi
}

runWide()
{
    if [ $# = 3 ]; then

        sh topaz.sh "$input/$1" "$output/$1" "$2" "$3" 5110 2160 60
    else
        sh topaz.sh "$input/$1" "$output/$1" "$2" default 5110 2160 60
    fi
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$ffmpeg"

run "attic.mp4"   iris-3
run "attic2.mp4"  iris-3
run "attic5.mp4"  iris-3
run "attic6.mp4"  iris-3
run "attic7.mp4"  iris-3
run "attic8.mp4"  iris-3
run "attic11.mp4" iris-3
run "attic12.mp4" iris-3
run "attic13.mp4" rhea-1 crop
run "attic14.mp4" rhea-1 crop
run "attic18.mp4" iris-3
run "attic19.mp4" iris-3
run "attic20.mp4" iris-3
run "attic22.mp4" iris-3
run "attic24.mp4" iris-3
run "attic25.mp4" iris-3

run "indy4.mp4"     iris-3
run "splash3.mp4"   iris-3
run "desk.mp4"      iris-3
run "cross6.mp4"    iris-3
run "cross7.mp4"    iris-3
run "gargoyle6.mp4" iris-3

run "dialog.mp4"  iris-3
run "dialog2.mp4" iris-3
run "dialog3.mp4" iris-3

runWide "dialog-sync.mp4"  iris-3 letterbox
runWide "dialog2-sync.mp4" iris-3 letterbox
runWide "dialog3-sync.mp4" iris-3 letterbox

runWide "wide/attic.mp4"     iris-3
runWide "wide/attic2.mp4"    iris-3
runWide "wide/attic5.mp4"    iris-3
runWide "wide/attic6.mp4"    iris-3
runWide "wide/attic7.mp4"    iris-3
runWide "wide/attic12.mp4"   iris-3
runWide "wide/attic18.mp4"   iris-3
runWide "wide/attic19.mp4"   iris-3
runWide "wide/attic20.mp4"   iris-3
runWide "wide/attic22.mp4"   iris-3
runWide "wide/attic24.mp4"   iris-3
runWide "wide/attic25.mp4"   iris-3
runWide "wide/indy4.mp4"     iris-3
runWide "wide/splash3.mp4"   iris-3
runWide "wide/cross6.mp4"    iris-3
runWide "wide/cross7.mp4"    iris-3
runWide "wide/gargoyle6.mp4" iris-3
runWide "wide/dialog2.mp4"   iris-3

runWide "wide/attic11-1.mp4" iris-3
runWide "wide/attic11-2.mp4" iris-3
runWide "wide/dialog3-1.mp4" iris-3
runWide "wide/dialog3-2.mp4" iris-3
