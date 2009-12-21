#!/bin/sh

# chalmers_login.sh logges you in into the Chalmers NOMAD wireless
# network (a university in Gothenbourg where I study). You have to
# chmod 755 it and I recommend to start it via Quicksilver. It uses
# growl to notify you about success or faulire.
#
# Author: Jeena Paradies <spam@jeenaparadies.net>
# This script is public domain.
# This script is OS X only.

USERNAME="uname"
PASSWD="password"

HOST="https://login.nomad.chalmers.se"
QUERY="action=Login&login=$USERNAME/net&org=Radius&password=$PASSWD"
ANSWER=`curl -d "$QUERY" "$HOST"`

if echo "$ANSWER" | grep -q "You are logged in"
then
    MESSAGE="Logged in to NOMAD"
else
    MESSAGE="Failed to login to NOMAD"
fi

growlnotify -n "NOMAD" -m "$MESSAGE"
