#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

# BEGIN code
root="$PWD"

ffmpeg="$PWD/../../../../../Sky/tools/ffmpeg"

LivePortrait="$PWD/../../../../../Sky/tools/LivePortrait"

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

run "college.mp4"      iris-3 60
run "college2.mp4"     iris-3 60
run "college3.mp4"     iris-3 60
run "college4.mp4"     iris-3 60
run "interior.mp4"     iris-3 30
run "interior9.mp4"    iris-3 60
run "dialog.mp4"       iris-3 30
run "dialog2.mp4"      iris-3 30
run "dialog3.mp4"      iris-3 30
run "dialog4.mp4"      iris-3 30
run "dialog5.mp4"      iris-3 30
run "dialog-sync.mp4"  iris-3 30 letterbox
run "dialog2-sync.mp4" iris-3 30 letterbox
run "dialog3-sync.mp4" iris-3 30 letterbox
run "dialog4-sync.mp4" iris-3 30 letterbox
run "dialog5-sync.mp4" iris-3 30 letterbox

runWide "college2.mp4"  iris-3 60
runWide "college3.mp4"  iris-3 60
runWide "college4.mp4"  iris-3 60
runWide "interior.mp4"  iris-3 30
runWide "interior4.mp4" iris-3 30
runWide "interior5.mp4" iris-3 30
runWide "interior6.mp4" iris-3 30
runWide "interior7.mp4" iris-3 30
runWide "interior8.mp4" iris-3 30
runWide "interior9.mp4" iris-3 60
