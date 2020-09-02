#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Usage: $0 <aliasesDir>"
    echo "Eg. $0 ~/nextcloud"
    exit
fi

aliasesDir="$1"

# Mail

mkdir -p ~/.mutt
mkdir -p ~/.mutt/vic-smalldata-tech/headers
mkdir -p ~/.mutt/vic-smalldata-tech/bodies
touch ~/.mutt/certificates

cd ~/.mutt
ln -s $aliasesDir/aliases aliases
ln -s ~/vic-config/mutt/common.muttrc common.muttrc
ln -s ~/vic-config/mutt/mutt-signature signature
ln -s ~/vic-config/mutt/vic-smalldata-tech.muttrc vic-smalldata-tech.muttrc

cd ~
ln -s ~/vic-config/mutt/mailcap .mailcap
ln -s ~/vic-config/mutt/muttrc .muttrc


# Vim

cd ~
ln -s ~/vic-config/vimrc .vimrc

# VSCode

cd ~/.config/Code/User
rm settings.json
ln -s ~/vic-config/vscode/settings.json settings.json
rm keybindings.json
ln -s ~/vic-config/vscode/keybindings.json keybindings.json

# Git

cd ~
ln -s ~/vic-config/git/gitconfig .gitconfig
ln -s ~/vic-config/git/githelpers .githelpers

# Starship

cd ~/.config
ln -s ~/vic-config/starship.toml starship.toml


