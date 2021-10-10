{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ aws ];
}
