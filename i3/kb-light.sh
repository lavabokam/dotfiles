KB_SYS_DIR=/sys/class/leds/smc::kbd_backlight/

MAX_BRIGHTNESS=$(cat $KB_SYS_DIR/max_brightness)
CURRENT_BRIGHTNESS=$(cat $KB_SYS_DIR/brightness)

if [ -z $1 ]; then
    echo "kb-light requires an postive or negative integer value"
    echo "example sh kb-light.sh -5"
    echo $CURRENT_BRIGHTNESS
fi

BRIGHTNESS=$(($CURRENT_BRIGHTNESS+$1))

if [ $BRIGHTNESS -gt $MAX_BRIGHTNESS ]; then
    BRIGHTNESS=$MAX_BRIGHTNESS
elif [ $BRIGHTNESS -lt 0 ]; then
    BRIGHTNESS=0
fi

echo $BRIGHTNESS > $KB_SYS_DIR/brightness
