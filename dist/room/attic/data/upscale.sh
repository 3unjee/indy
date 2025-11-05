#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

freepik="$PWD/../../../../../Sky-runtime/bash/generate/freepik"

imageConverter="$PWD/../../../../../Sky/deploy/imageConverter"

input="$PWD/upscale/base"

output="$PWD/upscale"

screens="$PWD/../../../screens/attic"

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

    "$imageConverter" "$output/$1.png" "$output/jpg/$1.jpg" jpg 90 2560 1435
}

copy()
{
    cp -v "$output/jpg/$1.jpg" "$screens"
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$freepik"

run "attic"     2x
run "attic5"    2x
run "cross2"    2x
run "gargoyle3" 2x
run "indy7"     2x
run "splash"    2x

#--------------------------------------------------------------------------------------------------
# Screens
#--------------------------------------------------------------------------------------------------

copy "attic"
copy "attic5"
copy "cross2"
copy "gargoyle3"
copy "indy3"
copy "indy7"
copy "splash"
