{ pkgs, config, ... }:

{
    xdg.configFile = {
      "menyoki/menyoki.conf" = { source = ../../dotfiles/menyoki/menyoki.conf; };
    };

    home.packages = with pkgs; [ menyoki ];
}
