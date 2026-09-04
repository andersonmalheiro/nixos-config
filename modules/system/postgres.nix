{ pkgs, lib, ... }:
{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    enableTCPIP = true;

    # "trust" auth for local connections is convenient for a single-user
    # dev machine (no password prompts for psql/local tools) but is NOT
    # appropriate if other people can reach this machine on the network.
    # Tighten this (e.g. to "scram-sha-256") if that's a concern for you.
    authentication = lib.mkOverride 10 ''
      local all all trust
      host  all all 127.0.0.1/32 trust
      host  all all ::1/128     trust
    '';
  };

  # Opens 5432 only on the loopback interface implicitly via enableTCPIP +
  # the auth rules above; firewall.nix does not open 5432 externally.
}
