#!/bin/sh
xset -dpms # disable DPMS (Energy Star) features.
xset s off # disable screen saver
xset s noblank # don't blank the video device
matchbox-window-manager & qjoypad "Epic-Ninja" &
midori -e Fullscreen -a https://phosphorus.github.io/app.html?id=21554369&turbo=false&full-screen=true
# This uses Phosophorus and Midori to run Epic Ninja by GriffPatch

#Keyboard
#Arrow WASD - Move
# UP/W - Jump
# Space - Attack
# T - Throw
# P - Pause
# M - Music On/Off

#Joystick:
# Button 1,2 (A,B) = Jump
# Buton 4 (Y) = Attack
# Button 3 (X) = Throw
# Button 8 (Start) = Pause
# Button 7 (Select) = Music on/off
