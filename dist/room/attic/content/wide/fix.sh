#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

ffmpeg="$PWD/../../../../../../Sky/tools/ffmpeg"

fix="$PWD/fix"

input="$PWD/.."

output="$PWD"

base="$PWD/base"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    if [ $# = 3 ]; then

        sh resize.sh "$fix/$1" "$2" "$output/$1" $3

    elif [ $# = 2 ]; then

        sh resize.sh "$fix/$1" "$input/$1" "$output/$1" $2
    else
        sh resize.sh "$fix/$1" "$input/$1" "$output/$1"
    fi
}

runBase()
{
    sh resize.sh "$fix/$1" "$base/$1" "$output/$1" $3 1
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$ffmpeg"

run "attic.mp4"     1
run "attic2.mp4"    1
run "attic5.mp4"    1
run "attic6.mp4"    1
run "attic7.mp4"    1
run "attic12.mp4"   1
run "attic17.mp4"   1
run "attic18.mp4"   1
run "attic19.mp4"   1
run "attic20.mp4"   1
run "attic22.mp4"   1
run "attic24.mp4"   1
run "indy4.mp4"     1
run "splash3.mp4"   1
run "cross6.mp4"    1
run "cross7.mp4"    1
run "gargoyle6.mp4" 1
run "dialog2.mp4"   1

runBase "attic11-1.mp4" 1
runBase "attic11-2.mp4" 1
runBase "dialog3-1.mp4" 1
runBase "dialog3-2.mp4" 1
