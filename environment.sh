#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------
# environment

assets="/c/users/bunjee/OneDrive/assets/indy"

kdenlive="/c/dev/tools/kdenlive/bin"

#--------------------------------------------------------------------------------------------------
# defaults

assets_default="/c/users/bunjee/OneDrive/assets/indy"

kdenlive_default="/c/dev/tools/kdenlive/bin"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

replace()
{
    expression='s:'"$1"'=\"'"$2"'":'"$1"'=\"'"$3"'":g'

    apply $expression environment.sh

    apply $expression configure.sh
    apply $expression push.sh
    apply $expression render.sh
}

apply()
{
    if [ $host = "macOS" ]; then

        sed -i "" $1 $2
    else
        sed -i $1 $2
    fi
}

#--------------------------------------------------------------------------------------------------

getOs()
{
    case `uname` in
    Darwin*) echo "macOS";;
    *)       echo "other";;
    esac
}

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 2 ] || [ $1 != "assets" ]; then

    echo "Usage: environment <assets path | default> <kdenlive path | default>"

    exit 1
fi

#--------------------------------------------------------------------------------------------------
# Configuration
#--------------------------------------------------------------------------------------------------

host=$(getOs)

#--------------------------------------------------------------------------------------------------
# Replacements
#--------------------------------------------------------------------------------------------------

if [ "$1" = "default" ]; then

    replace assets "$assets" "$assets_default"
else
    replace assets "$assets" "$1"
fi

if [ "$2" = "default" ]; then

    replace kdenlive "$kdenlive" "$kdenlive_default"
else
    replace kdenlive "$kdenlive" "$1"
fi
