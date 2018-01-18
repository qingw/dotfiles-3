#!/bin/bash

source ~/.bashrc

if [ -n "$(command -v figlet)" ];then
    figlet -f doh -w 300 SteamedFish
fi

if [ -n "$(command -v archey)" ];then
    archey -c -o
fi


test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
