#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------
# environment

project="C:/dev/workspace/indy"

assets="/c/users/bunjee/OneDrive/assets/indy"

kdenlive="/c/dev/tools/kdenlive/bin"

#--------------------------------------------------------------------------------------------------
# defaults

project_default="C:/dev/workspace/indy"

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

replaceProjects()
{
    local pathA=$(printf "%s" "$1" | sed 's/[\/&]/\\&/g')
    local pathB=$(printf "%s" "$2" | sed 's/[\/&]/\\&/g')

    expression="s|$pathA|$pathB|g"

    applyBase "movie" "movieIntro"
    applyBase "movie" "movieAttic"
    applyBase "movie" "movieChase"
    applyBase "movie" "movieOutro"

    applyRoom "intro"

    applyRoom "attic"
    applyRoom "attic" "attic2"

    applyRoom "attic2"

    applyRoom "chase"
}

apply()
{
    if [ $host = "macOS" ]; then

        sed -i "" "$1" "$2"
    else
        sed -i "$1" "$2"
    fi
}

applyBase()
{
    local path="$1"
    local name="${2:-$1}"

    apply "$expression" "dist/$path/data/$name.kdenlive"
}

applyRoom()
{
    local path="room/$1"
    local name="${2:-$1}"

    applyBase "$path" "$name"
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

if [ $# -lt 1 -o $# -gt 3 ]; then

    echo "Usage: environment <project path  | default>"
    echo "                   [assets path   | default]"
    echo "                   [kdenlive path | default]"

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

    replaceProjects "$project" "$project_default"
else
    replaceProjects "$project_default" "$1"
fi

if [ $# -gt 1 ]; then

    if [ "$2" = "default" ]; then

        replace assets "$assets" "$assets_default"
    else
        replace assets "$assets" "$2"
    fi
fi

if [ $# -gt 2 ]; then

    if [ "$3" = "default" ]; then

        replace kdenlive "$kdenlive" "$kdenlive_default"
    else
        replace kdenlive "$kdenlive" "$3"
    fi
fi
