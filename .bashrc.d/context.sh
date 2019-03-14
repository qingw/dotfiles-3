#!/usr/bin/env bash

# ConTeXt minimals
if [ -d "$HOME/ConTeXt" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if ! [ -f '/etc/paths.d/ConTeXt' ]; then
            echo "please run sudo echo $HOME/ConTeXt/tex/texmf-osx-64/bin > /etc/paths.d/ConTeXt"
        fi
        export OSFONTDIR="/Library/Fonts/;/System/Library/Fonts/;$HOME/Library/Fonts/"
        break
    elif [ "$OSTYPE" == "linux-gnu" ]; then
        export PATH="$PATH:$HOME/ConTeXt/tex/texmf-linux-64/bin"
        export OSFONTDIR="/usr/local/share/fonts;$HOME/.fonts"
        break
    fi
fi
