{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; # classic `rofi` is X11-only; this fork works under Hyprland
    terminal = "${pkgs.ghostty}/bin/ghostty";
    theme = "catppuccin-mocha"; # rofi ships several bundled themes by name
  };
}
