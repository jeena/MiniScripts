#!/bin/sh

filename=$1
if [ -z $1 ]; then filename="latest"; fi
	
screencapture -i "/tmp/latest-screenshot.png"

if [ -r /tmp/latest-screenshot.png ]
then
	scp /tmp/latest-screenshot.png me@example.com:~/htdocs/s/$filename.png
	rm /tmp/latest-screenshot.png
	echo "http://example.com/s/$filename.png" | pbcopy
	growl -nosticky "Screenshot ready"
fi
