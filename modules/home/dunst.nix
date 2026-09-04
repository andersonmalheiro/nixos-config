{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "top-right";
        transparency = 10;
        frame_color = "#89b4fa";
        font = "JetBrainsMono Nerd Font 10";
        corner_radius = 8;
      };
      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 5;
      };
      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#f38ba8";
        timeout = 0;
      };
    };
  };
}
