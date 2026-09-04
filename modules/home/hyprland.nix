{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      monitor = [ ",preferred,auto,1" ];

      "$mod" = "SUPER";
      "$terminal" = "ghostty";
      "$browser" = "firefox";
      "$editor" = "code";
      "$fileManager" = "thunar";
      "$pdfReader" = "zathura";
      "$menu" = "rofi -show drun";

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      exec-once = [
        "waybar"
        "dunst"
        "swww init"
        "nm-applet --indicator"
        "blueman-applet"
        "wl-paste --watch cliphist store"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
          size = 4;
          passes = 2;
        };
      };

      animations.enabled = true;

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      # --- App launch shortcuts ---
      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, B, exec, $browser"
        "$mod, C, exec, $editor"
        "$mod, E, exec, $fileManager"
        "$mod, P, exec, $pdfReader"
        "$mod, D, exec, $menu"

        # --- Window management ---
        "$mod, Q, killactive"
        "$mod SHIFT, E, exit"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"

        # --- Screenshot / lock ---
        ", Print, exec, hyprshot -m region"
        "$mod SHIFT, S, exec, hyprshot -m window"
        "$mod, L, exec, hyprlock"

        # --- Workspaces ---
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };

  programs.hyprlock.enable = true;
}
