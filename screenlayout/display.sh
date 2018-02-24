#!/bin/sh
xrandr | grep "HDMI2 disconnected"
if [ $? -eq 1 ]
then
    
xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output DP1 --off --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output DP2 --off
else
#!/bin/sh
xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x80 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off

fi
