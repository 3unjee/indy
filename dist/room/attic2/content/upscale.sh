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

run "attic.mp4"  iris-3 60
run "attic2.mp4" iris-3 60
run "attic3.mp4" iris-3 60
run "attic4.mp4" iris-3 60
run "indy.mp4"   iris-3 60
run "indy2.mp4"  rhea-1 60 crop
run "indy3.mp4"  iris-3 60
run "indy4.mp4"  rhea-1 60 crop
run "indy5.mp4"  iris-3 60
run "indy6.mp4"  iris-3 60
run "book.mp4"   iris-3 60
run "book2.mp4"  iris-3 60

runWide "attic.mp4"  iris-3 60
runWide "attic2.mp4" iris-3 60
runWide "indy.mp4"   iris-3 60
runWide "indy2.mp4"  rhea-1 60
runWide "indy4.mp4"  rhea-1 60
runWide "book.mp4"   iris-3 60
runWide "book2.mp4"  iris-3 60
