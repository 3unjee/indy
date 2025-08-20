#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

# BEGIN code
root="$PWD"

ffmpeg="$PWD/../../../../../Sky-runtime/bash/ffmpeg"

LivePortrait="$PWD/../../../../../Sky-runtime/bash/generate/LivePortrait"

input="$PWD"

output="$PWD/upscale"

base="$PWD/../data/video/base"

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
        sh topaz.sh "$input/wide/$1" "$output/wide/$1" "$2" wide 5110 2160 "$3"
    fi
}

dialog()
{
    cd "$LivePortrait"

    if [ $# = 4 ]; then

        sh sync.sh "$base" "$1" "$output" $4 3840 2160 lossless
    else
        sh sync.sh "$base" "$1" "$output" 0 3840 2160 lossless
    fi

    cd -

    local path="$output/$1.mp4"
    local temp="$output/$1-temp.mp4"

    mv "$path" "$temp"

    sh topaz.sh "$temp" "$path" "$2" default 3840 2160 "$3"

    rm "$temp"
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$ffmpeg"
# END code

run "attic.mp4"  iris-3 48
run "attic2.mp4" iris-3 48
run "indy.mp4"   iris-3 60
run "indy2.mp4"  rhea-1 48 crop
run "indy4.mp4"  rhea-1 48 crop
run "indy5.mp4"  iris-3 60
run "indy6.mp4"  iris-3 60
run "book.mp4"   iris-3 48
run "book2.mp4"  iris-3 48

runWide "attic.mp4"  iris-3 48
runWide "attic2.mp4" iris-3 48
runWide "indy.mp4"   iris-3 60
runWide "indy2.mp4"  rhea-1 48
runWide "indy4.mp4"  rhea-1 48
runWide "indy5.mp4"  iris-3 60
runWide "indy6.mp4"  iris-3 60
runWide "book.mp4"   iris-3 48
runWide "book2.mp4"  iris-3 48
