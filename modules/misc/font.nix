{ pkgs, ... }:

{
  home.packages = with pkgs; [ nerdfonts noto-fonts-cjk ];
}
