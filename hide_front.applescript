on alfred_script(q)
    tell application "System Events"
        -- Get the frontmost application
        set frontApp to name of first application process whose frontmost is true

        -- Hide all visible processes except the frontmost application and Finder
        set visible of (every process whose visible is true and name is not frontApp and name is not "Finder") to false
    end tell

    tell application "Finder"
        -- Minimize all Finder windows
        set collapsed of (every window) to true
    end tell
end alfred_script
