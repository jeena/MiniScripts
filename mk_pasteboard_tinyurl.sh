#!/bin/sh

# tinyurl.sh takes a url from the message buffer and
# turns it to a TinyURL which its writes back to it

curl -s http://tinyurl.com/api-create.php?url=`pbpaste` | pbcopy
growlnotify "TinyURL" -m `pbpaste`