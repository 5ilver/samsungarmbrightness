#!/bin/bash
# Quick brightness control script for samsung series 3 arm chromebook running chrubuntu 12.04
# Put this in /usr/local/bin/blight.sh
# Run chroot +x /usr/local/bin/blight.sh 
# Add a line like this to /etc/sudoers:
# silver ALL=NOPASSWD:/usr/local/bin/blight.sh
# now use it like this:
# silver@chrubuntu:~$ sudo blight.sh up
# silver@chrubuntu:~$ sudo blight.sh down
# For maximum babe appeal, add an alias
# silver@chrubuntu:~$ echo 'alias bl="sudo blight.sh"' >> ~/.bashrc; source ~/.bashrc
# silver@chrubuntu:~$ bl up
# silver@chrubuntu:~$ bl down
 
changeamount="200"
brightnessfile="/sys/devices/platform/s3c24xx-pwm.0/pwm-backlight.0/backlight/pwm-backlight.0/brightness"

if [ "$1" == "down" ]; then
echo "$(cat $brightnessfile) - $changeamount" | bc > $brightnessfile 
fi;

if [ "$1" == "up" ]; then
echo "$(cat $brightnessfile) + $changeamount" | bc > $brightnessfile 
fi;
