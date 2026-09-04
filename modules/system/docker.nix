{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    # Set to true if you'd rather run docker rootless (more setup, more secure).
    rootless.enable = false;
  };

  environment.systemPackages = with pkgs; [
    docker-compose # gives you the standalone `docker-compose` binary
  ];

  # Note: `docker compose` (the plugin subcommand, no hyphen) usually ships
  # bundled with the docker package itself. If it's missing after your first
  # build, check `nix search nixpkgs docker-buildx` / `docker-compose` and
  # add whichever plugin package your nixpkgs revision provides.
}
