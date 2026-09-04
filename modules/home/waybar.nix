{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "bluetooth" "battery" "tray" ];

        "hyprland/workspaces".format = "{icon}";

        clock.format = "{:%a %d %b  %H:%M}";

        network = {
          format-wifi = "  {essid}";
          format-ethernet = "  Connected";
          format-disconnected = "  Offline";
        };

        bluetooth = {
          format = "";
          format-connected = " {device_alias}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-icons.default = [ "" "" "" ];
        };

        battery = {
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        tray.spacing = 8;
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
      }
      window#waybar {
        background: rgba(30, 30, 46, 0.85);
        color: #cdd6f4;
      }
      #workspaces button.active {
        background: #89b4fa;
        color: #1e1e2e;
      }
      #clock, #network, #bluetooth, #pulseaudio, #battery, #tray {
        padding: 0 10px;
      }
    '';
  };
}
