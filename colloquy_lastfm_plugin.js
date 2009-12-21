/**
 * This Colloquy <http://colloquy.info> plugin posts a
 * "/me is listening to ..." into the chanel you are
 * talking on in IRC.
 *
 * Save this plugin into:
 * ~/Library/Application Support/Colloquy/PlugIns/colloquy_lstfm_plugin.js
 *
 * Restart Colloquy to load the plugin (/reload plugins doesn't always work).
 *
 * Usage:
 * /lastfm help        => to show the help
 * /lastfm username    => to set user last.fm username (e.g.: /lastfm johndoe)
 * /lastfm getusername => to see your default last.fm username
 *
 * Author: Jeena Paradies <spam@jeenaparadies.net>
 * This plugin is public domain.
 * This plugin is OS X Colloquy <http://colloquy.info> only.
 */

function processUserCommand( command, arguments, connection, view ) {
    
	if(command.toLowerCase() == "lastfm") {
	    
	    arguments = arguments.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	    
	    function sendMessage(message) {
            view.echoSentMessageToDisplay(new JVMutableChatMessage(
	            message,
	            connection.localUser())
	        );
	    }

        var defaults = new NSUserDefaults();
        
        if(arguments.length > 0 && arguments != "help" && arguments != "getusername") {
            
            var new_username = arguments;
            defaults.setObject_forKey_(new_username, "lastfmUsername");
            
        }
        else if(arguments == "help") {
                
            sendMessage('use „/lastfm help“ to show this help');
            sendMessage('use „/lastfm username“ to set user last.fm username (e.g.: /lastfm johndoe)');
            sendMessage('use „/lastfm getusername“ to see your default last.fm username');
            return false;
                
        }
        else if(arguments == "getusername") {
                
            sendMessage('your default last.fm username is: ' + defaults.stringForKey("lastfmUsername"));
            return false;
                
        }
        
	    if(typeof defaults.stringForKey("lastfmUsername") == "undefined") {

	        sendMessage('use „/lastfm username“ to set user last.fm username (e.g.: /lastfm johndoe)');
	        
	        return false;
	    }

	    var req = new XMLHttpRequest();
	    
        req.onreadystatechange = function () {
            if(req.readyState == 4) {

                if(
                    req.responseXML.getElementsByTagName("lfm")[0].getAttribute("status") == "failed" ||
                    req.responseXML.getElementsByTagName("track").length == 0
                ) sendMessage('user ' + defaults.stringForKey("lastfmUsername") + ' not found on last.fm');
                else {
                    
                    if(new_username) {
                        
                        sendMessage('last.fm username is now set to ' + defaults.stringForKey("lastfmUsername"));
                        
                    }
                    else {
                        
                        var track = req.responseXML.getElementsByTagName("track")[0];

                        function get(name) {
                	        if(
                	            track.getElementsByTagName(name) &&
                	            track.getElementsByTagName(name)[0] &&
                	            track.getElementsByTagName(name)[0].firstChild &&            	            
                	            track.getElementsByTagName(name)[0].firstChild.nodeValue &&
                	            track.getElementsByTagName(name)[0].firstChild.nodeValue.length > 0
                	        ) return track.getElementsByTagName(name)[0].firstChild.nodeValue;
                	    }

                        var text = 'is listening to „';
                        text += get("name");
                        text += "“ by „";
                        text += get("artist");
                        text += "“"

                        if(get("album")) {
                            text += " from the album „";
                            text += get("album") + "“";
                        }

                        var msg = new JVMutableChatMessage(text, connection.localUser());                        
                        msg.setAction(true);
                        view.sendMessage(msg);
                        view.echoSentMessageToDisplay(msg);
                    }
        	    }
            }
        }
        
        var url = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=";
        url += defaults.stringForKey("lastfmUsername");
        url += "&api_key=213ac7a42cd7a69b82b7a57c6b067c6c";
        
	req.open('GET', url, true);
        req.send(null);

	    return true;
            
	}
	
	return false;
}
