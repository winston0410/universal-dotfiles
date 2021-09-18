username:
{ pkgs, ... }:

{
  home-manager.users.${username} = {
    home.sessionVariables = { BROWSER = "brave"; };

    home.packages = with pkgs; [ brave ];
  };
}
