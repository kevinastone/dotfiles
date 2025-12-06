{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    nvim-treesitter.withAllGrammars
  ];
}
