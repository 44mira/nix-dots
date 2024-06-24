#!/usr/bin/env bash

# network manager
nm-applet --indicator &

# status bar
waybar &

# notifications
dunst &
