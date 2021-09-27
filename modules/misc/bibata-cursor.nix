{ pkgs, config, ... }:

let
  cursorTheme = "Bibata_Ice";
  cursorSize = 64;
  cursorPackage = pkgs.bibata-cursors;
  defaultCursor = "left_ptr";
  xdg = config.xdg;
in {
  xsession.pointerCursor = {
    name = cursorTheme;
    size = cursorSize;
    package = cursorPackage;
    defaultCursor = defaultCursor;
  };

  # xresources = { path = "${xdg.configHome}/X11/.Xresources"; };

  xdg.configFile = {
    "leftwm/themes/nix-generated" = {
      text = ''
        if [ -x "$(command -v xsetroot)" ]; then
          ${pkgs.xorg.xsetroot}/bin/xsetroot -xcf ${cursorPackage}/share/icons/${cursorTheme}/cursors/${defaultCursor} ${
            builtins.toString cursorSize
          }
        fi
      '';
    };
  };
}
