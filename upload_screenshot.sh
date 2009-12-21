#!/bin/sh

# upload_screenshot.sh takes a screenshot and load it up
# to a specified place on your server and copies the URL
# to the pasteboard so you can paste it in a chat, mail, etc.
# You have to use SSH login without password <http://linuxproblem.org/art_9.html>
#
# You can pass it a parameter with a differens file name (without .png),
# without it the filename will be latest.png
#
# I recommend to use Quicksilver to start this script. You have to chmod 755 it
# before you can run it.
# 
# Autor: Jeena Paradies <spam@jeenaparadies.net>
# This script is public domain.
# This script is OS X only.

# scp style server path:
server_path="me@example.com:~/htdocs/screens/"

# url to the server
server_url="http://example.com/screens/"


filename=$1
if [ -z $1 ]; then filename="latest"; fi
	
screencapture -i "/tmp/latest-screenshot.png"

if [ -r /tmp/latest-screenshot.png ]
then
	scp /tmp/latest-screenshot.png $server_path$filename.png
	rm /tmp/latest-screenshot.png
	echo "$server_url$filename.png" | pbcopy
	growl -nosticky "Screenshot ready"
fi
