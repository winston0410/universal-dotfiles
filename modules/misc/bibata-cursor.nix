username:
{ pkgs, ... }:

{
  home-manager.users.${username} = {
    home.packages = with pkgs; [ bibata-cursors ];

    home.sessionVariables = {
      XCURSOR_SIZE = "60";
      XCURSOR_THEME = "Bibata_Ice";
    };
    home.file = {
      ".icons/default" = {
        source = "${pkgs.bibata-cursors}/share/icons/Bibata_Ice";
      };
    };
  };

}
