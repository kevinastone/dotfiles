{ rootPath, ... }:
{
  home.file.".hammerspoon" = {
    source = rootPath "hammerspoon";
    recursive = true;
  };
}
