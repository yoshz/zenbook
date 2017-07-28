Zenbook tools
=============

This repository contains a couple of scripts to tweak Ubuntu for Zenbook Flip.
It is tested on Zebook UX330UAK with Ubuntu 17.04.


Gestures
========

To enable swiping on both touchscreen and touchpad make sure you downgrade synaptics first.
This script just automates the downgrade process:

```bash
./downgrade-synaptics.sh
```

To handle the actual swiping you need gesture support by using touchegg.
Install and configure touchegg:

```bash
sudo apt install touchegg
mkdir -p ~/.config/touchegg/
cp touchegg.conf ~/.config/touchegg/
```

The following script will set touchpad settings in Synaptics and starts touchegg:

```bash
./touchpad-gesture.sh
```

You typically want to start this script in the background each time you login by 
adding the script to `Startup Applications`.


Change orientation
==================

The Zenbook Flip can also be used as Tablet or in Tent mode. 
The following script allows you to flip orientation but also disables the keyboard, touchpad and lock screen in Tablet and Tent mode.

```bash
./change-orientation.sh laptop
./change-orientation.sh tent
./change-orientation.sh tablet
```

You probably need the update the device ids on top of the file for your laptop.
Run `xinput list` to see all devices.

I am still unable to configure autorotate because of a [bug](https://github.com/hadess/iio-sensor-proxy/issues/160) in iio-sensor-proxy.
As a workaround I have added each orientation as an application launcher in the menubar so I can switch manually in each orientation mode.


Multiple workspaces
===================

Especially on small screens I like to work with multiple workspaces.
I have add a small scripts that configures 4 workspaces in 1 row.

```bash
./update-workspaces.sh
```

