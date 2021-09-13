username:
{ config, lib, pkgs, ... }:

{
  dotfiles.programs.direnv = { enable = true; };
}
