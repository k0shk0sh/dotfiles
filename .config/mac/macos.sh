#!/usr/bin/env bash

# -- Global {{{1
# --------------------------------------------------------------------------------------------------

# Show all files everywhere. Even in open dialog.
defaults write -g AppleShowAllFiles -bool true

# Don't write .DS_Store files to portable storages
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# -- Dock {{{1
# --------------------------------------------------------------------------------------------------

# Fully resize Dock's body.
defaults write com.apple.dock tilesize -int 39

killall Dock

# }}} vim: foldmethod=marker : foldlevel=0
