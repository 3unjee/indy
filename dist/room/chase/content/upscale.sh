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

        sh topaz.sh "$input/$1" "$output/$1" $2 $3
    else
        sh topaz.sh "$input/$1" "$output/$1" $2
    fi
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$ffmpeg"

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
