#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

root="$PWD"

ffmpeg="$PWD/../../../../../Sky/tools/ffmpeg"

input="$PWD/voice"

output="$PWD/../content/voice"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

volume()
{
    sh volume.sh "$input/$1" "$output/$1" "$2"
}

#--------------------------------------------------------------------------------------------------
# Voice
#--------------------------------------------------------------------------------------------------

cd "$ffmpeg"

volume "chase.mp3"    5
volume "chase2.mp3"  10
volume "chase3.mp3"  20
volume "chase4.mp3"  20
volume "chase5.mp3"  10
volume "chase6.mp3"  10
volume "chase7.mp3"  20
volume "chase8.mp3"  20
volume "chase9.mp3"  25
volume "chase10.mp3" 25
