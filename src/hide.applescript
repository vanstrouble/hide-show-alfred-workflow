tell application "Finder"
    -- Hide all visible processes except Finder
    set visible of (every process whose visible is true and name is not "Finder") to false

    -- Collapse all Finder windows
    set collapsed of (every window) to true

    -- Optional: Uncomment the following lines if needed
    -- close every window
    -- open home
    -- set the current view of the front Finder window to icon view
    -- set the position of the front Finder window to {1000, 500}
end tell
