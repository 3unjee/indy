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

run "wide/attic.mp4"  iris-3 default 5110
run "wide/attic2.mp4" iris-3 default 5110
run "wide/indy.mp4"   iris-3 default 5110
run "wide/indy2.mp4"  rhea-1 default 5110
run "wide/indy4.mp4"  rhea-1 default 5110
run "wide/book.mp4"   iris-3 default 5110
run "wide/book2.mp4"  iris-3 default 5110
