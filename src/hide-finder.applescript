tell application "System Events"
    -- Ocultar todos los procesos visibles excepto Finder
    set visible of (every process whose visible is true and name is not "Finder") to false
end tell

tell application "Finder"
    -- Colapsar todas las ventanas de Finder
    if (count of windows) > 0 then
        repeat with w in windows
            set collapsed of w to true
        end repeat
    end if
end tell
