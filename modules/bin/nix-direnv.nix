username:
{ pkgs, ... }:

{
  dotfiles.programs.direnv = { enable = true; package = pkgs.nix-direnv; };
}
