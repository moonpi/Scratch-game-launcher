#!/bin/sh
xset -dpms # disable DPMS (Energy Star) features.
xset s off # disable screen saver
xset s noblank # don't blank the video device
matchbox-window-manager & qjoypad "FOIL-Mario" &
midori -e Fullscreen -a https://phosphorus.github.io/app.html?id=146916513&turbo=false&full-screen=true
# This uses Phosophorus and Midori to run Geometry Jump by Punkbass 
# (Based on Unit 8 from BootStrap World: http://www.bootstrapworld.org/materials/spring2017/courses/bs1/units/unit8/index.html )
