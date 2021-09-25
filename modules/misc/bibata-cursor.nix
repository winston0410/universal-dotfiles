{ pkgs, ... }:

let
  cursorTheme = "Bibata_Ice";
  cursorSize = 64;
  cursorPackage = pkgs.bibata-cursors;
  defaultCursor = "left_ptr";
in {
  xsession.pointerCursor = {
    name = cursorTheme;
    size = cursorSize;
    package = cursorPackage;
    defaultCursor = defaultCursor;
  };

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
