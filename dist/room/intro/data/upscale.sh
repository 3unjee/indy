#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

Magnific="$PWD/../../../../../Sky/tools/Magnific"

imageConverter="$PWD/../../../../../Sky/deploy/imageConverter"

input="$PWD/upscale/base"

output="$PWD/upscale"

screens="$PWD/../../../screens/intro"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    "$imageConverter" "$output/$1.png" "$output/jpg/$1.jpg" jpg 90 2560 1435
}

copy()
{
    cp -v "$output/jpg/$1.jpg" "$screens"
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$Magnific"

run "college2" 2x
run "college4" 2x

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

copy "college2"
copy "college4"