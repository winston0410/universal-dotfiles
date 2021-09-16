username:
{ pkgs, ... }:

{
  dotfiles.programs.direnv = {
    enable = true;
    nix-direnv = { enable = true; };
  };
}
