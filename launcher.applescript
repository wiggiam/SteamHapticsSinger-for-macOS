set binaryPath to POSIX path of (path to me) & "Contents/MacOS/steam-haptics-singer"

-- Menu
set featureChoice to choose from list {"Trackpads & Back Rumble Haptics", "Trackpad Haptics Only (-t)", "Back Rumble Haptics Only (-b)", "Repeat Song (-p)", "Direct Velocity Control (-e)"} with title "Steam Haptics Singer" with prompt "Choose a haptic playback mode:" default items {"Trackpads & Back Rumble Haptics"} without multiple selections allowed and empty selection allowed

if featureChoice is false then return -- Exit cleanly if user clicks cancel

-- Flag Mapping
set hapticFlag to ""
if item 1 of featureChoice is "Trackpad Haptics Only (-t)" then
	set hapticFlag to " -t"
else if item 1 of featureChoice is "Back Rumble Haptics Only (-b)" then
	set hapticFlag to " -b"
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
