{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # blueman gives you both a tray applet (blueman-applet) and a full
  # settings window (blueman-manager), similar role to nm-applet above.
  services.blueman.enable = true;
}
