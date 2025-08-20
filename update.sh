#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Documents
#--------------------------------------------------------------------------------------------------

code_sync=$(cat <<'EOF'
LivePortrait="$PWD/../../../../../Sky-runtime/bash/generate/LivePortrait"

input="$PWD/video/base"

output="$PWD/../content"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    if [ $# = 2 ]; then

        sh sync.sh "$input" "$1" "$output" $2
    else
        sh sync.sh "$input" "$1" "$output"
    fi
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$LivePortrait"
EOF
)

code_upscale=$(cat <<'EOF'
root="$PWD"

ffmpeg="$PWD/../../../../../Sky-runtime/bash/ffmpeg"

LivePortrait="$PWD/../../../../../Sky-runtime/bash/generate/LivePortrait"

input="$PWD"

output="$PWD/upscale"

base="$PWD/../data/video/base"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    if [ $# = 4 ]; then

        sh topaz.sh "$input/$1" "$output/$1" "$2" "$4" 3840 2160 "$3"
    else
        sh topaz.sh "$input/$1" "$output/$1" "$2" default 3840 2160 "$3"
    fi
}

runWide()
{
    if [ $# = 4 ]; then

        sh topaz.sh "$input/wide/$1" "$output/wide/$1" "$2" "$4" 5110 2160 "$3"
    else
        sh topaz.sh "$input/wide/$1" "$output/wide/$1" "$2" wide 5110 2160 "$3"
    fi
}

dialog()
{
    cd "$LivePortrait"

    if [ $# = 4 ]; then

        sh sync.sh "$base" "$1" "$output" $4 3840 2160 lossless
    else
        sh sync.sh "$base" "$1" "$output" 0 3840 2160 lossless
    fi

    cd -

    local path="$output/$1.mp4"
    local temp="$output/$1-temp.mp4"

    mv "$path" "$temp"

    sh topaz.sh "$temp" "$path" "$2" default 3840 2160 "$3"

    rm "$temp"
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

cd "$ffmpeg"
EOF
)

code_copy=$(cat <<'EOF'
upscale="$PWD/upscale"

temp="$upscale/temp"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    cp "$1" "$upscale/$1"
}

runWide()
{
    run "$1"
}

dialog()
{
    run "$1.mp4"
}

exists()
{
    ls "$1" 1> /dev/null 2>&1
}

move()
{
    if exists "$1"/*.mp4; then

        mv "$1"/*.mp4 "$2"
    fi
}

restore()
{
    if exists "$1"/*.mp4; then

        rm -f "$2"/*.mp4

        mv "$1"/*.mp4 "$2"
    fi
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

if [ "$1" = "restore" ]; then

    if ! exists "$temp"/*.mp4; then

        echo "The temp folder does not contain video files."

        exit 0
    fi

    restore "$temp"      "$upscale"
    restore "$temp/wide" "$upscale/wide"
else
    if exists "$temp"/*.mp4; then

        echo "The temp folder already contains video files."

        exit 0
    fi

    move "$upscale"      "$temp"
    move "$upscale/wide" "$temp/wide"
EOF
)

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

replace()
{
    local file="$PWD/dist/room/$1/$2"

    if [ ! -f "$file" ]; then
        return
    fi

    # Use awk to replace block
    awk -v content="$3" '
        BEGIN { in_block=0 }
        {
            if ($0 ~ /^# BEGIN code/) {
                print $0
                print content
                in_block=1
                next
            }
            if ($0 ~ /^# END code/) {
                in_block=0
            }
            if (!in_block) {
                print $0
            }
        }
    ' "$file" > "file.tmp" && mv "file.tmp" "$file"
}

updateScript()
{
    replace "$1" "data/sync.sh"       "$code_sync"
    replace "$1" "content/upscale.sh" "$code_upscale"
    replace "$1" "content/copy.sh"    "$code_copy"

    local path="$PWD/dist/room/$1/content"

    local upscale="$path/upscale.sh"

    local copy="$path/copy.sh"

    local marker="# BEGIN copy"

    local indent="    "

    local block="${indent}${marker}\n\n"

    while IFS= read -r line; do
        block+="${indent}${line}\n"
    done < <(awk '/^run / || /^runWide / || /^dialog /' "$upscale")

    awk -v marker="$marker" -v block="$block" '
    {
        if (in_block) {
            if ($0 ~ /^fi$/) {
                print "fi"
                in_block = 0
            }
            next
        }

        if ($0 ~ marker) {
            printf "%s", block
            in_block = 1
            next
        }

        print
    }
    ' "$copy" > "$copy.tmp" && mv "$copy.tmp" "$copy"
}

generateBase()
{
    local path="$PWD/$1/data"

    local input

    if [ $# = 2 ]; then

        input="$2.kdenlive"
    else
        input="$1.kdenlive"
    fi

    mkdir -p "$path"/16-9

    awk '
    BEGIN { inside = 0 }

    /<tractor[ >]/ { inside = 1 }

    inside && /<property name="kdenlive:track_name">wide<\/property>/ { mode = "wide" }
    inside && /<property name="kdenlive:track_name">16-9<\/property>/ { mode = "16-9" }

    {
        if (inside) {
            if (mode == "wide") {
                sub(/<track hide="audio"/, "<track hide=\"both\"")
            } else if (mode == "16-9") {
                sub(/<track hide="both"/, "<track hide=\"audio\"")
            }
        }
        print
    }

    /<\/tractor>/ { inside = 0; mode = "" }
    ' "$path/$input" > "$path/16-9/$input"
}

generate()
{
    if [ $# = 2 ]; then

        generateBase "dist/room/$1" "$2"
    else
        generateBase "dist/room/$1" "$1"
    fi
}

cleanBase()
{
    rm -f "$PWD/$1"/data/*_backup*.kdenlive

    #rm -f "$PWD/$1"/data/*.kdenlive.ass
}

clean()
{
    cleanBase "dist/room/$1"
}

#--------------------------------------------------------------------------------------------------
# Copy
#--------------------------------------------------------------------------------------------------

updateScript "intro"
updateScript "attic"
updateScript "attic2"
updateScript "chase"

#--------------------------------------------------------------------------------------------------
# 16-9
#--------------------------------------------------------------------------------------------------

#generateBase "dist/movie" "movie"

#generate "intro"

#generate "attic"
#generate "attic" "attic2"

#generate "attic2"

#generate "chase"

#--------------------------------------------------------------------------------------------------
# Clean
#--------------------------------------------------------------------------------------------------

cleanBase "dist/movie"

clean "intro"
clean "attic"
clean "attic2"
clean "chase"
