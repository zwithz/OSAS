(*
## Instructions:

1. Open your way to your application's settings -> Application Keys
2. Assign your `MasterKey` to the variable `master_key`
3. Assign your `AppID` to the variable `app_id`
4. Assign the name of table you created to the variable `class_name`
5. Assign your own api_base_url

This script should be used in Automator, and saved as an Applicaiton.
*)

-- Configuration
set master_key to "masterKey"
set app_id to "appID"
set class_name to "table name"
set api_base_url to "https://first eight characters of your appID.api.lncldglobal.com"

-- Do not change the following code unless you know AppleScript
set input to display dialog "Wasup?" default answer ""
set content to text returned of input
set timestamp to do shell script "date +%s"
set sign to timestamp & master_key
set hash_sign to do shell script "/sbin/md5 -qs" & sign