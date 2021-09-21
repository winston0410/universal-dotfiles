username:
{ inputs, system, pkgs, config, ... }:
let
  # TODO: Should the overlay be made here?
  overlay = final: prev: { "eww" = inputs.eww.packages.${system}.eww; };
in {
  nixpkgs.overlays = [ overlay ];
  environment.systemPackages = [ pkgs.eww ];

  # dotfiles.xserver.bar = {
  # enable = false;
  # package = pkgs.eww;
  # };
}
