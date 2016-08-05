--- ALERTME!
---
--- version: 2.1.1
--- version date: 2015-10-01
---
--- Changelog: 
--- 	2015-10-01
---			- Now checks if the user triggering has a nickname
--- 		- Now says chat id
---
--- Alertme is a plugin that let you create a sort of Notification Center for telegram
--- 
--- To run this plugin you must install a bot and login with the telegram account 
--- that you want to monitor. 
--- 
--- HOW TO USE
--- 
--- Change "NAME", "SURNAME" and "MIDDLE" with anything you want. 
--- For example i use many versions of my name, my nickname and things like that
--- In order to keep track when people try to call me without @nickname trigger
--- 
--- Create a new group with yourself and the bot you're using
--- If you're yagop bot on your main account, create a group with yourself only
--- Find the id of the group 
--- One way to do is to use the id.lua plugin from original yagop bot 
---
--- The group id is a seven numbers string you must replace
---
---			receiverid = 'chat#id1234567'
---
--- Enable the plugin and you are good to go
---
--- To disable checking change the value of local mcheck = "1"
--- To "0". mcheck= "0" disable mentions checking
--- 

local function run(msg)
local text = string.lower(msg.text)
local origin = get_receiver(msg)
local chat_id = msg.to.id
local chat_name = msg.to.print_name
local mentionflag = msg.mention
local msgflag = msg.flag


-- Empty user name check
if not msg.from.username then
	from_username = "" .. msg.from.print_name
else
	from_username = ('@' .. msg.from.username)
end
--- End of empty user name check ---

--- Checking for trigger words ---
if string.find(text, "NAME") or string.find(text, "SURNAME") or string.find(text, "MIDDLE") then
	local mcheck = "1"
		if string.find(mcheck, "1") then  
			receiverid = 'chat#id1234567'
			texttosend='You got mentioned by ' .. from_username .. 'Chat name:  ' .. chat_name .. 'Chat id:  ' .. chat_id
			do 
				fwd_msg(receiverid, msg.id, ok_cb, false) 
			end
			do 
				send_msg(receiverid, texttosend, ok_cb, false)
				return
			end
		end
-- end of notifier --
else
	return
end 
end

return {
 description = "AlertMe!",
 usage = "Get notified when someone says your name",
 patterns = {
 "^(.+)$"
 }, 
 run = run 
}