#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

# BEGIN code
root="$PWD"

ffmpeg="$PWD/../../../../../Sky/tools/ffmpeg"

input="$PWD"

output="$PWD/upscale"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    if [ $# = 4 ]; then

        sh topaz.sh "$input/$1" "$output/$1" "$2" "$4" 3840 2160 "$3"
    else
        sh topaz.sh "$input/$1" "$output/$1" "$2" default 3840 2160 "$3"
    fi
}

runWide()
{
    if [ $# = 4 ]; then

        sh topaz.sh "$input/wide/$1" "$output/wide/$1" "$2" "$4" 5110 2160 "$3"
    else
        sh topaz.sh "$input/wide/$1" "$output/wide/$1" "$2" default 5110 2160 "$3"
    fi
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$ffmpeg"
# END code

run "intro.mp4"    iris-3 60
run "intro2.mp4"   iris-3 60
run "intro3.mp4"   iris-3 60 letterbox
run "college.mp4"  iris-3 60
run "college2.mp4" iris-3 60
run "college3.mp4" iris-3 60

runWide "intro.mp4"      iris-3 60
runWide "intro2.mp4"     iris-3 60
runWide "college.mp4"    iris-3 60
runWide "college2.mp4"   iris-3 60
runWide "college3-1.mp4" iris-3 60
runWide "college3-2.mp4" iris-3 60
