#!/bin/bash -e

SCREEN=eDP-1
KEYBOARD=15
TOUCHPAD=12
TOUCHSCREEN=13

case $1 in
    laptop)
	xinput set-prop "${TOUCHPAD}" "Device Enabled" 1  # Sets touchpad to active
	xinput set-prop "${KEYBOARD}" "Device Enabled" 1  # Sets keyboard to active
	xinput set-prop "${TOUCHSCREEN}" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1  # Sets touchscreen input orientation to normal
	xrandr --output ${SCREEN} --rotate normal  # Sets display orientation to normal
	dbus-send --type=method_call --dest=org.onboard.Onboard /org/onboard/Onboard/Keyboard org.onboard.Onboard.Keyboard.Hide # Hides Onboard
	dconf write /org/gnome/desktop/screensaver/ubuntu-lock-on-suspend true # Enables lock screen on wakeup
	dconf write /org/gnome/desktop/screensaver/lock-enabled true # Enables lock screen when is screensaver enabled
	;;

    tent)
	xrandr --output ${SCREEN} --rotate inverted  # Sets display orientation to inverted
	xinput set-prop "${TOUCHPAD}" "Device Enabled" 0  # Sets touchpad to inactive
	xinput set-prop "${KEYBOARD}" "Device Enabled" 0  # Sets keyboard to inactive
	xinput set-prop "${TOUCHSCREEN}" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1  # Sets touchscreen input orientation to inverted
	dconf write /org/gnome/desktop/screensaver/ubuntu-lock-on-suspend false # Disables lock screen on wakeup
	dconf write /org/gnome/desktop/screensaver/lock-enabled false # Disables lock screen when is screensaver enabled
	;;

    tablet)
	xrandr --output ${SCREEN} --rotate right  # Sets display orientation to right
	xinput set-prop "${TOUCHPAD}" "Device Enabled" 0  # Sets touchpad to inactive
	xinput set-prop "${KEYBOARD}" "Device Enabled" 0  # Sets keyboard to inactive
	xinput set-prop "${TOUCHSCREEN}" "Coordinate Transformation Matrix"  0 1 0 -1 0 1 0 0 1  # Sets touchscreen input orientation to right
	dconf write /org/gnome/desktop/screensaver/ubuntu-lock-on-suspend false # Disables lock screen on wakeup
	dconf write /org/gnome/desktop/screensaver/lock-enabled false # Disables lock screen when is screensaver enabled
	;;

    *)
	echo "Unknown mode: $1"
	exit 1
esac

