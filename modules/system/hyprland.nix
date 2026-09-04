{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Needed for screen sharing, file pickers, etc. to work correctly under Wayland.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # greetd + tuigreet is a common lightweight login manager pairing for Hyprland.
  # Swap for SDDM if you want something more graphical.
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };

  security.polkit.enable = true;
  environment.systemPackages = [ pkgs.polkit_gnome ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-emoji
  ];
  # Note: nixpkgs restructured nerd-fonts package names a while back
  # (pkgs.nerd-fonts.<name> instead of pkgs.nerdfonts.override {...}).
  # If this errors on your nixpkgs revision, `nix search nixpkgs nerd-fonts`
  # to find the current name.
}
