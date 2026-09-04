{ pkgs, ... }:
{
  # This is a minimal, sane starting point. If you want a full IDE-like setup
  # (LSP, autocomplete, plugins) consider swapping this module for nixvim
  # (https://github.com/nix-community/nixvim) or pulling in LazyVim's config
  # under xdg.configFile."nvim" instead — both work well with this structure.
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set number
      set relativenumber
      set expandtab
      set shiftwidth=2
      set tabstop=2
      set ignorecase
      set smartcase
      set termguicolors
    '';
  };
}
