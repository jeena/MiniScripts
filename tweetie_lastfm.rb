#!/usr/bin/env ruby

# This script tweets "I'm listening to ..." via
# Tweetie <http://www.atebits.com/tweetie-mac/>
# It gets the information from http://last.fm
# It also adds a Spotify link.

# This script is OS X only.

# This script is public domain
# Author: Jeena Paradies <spam@jeenaparadies.net>
# Written 2009-07-23
# Added spotify support 2009-10-27
# This script is public domain

# Change the username to yours:
username = "yourusername"

# Save the script somewhere, for example:
# ~/Library/Scripts/tweetie_lastfm.rb
#
# Make it executable on the console:
# chmod 755 ~/Library/Scripts/tweetie_lastfm.rb
#
# Use Quicksilver to start it.

require 'uri'
require 'net/http'
require "rexml/document"


# lastfm
url = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=";
url += username;
url += "&api_key=213ac7a42cd7a69b82b7a57c6b067c6c";

xml_str = Net::HTTP.get_response(URI.parse(url)).body
doc = REXML::Document.new(xml_str)
track = doc.root.elements[1].elements[1].elements

song = track["name"].text 
artist = track["artist"].text
album = track["album"].text


# spotify
sp_url = "http://ws.spotify.com/search/1/track.xml?q=#{artist} #{song}"
xml_str = Net::HTTP.get_response(URI.parse(URI.escape(sp_url))).body
doc = REXML::Document.new(xml_str)
unless doc.root.elements["track"].attributes["href"].nil?
	sp_uri = doc.root.elements["track"].attributes["href"] 
	tinyurl = "http://tinyurl.com/api-create.php?url=#{sp_uri}"
	spotify = Net::HTTP.get_response(URI.parse(tinyurl)).body
end

# text for tweet
text = "I\'m listening to „#{song}“ by „#{artist}“"
text << " from the album „#{album}“" unless album.nil?
text << " ♫ #{spotify}"

system("open \"tweetie:#{text}\"")
