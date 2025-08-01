#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

# BEGIN code
root="$PWD"

ffmpeg="$PWD/../../../../../Sky/script/ffmpeg"

LivePortrait="$PWD/../../../../../Sky/script/LivePortrait"

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

run "attic.mp4"   iris-3 48
run "attic2.mp4"  iris-3 48
run "attic5.mp4"  iris-3 48
run "attic6.mp4"  iris-3 48
run "attic7.mp4"  iris-3 48
run "attic11.mp4" iris-3 60
run "attic12.mp4" iris-3 60
run "attic17.mp4" iris-3 60
run "attic18.mp4" iris-3 60
run "attic19.mp4" iris-3 60
run "attic20.mp4" iris-3 60
run "attic22.mp4" iris-3 48
run "attic24.mp4" iris-3 48

run "indy4.mp4"     iris-3 60
run "splash3.mp4"   iris-3 60
run "cross6.mp4"    iris-3 60
run "cross7.mp4"    iris-3 60
run "gargoyle6.mp4" iris-3 60

dialog "dialog"  iris-3 30
dialog "dialog2" iris-3 60
dialog "dialog3" iris-3 24

run "dialog-sync.mp4"  iris-3 30 letterbox
run "dialog2-sync.mp4" iris-3 60 letterbox
run "dialog3-sync.mp4" iris-3 24 letterbox

runWide "attic.mp4"     iris-3 48
runWide "attic2.mp4"    iris-3 48
runWide "attic5.mp4"    iris-3 48
runWide "attic6.mp4"    iris-3 48
runWide "attic7.mp4"    iris-3 48
runWide "attic12.mp4"   iris-3 60
runWide "attic17.mp4"   iris-3 60
runWide "attic18.mp4"   iris-3 60
runWide "attic19.mp4"   iris-3 60
runWide "attic20.mp4"   iris-3 60
runWide "attic22.mp4"   iris-3 48
runWide "attic24.mp4"   iris-3 48
runWide "indy4.mp4"     iris-3 60
runWide "splash3.mp4"   iris-3 60
runWide "cross6.mp4"    iris-3 60
runWide "cross7.mp4"    iris-3 60
runWide "gargoyle6.mp4" iris-3 60
runWide "dialog2.mp4"   iris-3 60

runWide "attic11-1.mp4" iris-3 60
runWide "attic11-2.mp4" iris-3 60
runWide "dialog3-1.mp4" iris-3 24
runWide "dialog3-2.mp4" iris-3 24
