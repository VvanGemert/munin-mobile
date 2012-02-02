#!/bin/sh
MUNIN_CONF=/etc/munin/munin-mobile.conf
#
# Updates the graphs, html and resizes the images
#

nice /usr/share/munin/munin-graph --cron --config=$MUNIN_CONF 2>&1 |
        fgrep -v "*** attempt to put segment in horiz list twice"

wait

nice /usr/share/munin/munin-html --config=$MUNIN_CONF || exit 1

# Find images in mobile dir, files, *.png, modified between 0 and 3 minutes, not including images, resize with mogrify

# We no longer resize our images
# find /var/www/munin/mobile/ -type f -name "*.png"  -mmin +0 -mmin -3  -not -wholename "*images/*" -exec mogrify -resize 300 "{}" \;
