#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

content="$PWD/../content"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    name="video/$1"

    cp "$name".mp4      "$content"
    cp "$name"-sync.mp4 "$content"
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

run "dialog"
run "dialog2"
run "dialog3" 0.5
run "dialog4"
run "dialog5"