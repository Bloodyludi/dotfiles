#! /usr/bin/env bash

echo "Setting macOS defaults..."

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# No bouncing icons
defaults write com.apple.dock no-bouncing -bool true

# Disable hot corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add \
    '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.jetbrains.intellij;}'
