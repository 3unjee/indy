#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

root="$PWD"

# NOTE windows: It seems the Program Files path is messing up the melt command line.
bin="/c/dev/tools/kdenlive/bin"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

render()
{
    local input=$(getPath "$root/dist/room/$1/data/$1.kdenlive")

    local output=$(getPath "$root/deploy/$2.mp4")

    local profile=$(getPath "$root/dist/profile/$3.mlt")

    echo "Rendering from: $input"
    echo "Output:         $output"

    # NOTE: These settings are extracted from the kdenlive render panel.
    ./melt "$input" -profile "$profile" -consumer avformat:"$output" \
           ab=160k acodec=aac channels=2 crf=23 f=mp4 g=15 movflags=+faststart preset=veryfast \
           real_time=-1 threads=0 vcodec=libx264 \
           -progress -verbose
}

getOs()
{
    case `uname` in
    MINGW*)  os="windows";;
    Darwin*) os="macOS";;
    Linux*)  os="linux";;
    *)       os="other";;
    esac

    type=`uname -m`

    if [ $type = "x86_64" ]; then

        if [ $os = "windows" ]; then

            echo win64
        else
            echo $os
        fi

    elif [ $os = "windows" ]; then

        echo win32
    else
        echo $os
    fi
}

getPath()
{
    if [ $os = "windows" ]; then

        cygpath -w "$1"
    else
        echo "$1"
    fi
}

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] || [ $1 != "all"         -a \
                    $1 != "room/intro"  -a \
                    $1 != "room/attic"  -a \
                    $1 != "room/attic2" -a \
                    $1 != "room/chase" ]; then

    echo "Usage: render <all>"
    echo "              <room/intro>"
    echo "              <room/attic>"
    echo "              <room/attic2>"
    echo "              <room/chase>"

    exit 1
fi

read -p "Run render for $1 ? (yes/no) " REPLY

if [ "$REPLY" != "yes" ]; then exit 1; fi

#--------------------------------------------------------------------------------------------------
# All
#--------------------------------------------------------------------------------------------------

if [ $1 = "all" ]; then

    sh render.sh room/intro
    sh render.sh room/attic
    sh render.sh room/attic2
    sh render.sh room/chase

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# Configuration
#--------------------------------------------------------------------------------------------------

host=$(getOs)

if [ $host = "win32" -o $host = "win64" ]; then

    os="windows"
else
    os="default"
fi

#--------------------------------------------------------------------------------------------------
# Render
#--------------------------------------------------------------------------------------------------

cd "$bin"

if [ $1 = "room/intro" ]; then

    render "intro" "wide/intro" "cinemascope"

elif [ $1 = "room/attic" ]; then

    render "attic"  "wide/attic"  "cinemascope"
    #render "attic2" "wide/attic2" "cinemascope"

elif [ $1 = "room/attic2" ]; then

    render "attic2" "wide/attic2-1" "cinemascope"

elif [ $1 = "room/chase" ]; then

    render "chase" "wide/chase" "cinemascope"
fi
