username:
{ pkgs, ... }:

{
  home-manager.users.${username} = {
    home.packages = with pkgs;
      [
        # gcc
        nodejs-16_x
      ];
  };
}
