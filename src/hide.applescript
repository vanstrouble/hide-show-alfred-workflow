tell application "Finder"
    -- Hide all visible processes except Finder
    set visible of (every process whose visible is true and name is not "Finder") to false

    -- Collapse all Finder windows
    set collapsed of (every window) to true

end tell
