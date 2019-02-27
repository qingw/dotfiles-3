#!/usr/bin/env bash

# emacs-vterm
if [ -n "$INSIDE_EMACS" ]; then
    alias vi='emacsclient -n'
    alias vim='emacsclient -n'
    alias emacs="emacsclient -n"
fi

function emacs {
    if [[ $# -eq 0 ]]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            /Applications/Emacs.app/Contents/MacOS/Emacs
        elif [ "$OSTYPE" == "linux-gnu" ]; then
            /usr/bin/emacs # "emacs" is function, will cause recursion
        fi
        return
    fi
    args=($*)
    for ((i=0; i <= ${#args}; i++)); do
        local a=${args[i]}
        # NOTE: -c for creating new frame
        if [[ ${a:0:1} == '-' && ${a} != '-c' && ${a} != '--' ]]; then
            if [[ "$OSTYPE" == "darwin"* ]]; then
                /Applications/Emacs.app/Contents/MacOS/Emacs ${args[*]}
            elif [ "$OSTYPE" == "linux-gnu" ]; then
                /usr/bin/emacs ${args[*]}
            fi
            return
        fi
    done
    if [[ "$OSTYPE" == "darwin"* ]]; then
        setsid emacsclient -n -a /Applications/Emacs.app/Contents/MacOS/Emacs ${args[*]}
    elif [ "$OSTYPE" == "linux-gnu" ]; then
        setsid emacsclient -n -a /usr/bin/emacs ${args[*]}
    fi
}

if [ -d "$HOME/emacs-distros/spacemacs" ] && \
   [ -f "$HOME/.emacs-profiles.el" ] && \
   [ -f "$HOME/.emacs" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        alias spacemacs="/Applications/Emacs.app/Contents/MacOS/Emacs --with-profile=spacemacs &"
        alias doom="/Applications/Emacs.app/Contents/MacOS/Emacs --with-profile=doom &"
    elif [ "$OSTYPE" == "linux-gnu" ]; then
        alias spacemacs="/usr/bin/emacs --with-profile=spacemacs &"
        alias doom="/usr/bin/emacs --with-profile=doom &"
    fi
fi
