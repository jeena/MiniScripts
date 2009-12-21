#!/bin/sh

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
