#!/usr/bin/env ruby

require "twitter"

# dm2twitter.rb looks up the latest direct messages and posts
# them as a update if the sender was in the whitelist.
#
# Licence: BSD
# Author: Jeena Paradies <spam@jeenaparadies.net>
# Dependences: twitter gem <http://twitter.rubyforge.org/>
#
# You could use it with Postfix and add to /etc/aliases
# myuser: myuser, "|/home/myuser/scripts/dm2twitter.rb"
#
# Or you could run it with help of a crontab every couple
# of minutes.

# Change this:
USERNAME = "myusername"
PASSWORD = "mypassword"

SENDER_WHITELIST = %w(oneuser otheruser thirduser)

# If you already have DMs which you don't want to post
# create a new file with just the last ID number of the
# unwanted DMs.
LASTID_PATH = "dm2twitter-lastid.txt"


#
# Do not change this
#
client = Twitter::Base.new(Twitter::HTTPAuth.new(USERNAME, PASSWORD))

lastid = nil
lastid = File.read(LASTID_PATH).to_i if File.writable? LASTID_PATH

client.direct_messages(:since_id => lastid).reverse.each do |message|
  if SENDER_WHITELIST.include? message["sender_screen_name"]
    via = " (via #{message["sender_screen_name"]})"
    update_text = message["text"] + via
    
    unless update_text.length > 140
      client.update(update_text)
    else
      client.direct_message_create(
        message["sender_screen_name"],
        "Sorry your message was too long, was: #{update_text.length} chars, should be: #{140 - via.length} chars."
      )
    end
    File.open(LASTID_PATH, 'w') { |f| f.write(message["id"]) }
  end
end