username:
{ pkgs, ... }:

{
  home-manager.users.${username} = {
    home.packages = with pkgs; [ nerdfonts noto-fonts-cjk ];
  };
}
