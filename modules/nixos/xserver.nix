username:
{ config, lib, pkgs, ... }:

let
  keybindings = pkgs.writeText "xkb-layout" ''
    !Map Caps_Lock to Alt
    remove lock = Caps_Lock
    keysym Caps_Lock = Alt_L
    add Mod1 = Alt_L
    !Map Super to Control
    remove Mod4 = Super_L
    keysym Super_L = Control_L
    add Control = Control_L
  '';

  initialLight = "sudo light -S 5";

  xdg = config.home-manager.users.${username}.xdg;
in {
  environment.systemPackages = with pkgs; [ xdotool xorg.xmodmap xclip ];

  environment.sessionVariables = {
    ERRFILE = "${xdg.cacheHome}/X11/xsession-errors";
  };

  services.xserver = {
    enable = true;
    layout = "us";
    dpi = 200;
    autoRepeatInterval = 30;
    autoRepeatDelay = 200;
    autorun = true;
    libinput = {
      enable = true;
      mouse = {
        naturalScrolling = true;
        clickMethod = "clickfinger";
        accelSpeed = "1000";
      };
      touchpad = {
        naturalScrolling = true;
        tapping = false;
        clickMethod = "clickfinger";
        accelSpeed = "1000";
      };
    };

    displayManager = {
      lightdm = {
        enable = true;
        greeter = { enable = false; };
        autoLogin.timeout = 0;
        extraConfig = ''
          user-authority-in-system-dir=true
        '';
      };
      autoLogin = {
        enable = true;
        user = username;
      };
      sessionCommands = ''
        ${initialLight}
        ${pkgs.xorg.xmodmap}/bin/xmodmap ${keybindings}
      '';
    };
  };
}
