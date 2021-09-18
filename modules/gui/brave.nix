username:
{ pkgs, ... }:

{
  home-manager.users.${username} = {
    home.sessionVariables = { BROWSER = "brave"; };

    home.packages = with pkgs; [ brave ];

    xdg.configFile = { "gtk-3.0/setting.ini" = { text = ''
    [Settings]
    gtk-key-theme-name = Emacs
    ''; }; };
  };
}
