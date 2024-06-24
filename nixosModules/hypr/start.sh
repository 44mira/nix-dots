#!/usr/bin/env bash

# wallpaper
swww init &
swww img & ~/Pictures/nixchan.png

# network manager
nm-applet --indicator &

# status bar
waybar &

# notifications
dunst &
