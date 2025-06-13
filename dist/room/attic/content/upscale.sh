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
    local pathA="$input/$1"
    local pathB="$output/$1"

    shift

    sh topaz.sh "$pathA" "$pathB" "$@"
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$ffmpeg"

#run "attic.mp4"     iris-3
#run "attic2.mp4"    iris-3
#run "attic5.mp4"    iris-3
#run "attic6.mp4"    iris-3
#run "attic7.mp4"    iris-3
#run "attic8.mp4"    iris-3
#run "attic11.mp4"   iris-3
#run "attic12.mp4"   iris-3
#run "attic13.mp4"   rhea-1 crop
#run "attic14.mp4"   rhea-1 crop
#run "attic18.mp4"   iris-3
#run "attic19.mp4"   iris-3
#run "attic20.mp4"   iris-3
#run "attic22.mp4"   iris-3
#run "attic24.mp4"   iris-3
#run "attic25.mp4"   iris-3

#run "indy4.mp4"     iris-3
#run "splash3.mp4"   iris-3
#run "desk.mp4"      iris-3
#run "cross6.mp4"    iris-3
#run "cross7.mp4"    iris-3
#run "gargoyle6.mp4" iris-3

#run "dialog.mp4"  iris-3
#run "dialog2.mp4" iris-3
#run "dialog3.mp4" iris-3

#run "dialog-sync.mp4"  iris-3 letterbox
#run "dialog2-sync.mp4" iris-3 letterbox
#run "dialog3-sync.mp4" iris-3 letterbox

#run "wide/splash3.mp4"   iris-3 default 5110
run "wide/attic22.mp4"   iris-3 default 5110
run "wide/indy4.mp4"     iris-3 default 5110
run "wide/dialog3-1.mp4" iris-3 default 5110
run "wide/dialog3-2.mp4" iris-3 default 5110
