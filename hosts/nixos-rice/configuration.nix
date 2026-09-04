{ config, pkgs, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/audio.nix
    ../../modules/system/docker.nix
    ../../modules/system/postgres.nix
    ../../modules/system/hyprland.nix
    ../../modules/system/theme.nix
    ../../modules/system/users.nix
  ];

  networking.hostName = "nixos-rice";

  time.timeZone = "America/Fortaleza"; # adjust to your locale
  i18n.defaultLocale = "en_US.UTF-8";

  # VS Code, some drivers, etc. are unfree
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Keep the store from growing forever
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.settings.auto-optimise-store = true;

  # DO NOT change this after your first install unless you know why.
  # Set it to the NixOS release version you originally installed with.
  system.stateVersion = "24.11";
}
