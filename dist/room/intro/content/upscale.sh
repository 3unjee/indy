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

run "intro.mp4"    iris-3
run "intro2.mp4"   iris-3
run "intro3.mp4"   iris-3 letterbox
run "college.mp4"  iris-3
run "college2.mp4" iris-3
run "college3.mp4" iris-3

runWide "wide/intro.mp4"      iris-3
runWide "wide/intro2.mp4"     iris-3
runWide "wide/college.mp4"    iris-3
runWide "wide/college2.mp4"   iris-3
runWide "wide/college3-1.mp4" iris-3
runWide "wide/college3-2.mp4" iris-3
