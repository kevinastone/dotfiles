var activateKey = "ctrl;cmd;space";

var FULLSCREEN_ORDER = [
	/Terminal/,
	/Sublime Text/,
	/Safari/,
	/Slack/,
	/Mail/,
];


processFullscreenApps = function(toggle) {

	FULLSCREEN_ORDER.forEach(function(name) {

		slate.eachApp(function (app) {

			var appName = app.name();

			if (appName.match(name)) {

/*jshint multistr: true */
var cmd = '/usr/bin/osascript -e \' \n\
  set theapp to "' + appName + '" \n\
    set toggleOnFull to ' + (!toggle).toString() + ' \n\
    \
  tell application theapp \n\
      activate \n\
      delay 0.3 \n\
      set isfullscreen to false \n\
      tell application "System Events" to tell process theapp \n\
        set isfullscreen to value of attribute "AXFullScreen" of window 1 \n\
      end tell \n\
      \
    if isfullscreen is toggleOnFull then \n\
          tell application "System Events"  \n\
            keystroke "f" using { command down, control down } \n\
          end tell \n\
          delay 1.2 \n\
        end if \n\
      end tell \n\
      \'';
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
