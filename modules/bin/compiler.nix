{ pkgs, ... }:

{
  home.packages = with pkgs;
    [
      # gcc
      nodejs-16_x
    ];
}
