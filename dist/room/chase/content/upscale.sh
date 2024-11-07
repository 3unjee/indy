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

run "college.mp4"         iris-3
run "college2.mp4"        iris-3
run "college3.mp4"        iris-3
run "college4.mp4"        iris-3
run "interior.mp4"        iris-3
run "interior3.mp4"       iris-3
run "interior9.mp4"       iris-3
run "interior10.mp4"      iris-3
run "interior11.mp4"      iris-3
run "interior12.mp4"      iris-3
run "interior3-sync.mp4"  iris-3 letterbox
run "interior9-sync.mp4"  iris-3 letterbox
run "interior10-sync.mp4" iris-3 letterbox
run "interior11-sync.mp4" iris-3 letterbox
run "interior12-sync.mp4" iris-3 letterbox
