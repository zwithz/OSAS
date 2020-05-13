(*
## Instructions:

1. Open your way to your application's settings -> Application Keys
2. Assign your `MasterKey` to the variable `master_key`
3. Assign your `AppID` to the variable `app_id`
4. Assign the name of table you created to the variable `class_name`
5. Assign your own api_base_url

This script should be used in Automator, and saved as an action.
*)

on run {input, parameters}
	
    -- Configuration
    set master_key to "masterKey"
    set app_id to "appID"
    set class_name to "table name"
    set api_base_url to "https://first eight characters of your appID.api.lncldglobal.com"
	
	-- Do not change the following code unless you know AppleScript
	set input_dialog to display dialog "Wasup?" default answer ""
	set extra to text returned of input_dialog
	set length_of_extra to the length of extra
	set content to "<i>" & input & "</i>"
	if length_of_extra > 0 then
		set content to content & "<br>" & extra
	end if

	set timestamp to do shell script "date +%s"
	set sign to timestamp & master_key
	set hash_sign to do shell script "/sbin/md5 -qs" & sign
	
	set result to do shell script "curl -X POST -H \"X-LC-Id: " & app_id & "\" -H \"X-LC-Sign: " & hash_sign & "," & timestamp & ",master\" -H \"Content-Type: application/json\" -d '{\"content\": \"" & content & "\"}' " & api_base_url & "/1.1/classes/" & class_name
	display dialog result
	
	return input
end run