username:
{ pkgs, ... }:

{
  dotfiles.xserver.cursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    theme = "Bibata_Ice";
    size = 64;
  };
}
