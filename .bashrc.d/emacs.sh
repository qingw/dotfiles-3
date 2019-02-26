#!/usr/bin/env bash

# emacs-vterm
if [ -n "$INSIDE_EMACS" ]; then
    alias vi='emacsclient -n'
    alias vim='emacsclient -n'
    alias emacs="emacsclient -n"
fi

alias e="emacsclient -n"

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
