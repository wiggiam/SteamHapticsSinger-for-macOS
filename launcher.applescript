set binaryPath to POSIX path of (path to me) & "Contents/MacOS/steam-haptics-singer"

-- Menu
set featureChoice to choose from list {"Standard Playback", "Swap Rumble & Trackpad Channels (-s)", "Limit to Two Channels (-t)", "Swap & Limit to Two Channels (-s, -t)", "Repeat Song (-p)", "Direct Velocity Control (-e)"} with title "Steam Haptics Singer Beta" with prompt "Choose a haptic playback mode:" default items {"Standard Playback"} without multiple selections allowed and empty selection allowed

if featureChoice is false then return -- Exit cleanly if user clicks cancel

-- Flag Mapping
set hapticFlag to ""
if item 1 of featureChoice is "Swap Rumble & Trackpad Channels (-s)" then
	set hapticFlag to " -s"
else if item 1 of featureChoice is "Limit to Two Channels (-t)" then
	set hapticFlag to " -t"
else if item 1 of featureChoice is "Swap & Limit to Two Channels (-s, -t)" then
	set hapticFlag to " -s -t"
else if item 1 of featureChoice is "Repeat Song (-p)" then
	set hapticFlag to " -p"
else if item 1 of featureChoice is "Direct Velocity Control (-e)" then
	set hapticFlag to " -e"
end if

-- Selecting MIDI file
set midiFile to choose file with prompt "Find a MIDI file (.mid) to play:" of type {"mid", "midi"}
set midiPath to POSIX path of midiFile

tell application "Terminal"
	activate
	do script "sudo " & quoted form of binaryPath & hapticFlag & " " & quoted form of midiPath
end tell
