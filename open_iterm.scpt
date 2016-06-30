on run {input, parameters}
	tell application "Finder"
		set dir_path to quoted form of (POSIX path of (input as alias))
	end tell
	CD_to(dir_path)
end run

on CD_to(dir_path)
	tell application "iTerm"
		activate
		if (count of windows) = 0 then
			set theWindow to (create window with default profile)
			set theSession to current session of theWindow
		else
			set theWindow to current window
			tell current window
				set theTab to create tab with default profile
				set theSession to current session of theTab
			end tell
		end if
		tell theSession
			write text "cd " & dir_path
		end tell
	end tell
end CD_to
