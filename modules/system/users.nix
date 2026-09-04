{ pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "wheel" "networkmanager" "docker" "video" "input" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true; # must be enabled at system level to be a valid login shell
}
