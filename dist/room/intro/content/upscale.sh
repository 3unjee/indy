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

run "intro.mp4"    iris-3
run "intro2.mp4"   iris-3
run "intro3.mp4"   iris-3 letterbox
run "college.mp4"  iris-3
run "college2.mp4" iris-3
run "college3.mp4" iris-3

run "wide/intro.mp4"      iris-3 default 5110
run "wide/intro2.mp4"     iris-3 default 5110
run "wide/college.mp4"    iris-3 default 5110
run "wide/college2.mp4"   iris-3 default 5110
run "wide/college3-1.mp4" iris-3 default 5110
run "wide/college3-2.mp4" iris-3 default 5110
