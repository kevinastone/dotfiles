_: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    # plugins = with pkgs.vimPlugins; [
    #   {
    #     plugin = catppuccin-nvim;
    #     config = ''
    #       colorscheme catppuccin-mocha
    #     '';
    #   }
    # ];
  };
}
