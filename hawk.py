#!/usr/bin/env python2
#
# This module lets you create a header for your Hawk authentification.
#
# Usage:
#
# import hawk
# print hawk.mkheader("https://example.com/foo/bar?baz=bum#test", "get", "1234", "5678", "abcdef")
#
# License: This script is public domain.
# Copyright: 2013 Jeena Paradies
#

import string, random, time, datetime, hmac, hashlib, base64
from urlparse import urlparse

def mkheader(url, http_method, hawk_id, key, app_id=None):

	nonce = mknonce(8)
	parsed_url = urlparse(url)

	n = datetime.datetime.now()
	time_stamp = str(time.mktime(n.timetuple()))

	port = parsed_url.port
	if not port:
		if parsed_url.scheme == "https":
			port = "443"
		else:
			port = "80"

	fragment = ""
	if parsed_url.fragment:
		fragment = "#" + parsed_url.fragment

	normalized_string = "hawk.1.header\n"\
		+ time_stamp + "\n"\
		+ nonce + "\n"\
		+ http_method.upper() + "\n"\
		+ parsed_url.path + parsed_url.query + fragment + "\n"\
		+ parsed_url.hostname.lower() + "\n"\
		+ str(port) + "\n"\
		+ "\n\n" # we don't use payload yet and we don't use ext

	app = ""

	if app_id:
		app = ", app=\"" + app_id + "\"" # we need this later in the header
		normalized_string += app_id + "\n\n" # adding app_id to the string and delegate should be empty

	mac = base64.encodestring(hmac.new(key, normalized_string, hashlib.sha256).digest())

	return 'Hawk id="' + hawk_id + '", mac="' + mac + '", ts="' + time_stamp + '", nonce="' + nonce + '"' + app

def mknonce(length=6, chars=(string.ascii_uppercase + string.digits)):
	return ''.join(random.choice(chars) for x in range(length))

if __name__ == "__main__":
	print mkheader("https://example.com/foo/bar?baz=bum#test", "get", "1234", "5678", "abcdef")