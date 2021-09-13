username: { config, lib, pkgs, ... }:

{
  services.postgresql = { enable = true; };
}
