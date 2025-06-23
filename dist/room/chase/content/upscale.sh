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

run "wide/college2.mp4"    iris-3 default 5110
run "wide/college3.mp4"    iris-3 default 5110
run "wide/college4.mp4"    iris-3 default 5110 2160 30
run "wide/interior.mp4"    iris-3 default 5110 2160 30
run "wide/interior4.mp4"   iris-3 default 5110 2160 30
run "wide/interior5.mp4"   iris-3 default 5110 2160 30
run "wide/interior6.mp4"   iris-3 default 5110 2160 30
run "wide/interior7.mp4"   iris-3 default 5110 2160 30
run "wide/interior8.mp4"   iris-3 default 5110 2160 30
