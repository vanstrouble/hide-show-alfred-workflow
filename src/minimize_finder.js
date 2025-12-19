#!/usr/bin/osascript -l JavaScript
(() => {
	const finder = Application("Finder");
	finder.includeStandardAdditions = true;

	if (!finder.running()) {
		return;
	}

	try {
		finder.windows.whose({ collapsed: false }).collapsed.set(true);
	} catch (e) {
        console.log(e);
	}
})();
