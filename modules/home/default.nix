{ pkgs, username, ... }:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./rofi.nix
    ./dunst.nix
    ./ghostty.nix
    ./git.nix
    ./nvim.nix
    ./vscode.nix
    ./shell.nix
    ./devtools.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  # Match this to system.stateVersion; do not change once set.
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    firefox
    thunar
    thunar-archive-plugin
    zathura       # PDF reader
    grim slurp    # screenshot backend (hyprshot uses these)
    hyprshot      # keybindable screenshot tool
    wl-clipboard
    cliphist      # clipboard history
    swww          # wallpaper daemon (animated transitions)
    playerctl     # media key control
    pavucontrol   # GUI volume mixer, handy alongside pipewire
  ];

  programs.home-manager.enable = true;
}
