{ pkgs, ... }:
{
  # Stylix themes the whole system (GTK, console, login screen where supported,
  # and — via the shared home-manager module wired up in flake.nix — apps like
  # Waybar and Ghostty too) from one color scheme + wallpaper.
  stylix.enable = true;

  # Drop your own wallpaper at modules/home/assets/wallpaper.jpg, or point
  # this at any image path you like.
  stylix.image = ../home/assets/wallpaper.jpg;

  stylix.polarity = "dark";

  # Catppuccin Mocha as a sane default — browse other schemes with:
  #   nix eval nixpkgs#base16-schemes --apply builtins.attrNames
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
    sizes.terminal = 11;
  };
}
