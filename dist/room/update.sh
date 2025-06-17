#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

generate()
{
    local path
    local input

    path="$PWD/$1/data"

    if [ $# = 2 ]; then

        input="$2.kdenlive"
    else
        input="$1.kdenlive"
    fi

    mkdir -p "$path"/16-9

    awk '
    BEGIN { inside = 0 }

    /<tractor[ >]/ { inside = 1 }

    inside && /<property name="kdenlive:track_name">cinemascope<\/property>/ { mode = "cinemascope" }
    inside && /<property name="kdenlive:track_name">16\/9<\/property>/       { mode = "16-9" }

    {
        if (inside) {
            if (mode == "cinemascope") {
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

clean()
{
    rm -f "$PWD/$1"/data/*_backup*.kdenlive
}

#--------------------------------------------------------------------------------------------------
# 16/9
#--------------------------------------------------------------------------------------------------

#generate "intro"

generate "attic"
#generate "attic" "attic2"

#generate "attic2"

#generate "chase"

#--------------------------------------------------------------------------------------------------
# Clean
#--------------------------------------------------------------------------------------------------

clean "intro"
clean "attic"
clean "attic2"
clean "chase"
