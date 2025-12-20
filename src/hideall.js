#!/usr/bin/osascript -l JavaScript
(() => {
    try {
        ObjC.import("stdlib");
        const systemEvents = Application("System Events");
        const status = $.getenv("minf") || "0";

        if (status === "1") {
            Application("Finder").activate();
            systemEvents.keystroke("h", { using: ["command down", "option down"] });
            systemEvents.keystroke("m", { using: ["command down", "option down"] });
            delay(0.2);
            return "Success! Show all and unminimize Finder";
        }

        systemEvents.keystroke("h", { using: ["command down", "option down"] });
        delay(0.2);
        return "Success! Hide all windows except the frontmost one";
    } catch (e) {
        return "Error: " + e;
    }
})();
