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

run "attic.mp4"     iris-3
run "attic2.mp4"    iris-3
run "attic5.mp4"    iris-3
run "attic6.mp4"    iris-3
run "attic7.mp4"    iris-3
run "attic8.mp4"    iris-3
run "attic11.mp4"   iris-3
run "attic12.mp4"   iris-3
run "attic13.mp4"   rhea-1 crop
run "attic14.mp4"   rhea-1 crop
run "attic16.mp4"   iris-3
run "attic17.mp4"   iris-3
run "attic18.mp4"   iris-3
run "attic19.mp4"   iris-3
run "attic20.mp4"   iris-3
run "attic21.mp4"   iris-3
run "indy3.mp4"     iris-3
run "indy4.mp4"     iris-3
run "splash3.mp4"   iris-3
run "desk.mp4"      iris-3
run "cross6.mp4"    iris-3
run "cross7.mp4"    iris-3
run "gargoyle6.mp4" iris-3
