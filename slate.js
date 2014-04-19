var activateKey = "ctrl;cmd;space";

var FULLSCREEN_ORDER = [
	/Terminal/,
	/Sublime Text/,
	/Safari/,
	/Mail/
];


processFullscreenApps = function(toggle) {

	FULLSCREEN_ORDER.forEach(function(name) {

		slate.eachApp(function (app) {

			var appName = app.name();

			if (appName.match(name)) {

/*jshint multistr: true */
// var cmd = '/usr/bin/osascript -e \' \
//   set theapp to "' + appName + '" \
//     set toggleOnFull to "' + toggle.toString() + '" \
// \
//   tell application theapp \
//     activate \
//     delay 0.3 \
//     set isfullscreen to false \
//     tell application "System Events" to tell process theapp \
//       set isfullscreen to value of attribute "AXFullScreen" of window 1 \
//     end tell \
// \
//     if isfullscreen is toggleOnFull then \
//       tell application "System Events"  \
//         keystroke "f" using { command down, control down } \
//       end tell \
//       delay 1.2 \
//     end if \
//   end tell \
// \'';

				var cmd = '~/bin/makeFullScreen.applescript "' + appName + '" ' + toggle.toString();
				// slate.log(cmd);
				slate.shell(cmd, true);
			}
		});
	});
};

slate.bind("f" + ":" + activateKey, function() {
	processFullscreenApps(true);
});

slate.bind("d" + ":" + activateKey, function() {
	processFullscreenApps(false);
});
