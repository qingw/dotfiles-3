#!/bin/bash

# check if ssh key exist
if ! [ -f "$HOME/.ssh/id_rsa" ]; then
    echo "please copy your ssh key first"
    exit 1
fi

# install xcode commandline tools
# if ! [ -d "/Library/Developer/CommandLineTools" ]; then
if ! /usr/sbin/pkgutil --pkg-info com.apple.pkg.CLTools_Executables; then
    echo "install Xcode CommandLine Tools"
    # This file prompts that Command Line Tools should be installed
    sudo /usr/bin/touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    sudo /usr/sbin/softwareupdate -i "$(/usr/sbin/softwareupdate -l | /usr/bin/grep -B 1 -E "Command Line (Developer|Tools)" | /usr/bin/awk -F"*" '/^ +\\*/ {print $2}' | /usr/bin/sed 's/^ *//' | /usr/bin/tail -n1)"
    sudo /bin/rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    # sudo /usr/bin/xcode-select --switch /Library/Developer/CommandLineTools
fi

# if ! [ -d "/Library/Developer/CommandLineTools" ]; then
if ! /usr/sbin/pkgutil --pkg-info com.apple.pkg.CLTools_Executables; then
    echo "install Xcode CommandLine Tools failed, Please install it manually"
    sudo /usr/bin/xoode-select --install
    exit 1
fi

# install homebrew
if ! [ -f "/usr/local/bin/brew" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

git clone git@github.com:SteamedFish/dotfiles.git
cd ~/dotfiles && git submodule update --init --recursive --remote

# install Xcode
/usr/local/bin/brew install mas
if ! /usr/local/bin/mas account; then
    /usr/local/bin/mas signin steamedfish@me.com
fi
xcode_id=$(/usr/local/bin/mas search Xcode | /usr/bin/grep -E '^[0-9]* *Xcode$' | /usr/bin/awk '{print $1}')
/usr/local/bin/mas install ${xcode_id}

# accept Xcode license
sudo xcodebuild -license accept

if [[ "$(kextstat | grep "FakeSMC")" != "" ]]; then
    # disable computer sleep
    sudo pmset -a sleep 0
fi
