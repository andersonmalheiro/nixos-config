{ pkgs, ... }:
{
  networking.networkmanager.enable = true;

  # nm-applet gives you a tray icon + GUI for wifi/network config.
  # nm-connection-editor is the fuller settings window (right-click the tray icon).
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  networking.firewall.enable = true;
}
