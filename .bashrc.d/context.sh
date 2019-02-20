#!/usr/bin/env bash

# ConTeXt minimals
_POSSIBLE_PATH="/Volumes/DATA/ConTeXt /Volumes/MacData/ConTeXt /Volumes/SteamedFish/ConTeXt $HOME/ConTeXt"
for _CONTEXT_PATH in ${_POSSIBLE_PATH}; do
    if [ -d "${_CONTEXT_PATH}" ]; then
        #source ${_CONTEXT_PATH}/tex/setuptex
        if ! [ -f '/etc/paths.d/ConTeXt' ]; then
            echo "please run sudo echo ${_CONTEXT_PATH}/tex/texmf-osx-64/bin > /etc/paths.d/ConTeXt"
        fi
        OSFONTDIR="/Library/Fonts/;/System/Library/Fonts/;$HOME/Library/Fonts/"
        break
    fi
done
unset _POSSIBLE_PATH
unset _CONTEXT_PATH
