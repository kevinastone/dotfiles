{
  lib,
  pkgs,
  onepassword-shell-plugins,
  ...
}:
{
  imports = [
    onepassword-shell-plugins.hmModules.default
  ];

  # Only linux can be installed via nixpkgs
  home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    pkgs._1password-gui
    pkgs._1password-cli
  ];

  # Use homebrew for MacOS
  homebrew.casks = lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
    "1password"
    "1password-cli"
  ];

  homebrew.masApps = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    "1Password for Safari" = 1569813296;
  };

  programs._1password-shell-plugins.enable = true;
  # programs._1password-shell-plugins.plugins = with pkgs; [];

  programs.ssh.settings = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    "~1password" = {
      header = ''Match host * exec "test -S ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"'';
      IdentityAgent = ''"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"'';
    };
  };

  # Enable 1Password as the macOS AutoFill / passkey provider and disable Apple Passwords AutoFill
  home.activation.configure1PasswordMacOSAutoFill = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin (
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      safari_prefs_dir="$HOME/Library/Containers/com.apple.Safari/Data/Library/Preferences"
      safari_container_plist="$safari_prefs_dir/com.apple.Safari.plist"
      if [ -d "$safari_prefs_dir" ]; then
        if ! (
          $DRY_RUN_CMD /usr/bin/defaults write "$safari_container_plist" AutoFillPasswords -bool true &&
          $DRY_RUN_CMD /usr/bin/defaults write "$safari_container_plist" AutoFillPasswordsInSafari -bool true &&
          $DRY_RUN_CMD /usr/bin/defaults write "$safari_container_plist" AutoFillFromiCloudKeychain -bool false
        ); then
          echo "warning: could not write Safari AutoFill preferences at $safari_container_plist (grant Full Disk Access to your terminal in System Settings -> Privacy & Security -> Full Disk Access)" >&2
        fi
      fi

      $DRY_RUN_CMD /usr/bin/defaults write com.apple.Safari PreferredCredentialProviderForSaving -string "com.1password.1password.autofill-extension"

      if [ -d "/Applications/1Password.app" ]; then
        $DRY_RUN_CMD /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f "/Applications/1Password.app" || true
        if ! $DRY_RUN_CMD /usr/bin/pluginkit -e use -i com.1password.1password.autofill-extension; then
          echo "warning: pluginkit could not enable com.1password.1password.autofill-extension (requires an active macOS GUI session)" >&2
        fi
      fi
    ''
  );
}
