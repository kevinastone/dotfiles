_: {
  system.defaults.CustomSystemPreferences."com.apple.Safari" = {
    #!/usr/bin/env bash

    ###############################################################################
    # Safari & WebKit  #
    ###############################################################################

    # Setup new window and tab behvior
    # 0: Homepage
    # 1: Empty Page
    # 2: Same Page
    # 3: Bookmarks
    # 4: Top Sites
    NewTabBehavior = 1;
    NewWindowBehavior = 1;

    # Remove downloads list items
    # 0: Manually
    # 1: When Safari Quits
    # 2: Upon Successful Download
    DownloadsClearingPolicy = 2;

    # Show the full URL in the address bar (note: this still hides the scheme)
    ShowFullURLInSmartSearchField = true;

    # Set Safari’s home page to `about:blank` for faster loading
    HomePage = "about:blank";

    # Hide Safari’s bookmarks bar by default
    ShowFavoritesBar = false;

    # Enable the Develop menu and the Web Inspector in Safari
    IncludeDevelopMenu = true;
    WebKitDeveloperExtrasEnabledPreferenceKey = true;

    # Disable AutoFill
    AutoFillPasswords = false;
    AutoFillCreditCardData = false;
    AutoFillMiscellaneousForms = false;

    # Enable “Do Not Track”
    SendDoNotTrackHTTPHeader = true;

    # Show status bar
    ShowStatusBar = true;
  };
}
