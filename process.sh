#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

upscaleBase()
{
    echo "-----------"
    echo "CONFIGURING"
    echo "-----------"

    sh configure.sh "$1" default force

    echo "---------"
    echo "UPSCALING"
    echo "---------"

    cd "$PWD/dist/$1"/content

    sh upscale.sh

    cd -

    echo "-------"
    echo "PUSHING"
    echo "-------"

    sh push.sh "$1" upscale force
}

upscale()
{
    upscaleBase "room/$1"
}

renderBase()
{
    echo "-----------"
    echo "CONFIGURING"
    echo "-----------"

    sh configure.sh "$1" default force

    echo "---------"
    echo "RENDERING"
    echo "---------"

    sh render.sh "$1"
}

render()
{
    renderBase "room/$1"
}

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

read -p "Run process ? (yes/no) " REPLY

if [ "$REPLY" != "yes" ]; then exit 1; fi

#--------------------------------------------------------------------------------------------------
# Upscale
#--------------------------------------------------------------------------------------------------

#upscale "intro"
#upscale "attic"
#upscale "attic2"
#upscale "chase"

#--------------------------------------------------------------------------------------------------
# Render
#--------------------------------------------------------------------------------------------------

sh configure.sh deploy default force

#renderBase "movie"
renderBase "trailer"

#render "intro"
#render "attic"
#render "attic2"
#render "chase"

sh push.sh deploy default force
