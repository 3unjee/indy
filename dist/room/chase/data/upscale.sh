#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

Magnific="$PWD/../../../../../Sky/tools/Magnific"

imageConverter="$PWD/../../../../../Sky/deploy/imageConverter"

input="$PWD/upscale/base"

output="$PWD/upscale"

screens="$PWD/../../../screens/chase"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    if [ $# = 3 ]; then

        sh upscale.sh "$input/$1.png" "$output/$1.png" $2 films_n_photography $3
    else
        sh upscale.sh "$input/$1.png" "$output/$1.png" $2 films_n_photography
    fi

    "$imageConverter" "$output/$1.png" "$output/jpg/$1.jpg" jpg 80 2560 1435
}

copy()
{
    cp -v "$output/jpg/$1.jpg" "$screens"
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$Magnific"

run "college"   2x
run "college2"  2x
run "interior"  2x
run "interior2" 2x -2
run "interior3" 2x -2
run "interior4" 2x -2
run "interior5" 2x -2

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

copy "college"
copy "college2"
copy "interior2"
copy "interior3"
copy "interior4"
copy "interior5"
