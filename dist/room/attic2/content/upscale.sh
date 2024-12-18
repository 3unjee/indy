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

run "attic.mp4"  iris-3
run "attic2.mp4" iris-3
run "attic3.mp4" iris-3
run "attic4.mp4" iris-3
run "indy.mp4"   iris-3
run "indy2.mp4"  rhea-1 crop
run "indy3.mp4"  iris-3
run "indy4.mp4"  rhea-1 crop
run "indy5.mp4"  iris-3
run "indy6.mp4"  iris-3
run "book.mp4"   iris-3
run "book2.mp4"  iris-3
