#!/usr/bin/osascript -l JavaScript

(() => {
	try {
        ObjC.import("stdlib");
		const systemEvents = Application("System Events");
        const status = $.getenv("minf") || "0";

        if (status === "1") {
            const finder = Application("Finder");
            finder.windows.whose({ collapsed: true }).collapsed.set(false);
        }
		// Get a reference to application processes that are not visible
		// and set their 'visible' property to true in a single operation.
		systemEvents.applicationProcesses.whose({ visible: false }).visible.set(true);

		return "Success! All hidden applications are now visible.";
	} catch (e) {
		// Return error message for Alfred to display
		return "Error: " + e.message;
	}
})();
