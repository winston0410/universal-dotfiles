{ pkgs, config, ... }:

{
  home.packages = with pkgs;
    [ (nixos-generators.override { nix = pkgs.nixUnstable; }) ];
}
