{ config, lib, pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/gpg.nix
  programs.gpg = {
    enable = true;
    # convert file into set from string?
    settings = { };
  };
}
