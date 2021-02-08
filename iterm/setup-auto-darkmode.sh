#!/usr/bin/env sh

mkdir -p ~/Library/Application\ Support/iTerm2/Scripts/AutoLaunch
rm -f ~/Library/Application\ Support/iTerm2/Scripts/AutoLaunch/switch_automatic.py
ln -s `pwd`/switch_automatic.py ~/Library/Application\ Support/iTerm2/Scripts/AutoLaunch
echo "Enable script in Scripts->AutoLunch menu in iTerm"
