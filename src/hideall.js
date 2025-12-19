#!/usr/bin/osascript -l JavaScript
(() => {
	const systemEvents = Application("System Events");

	// Hide all apps except Finder
	try {
		const processes = systemEvents.processes();

		for (let i = 0; i < processes.length; i++) {
			try {
				const process = processes[i];
				if (process.visible() && process.name() !== "Finder") {
					process.visible = false;
				}
			} catch (e) {
				// Ignore if properties can't be read or set for a process
			}
		}
	} catch (e) {
		console.log(e);
	}
})();
