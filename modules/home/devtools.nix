{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    python3
    uv
    docker-compose
    postgresql_16 # client tools (psql, pg_dump, etc.) — server itself runs at system level
  ];
}
