#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

ffmpeg="/c/dev/tools/ffmpeg/ffmpeg.exe"

input="$PWD/voice"

output="$PWD/../content/voice"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

volume()
{
    "$ffmpeg" -y -i "$input/$1" -filter:a "volume=$2dB" "$output/$1"
}

#--------------------------------------------------------------------------------------------------
# Voice
#--------------------------------------------------------------------------------------------------

volume "attic.mp3"  20
volume "attic2.mp3" 20
volume "attic3.mp3" 20

volume "cross.mp3"  20
volume "cross2.mp3" 20
volume "cross3.mp3" 20

volume "gargoyle.mp3"  20
volume "gargoyle2.mp3" 20
volume "gargoyle3.mp3" 20