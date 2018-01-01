#!/bin/bash

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

# Install Mac App Store CLI application
brew install mas

# Install Visual Studio Code (VS Code)
# * password required
brew cask install visual-studio-code

# Install Google Chrome
curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -#o chrome.dmg
sudo hdiutil attach chrome.dmg
cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/
sudo hdiutil detach /Volumes/Google\ Chrome/

# Configure git user info
# git config --global user.email "email@example.com"
# git config user.name "Mona Lisa"

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