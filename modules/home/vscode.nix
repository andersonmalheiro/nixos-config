{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    # Extensions can be declared here too, e.g.:
    # profiles.default.extensions = with pkgs.vscode-extensions; [
    #   ms-python.python
    #   esbenp.prettier-vscode
    # ];
    # Check `nix search nixpkgs vscode-extensions` for what's packaged;
    # anything missing you can still install normally from the Marketplace.
  };
}
