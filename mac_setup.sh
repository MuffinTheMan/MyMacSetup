#!/bin/bash

source user_settings.config

# Update KeyRepeat speed/interval (see http://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x)
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

# Update trackpad settings to allow 'touch to click' (see http://osxdaily.com/2014/01/31/turn-on-mac-touch-to-click-command-line/)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Update scrolling to be 'un-natural' (see https://github.com/mathiasbynens/dotfiles/blob/master/.osx)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Hide apps not frequently used from dashboard (this will hide all, intitially--see https://github.com/mathiasbynens/dotfiles/blob/master/.osx)
defaults write com.apple.dock persistent-apps -array

# Automatically hide and show the Dock (see https://github.com/mathiasbynens/dotfiles/blob/master/.osx)
defaults write com.apple.dock autohide -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app (see https://github.com/mathiasbynens/dotfiles/blob/master/.osx)
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Disable guest user

# Install Homebrew
# * Confirmation and password required
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install MySQL
brew install mysql

# Install Mac App Store CLI application
brew install mas

# Install Visual Studio Code (VS Code)
# * password required
brew cask install visual-studio-code

# Install MacDown
brew cask install macdown

# Install Google Chrome
curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -#o chrome.dmg
sudo hdiutil attach chrome.dmg
cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/
sudo hdiutil detach /Volumes/Google\ Chrome/
rm chrome.dmg

# Install VirtualBox
curl http://download.virtualbox.org/virtualbox/5.2.4/VirtualBox-5.2.4-119785-OSX.dmg -#o vb.dmg
sudo hdiutil attach vb.dmg
sudo installer -package /Volumes/VirtualBox/VirtualBox.pkg -target /
sudo hdiutil detach /Volumes/VirtualBox
rm vb.dmg

# Install Vagrant
curl https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.dmg?_ga=2.43116581.1083987675.1515273065-704791525.1515273065  -#o vagrant.dmg
sudo hdiutil attach vagrant.dmg
sudo installer -package /Volumes/Vagrant/vagrant.pkg -target /
sudo hdiutil detach /Volumes/Vagrant
rm vagrant.dmg

# Install MAMP * For some reason, this "works" but doesn't. It installs it, but MySQL doesn't start. Installing manually worked. *
# curl http://downloads2.mamp.info/MAMP-PRO/releases/4.2.1/MAMP_MAMP_PRO_4.2.1.pkg -#o mamp.pkg
# sudo installer -package mamp.pkg -target /
# rm mamp.pkg

# Install Node
curl https://nodejs.org/dist/v8.9.3/node-v8.9.3.pkg -#o node.pkg
sudo installer -package node.pkg -target /
rm node.pkg

# Wrong URL--not a DMG
# curl https://www.dropbox.com/download?os=mac -#o dropbox.dmg
# sudo hdiutil attach dropbox.dmg

# Configure git user info
git config --global user.email $git_email
git config user.name $git_username

# Install git-flow
# brew install git-flow

# Install PHP 7.0
# brew tap homebrew/php
# brew install php70

# Laravel Homestead--follow guide

# Create ~/.profile to setup aliases
echo 'alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias la="ls -a"
alias ll="ls -l"' > ~/.profile
source ~/.profile

# Install all recommended updates
softwareupdate -ir

# Restart computer in order for all changes to take effect
# * Password required
sudo shutdown -r now