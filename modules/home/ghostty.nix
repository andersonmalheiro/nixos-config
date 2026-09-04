{ pkgs, ... }:
{
  # Ghostty is packaged in nixpkgs-unstable. If it's missing on your channel,
  # you can pull it from its own flake (github:ghostty-org/ghostty) instead —
  # add it as a flake input and swap this package reference.
  home.packages = [ pkgs.ghostty ];

  xdg.configFile."ghostty/config".text = ''
    font-family = JetBrainsMono Nerd Font
    font-size = 11
    background-opacity = 0.92
    confirm-close-surface = false
    window-decoration = false
  '';
}
