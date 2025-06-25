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

        sh topaz.sh "$input/wide/$1" "$output/wide/$1" "$2" "$3" 5110 2160 60
    else
        sh topaz.sh "$input/wide/$1" "$output/wide/$1" "$2" default 5110 2160 60
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

runWide "wide/college2.mp4"  iris-3 default
runWide "wide/college3.mp4"  iris-3 default
runWide "wide/college4.mp4"  iris-3 default
runWide "wide/interior.mp4"  iris-3 default
runWide "wide/interior4.mp4" iris-3 default
runWide "wide/interior5.mp4" iris-3 default
runWide "wide/interior6.mp4" iris-3 default
runWide "wide/interior7.mp4" iris-3 default
runWide "wide/interior8.mp4" iris-3 default
