-- export_mailadresses.scpt exports all email addresses
-- which you don't have already in your AddressBook.app
-- and which are not spam mails.
--
-- Author: Jeena Paradies <spam@jeenaparadies.net>
-- This script is only OS X and Mail.app
--
-- How to use:
-- 1. Open AppleScript-Editor.app
-- 2. Copy & Paste this script into the ScriptEditor
-- 3. Save this script somewhere, for example in ~/Library/Scripts/
-- 4. Open up Mail.app
-- 5. Create a new rule (you can find this in preferences)
-- 6. Select "User is not in AddressBook" as the first rule
-- 7. Select "Run AppleScript"
-- 8. Chose the script and press "OK"
-- 9. If it asks you to run this script on existing mails, press "No"
-- 10. Mark all emails you want to export mails from
-- 11. In the menu use "Mail -> Apply Rules"
-- 12. Check the mail_export.csv file on your Desktop, you're done

on perform_mail_action(info)
	
	tell application "Mail"
		set the_export_location to "~/Desktop/mail_export.csv"
		set the_messages to |SelectedMessages| of info
		repeat with a_message in the_messages
			set the_sender to extract address from sender of a_message
			if (junk mail status of a_message) is not true then
				do shell script "if ! grep -q " & the_sender & " " & the_export_location & "
				then
					echo " & the_sender & " >> " & the_export_location & "
				fi"
			end if
		end repeat
	end tell
	
end perform_mail_action
