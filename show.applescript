on alfred_script(q)
    tell application "System Events"
        set appList to application processes whose visible is false
        repeat with theApplication in appList
            set visible of theApplication to true
        end repeat
    end tell

    tell application "Finder" to set collapsed of every window to false
end alfred_script
