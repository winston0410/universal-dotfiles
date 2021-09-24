{ pkgs, ... }:

let
  cursorTheme = "Bibata_Ice";
  cursorSize = "64";
  cursorPackage = pkgs.bibata-cursors;
  gtkCursorTheme = ''gtk-cursor-theme-name="${cursorTheme}"'';
  gtkCursorSize = "gtk-cursor-theme-size=${cursorSize}";
  gtkCommand = ''
    ${gtkCursorTheme}
    ${gtkCursorSize}
  '';
in {
  home.packages = [ cursorPackage ];

  home.file = {
    ".icons/default" = {
      source = "${cursorPackage}/share/icons/${cursorTheme}";
    };

    ".gtkrc-2.0" = { text = gtkCommand; };
  };

  xdg.configFile = { "gtk-3.0/setting.ini" = { text = gtkCommand; }; };

  xresources.properties = {
    "Xcursor.size" = cursorSize;
    "Xcursor.theme" = cursorTheme;
  };

  # dotfiles.terminal.shell.variables = {
    # XCURSOR_SIZE = "${sizeStr}";
    # XCURSOR_THEME = "${cfg.cursor.theme}";
  # };

  # xsession.initExtra =
  # "${config.lib.custom.getExecPath pkgs.xorg.xrdb} -merge $HOME/.Xresources";
}
