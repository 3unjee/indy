#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

root="$PWD"

# NOTE windows: It seems the Program Files path is messing up the melt command line.
kdenlive="/c/dev/tools/kdenlive/bin"

ffmpeg="$PWD/../Sky/tools/ffmpeg/bin/ffmpeg"

#--------------------------------------------------------------------------------------------------
# melt

crf="23"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

renderBase()
{
    local path="$1"

    local nameInput
    local nameProfile
    local nameOutput

    if [ $# = 4 ]; then

        nameInput="$2"

        nameOutput="$3"

        nameProfile="$4"

    elif [ $# = 3 ]; then

        nameInput="$2"

        nameOutput="$2"

        nameProfile="$3"
    else
        nameInput="$1"

        nameOutput="$1"

        nameProfile="$2"
    fi

    if [ $nameProfile = "16-9" ]; then

        nameInput="16-9/$nameInput"

        nameOutput="16-9/$nameOutput"
    else
        nameOutput="wide/$nameOutput"
    fi

    local input=$(getPath "$root/dist/$path/data/$nameInput.kdenlive")

    local output=$(getPath "$root/deploy/$nameOutput.$extension")

    local profile=$(getPath "$root/dist/profile/$nameProfile.mlt")

    local temp=$(getPath "$root/deploy/temp.$extension")

    echo "Rendering from: $input"
    echo "Output:         $output"
    echo "Profile:        $profile"

    rm -f "$temp"

    # NOTE: These settings are extracted from the kdenlive render panel and the following folder:
    #       kdenlive/share/mlt/presets/consumer/avformat.

    if [ $codec = "lossless" ]; then

        ./melt "$input" -profile "$profile" -consumer avformat:"$temp" f=matroska \
               vcodec=libx264 vb=0 crf=0 coder=ac g=25 bf=0 \
               acodec=flac channels=2 \
               preset=medium real_time=-1 threads=0 \
               -progress -verbose
    else
        ./melt "$input" -profile "$profile" -consumer avformat:"$temp" f=mp4 \
               vcodec=libx264 crf=$crf g=15 movflags=+faststart \
               acodec=aac channels=2 ab=160k \
               preset=veryfast real_time=-1 threads=0 \
               -progress -verbose
    fi

    mv "$temp" "$output"

    rm -f "$temp"
}

render()
{
    local name="$1"

    shift

    local path="room/$name"

    if [ $# = 1 ]; then

        renderBase "$path" "$name" "$@"
    else
        renderBase "$path" "$@"
    fi
}

renderRoom()
{
    echo "--------------"
    echo "RENDERING ROOM"
    echo "--------------"

    local codec_old="$codec"

    codec="lossless"

    cd "$kdenlive"

    render "$2" "16-9"

    cd -

    codec="$codec_old"

    echo "--------"
    echo "PATCHING"
    echo "--------"

    local path="deploy/wide/$2"

    local pathA="$path.mp4"
    local pathB="$path.mkv"

    path="dist/movie/data/$1.kdenlive"

    apply "s|$pathA|$pathB|g" "$path"

    git diff "$path" > patch.txt

    cat patch.txt

    rm patch.txt
}

renderPart()
{
    echo "---------"
    echo "RENDERING"
    echo "---------"

    cd "$kdenlive"

    renderBase "movie" "$1" "$2"

    cd -

    echo "---------"
    echo "RESTORING"
    echo "---------"

    git checkout "dist/movie/data/$1.kdenlive"
}

removeRoom()
{
    rm "$root/deploy/wide/$1.mkv"
}

apply()
{
    if [ $host = "macOS" ]; then

        sed -i "" "$1" "$2"
    else
        sed -i "$1" "$2"
    fi
}

append()
{
    echo "file '$(getPath "$1.mp4")'" >> videos.txt
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

if [ $# -lt 1 -o $# -gt 2 ] \
   || \
   [ $1 != "all"         -a \
     $1 != "movie"       -a \
     $1 != "room/intro"  -a \
     $1 != "room/attic"  -a \
     $1 != "room/attic2" -a \
     $1 != "room/chase" ] || [ $# = 2 -a "$2" != "lossless" ]; then

    echo "Usage: render <all>"
    echo "              <movie>"
    echo "              <room/intro>"
    echo "              <room/attic>"
    echo "              <room/attic2>"
    echo "              <room/chase>"
    echo "              [lossless]"

    exit 1
fi

#read -p "Run render for $1 ? (yes/no) " REPLY

#if [ "$REPLY" != "yes" ]; then exit 1; fi

#--------------------------------------------------------------------------------------------------
# Configuration
#--------------------------------------------------------------------------------------------------

if [ $# = 2 ]; then

    codec="lossless"

    extension="mkv"
else
    codec="default"

    extension="mp4"
fi

#--------------------------------------------------------------------------------------------------
# All
#--------------------------------------------------------------------------------------------------

if [ $1 = "all" ]; then

    sh render.sh "movie"
    sh render.sh "room/intro"
    sh render.sh "room/attic"
    sh render.sh "room/attic2"
    sh render.sh "room/chase"

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

cd "$kdenlive"

if [ $1 = "movie" ]; then

    cd "$root"

    #----------------------------------------------------------------------------------------------
    # Intro

    renderRoom "movieIntro" "intro"

    renderPart "movieIntro" "wide"

    removeRoom "intro"

    #renderBase "movie" "movieIntro" "wide"
    #renderBase "movie" "movieAttic" "wide"
    #renderBase "movie" "movieChase" "wide"
    #renderBase "movie" "movieOutro" "wide"

    echo "---------------"
    echo "RENDERING MOVIE"
    echo "---------------"

    cd "$root"

    path="$root/deploy/wide"

    rm -f videos.txt

    append "$path/movieIntro"
    append "$path/movieAttic"
    append "$path/movieChase"
    append "$path/movieOutro"

    "$ffmpeg" -y -f concat -safe 0 -i videos.txt -c copy "$path/movie.mp4"

    rm videos.txt

elif [ $1 = "room/intro" ]; then

    render "intro" "wide"
    render "intro" "16-9"

elif [ $1 = "room/attic" ]; then

    render "attic" "wide"
    render "attic" "16-9"

    render "attic" "attic2" "wide"
    render "attic" "attic2" "16-9"

elif [ $1 = "room/attic2" ]; then

    render "attic2" "attic2" "attic2-1" "wide"
    render "attic2" "attic2" "attic2-1" "16-9"

elif [ $1 = "room/chase" ]; then

    render "chase" "wide"
    render "chase" "16-9"
fi
