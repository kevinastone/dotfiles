_: {
  homebrew.casks = [
    "transmission"
  ];

  system.defaults.CustomSystemPreferences."org.m0k.transmission" = {
    # Don’t prompt for confirmation before downloading
    DownloadAsk = false;
    MagnetOpenAsk = false;

    # Trash original torrent files
    DeleteOriginalTorrent = true;

    # Hide the donate message
    WarningDonate = false;
    # Hide the legal disclaimer
    WarningLegal = false;

    # Import Torrents
    AutoImport = true;
    AutoImportDirectory = "~/Downloads";

    # Partial Files
    RenamePartialFiles = false;

    # General
    AutoSize = true;

    # Prompts
    CheckDownload = true;
    CheckQuitDownloading = true;
    CheckRemoveDownloading = true;
    CheckUpload = true;
  };
}
