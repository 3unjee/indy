#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

updateCopy()
{
    local path="$PWD/room/$1/content"

    local upscale="$path/upscale.sh"

    local copy="$path/copy.sh"

    local marker="# BEGIN copy"

    local indent="    "

    local block="${indent}${marker}\n\n"

    while IFS= read -r line; do
        block+="${indent}${line}\n"
    done < <(awk '/^run / || /^runWide /' "$upscale")

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
    generateBase "room/$1"
}

cleanBase()
{
    rm -f "$PWD/$1"/data/*_backup*.kdenlive

    #rm -f "$PWD/$1"/data/*.kdenlive.ass
}

clean()
{
    cleanBase "room/$1"
}

#--------------------------------------------------------------------------------------------------
# Copy
#--------------------------------------------------------------------------------------------------

updateCopy "intro"
updateCopy "attic"
updateCopy "attic2"
updateCopy "chase"

#--------------------------------------------------------------------------------------------------
# 16-9
#--------------------------------------------------------------------------------------------------

#generateBase "movie"

#generate "intro"

#generate "attic"
#generate "attic" "attic2"

#generate "attic2"

#generate "chase"

#--------------------------------------------------------------------------------------------------
# Clean
#--------------------------------------------------------------------------------------------------

cleanBase "movie"

clean "intro"
clean "attic"
clean "attic2"
clean "chase"
