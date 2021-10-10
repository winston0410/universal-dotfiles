{ inputs, modules }: {
  user = {
    hugosum = {
      name = "hugosum";
      isNormalUser = true;
      home = "/home/hugosum";
      extraGroups =
        [ "wheel" "networkmanager" "docker" "input" "video" "audio" "sound" ];
      hashedPassword =
        "$6$pHSJA2UTMz$Z5IS7T6E67bshhmPfcAQRRKgbEuOelR23SiB5Os0YqUqX.oDl5P/nhnKbSAYmiU1mHn01tJ90HD11dYQpg1iN0";
    };
  };

  home = {
    dev = let 
      system = "x86_64-linux";
    in (inputs.dotfiles-manager.lib.mkProfile {
      modules = {
        ibus = modules.service.nixos.ibus;
        openssh = modules.service.nixos.openssh;
      };

      specialArgs = { inherit inputs system; };

      hmModules = {
        dotfiles-manager = inputs.dotfiles-manager.options;
        xdg = inputs.xdg.lib.hm;
        version = modules.misc.version;
        lang = modules.misc.lang;
        compiler = modules.bin.compiler;
        tmux = modules.multiplexer.tmux;
        wezterm = modules.terminal.wezterm;
        browser = modules.gui.brave;
        api-tester = modules.gui.insomnia;
        cursor = modules.misc.bibata-cursor;
        font = modules.misc.font;
        essential = modules.bin.essential;
        shell = modules.shell.zsh;
        telegram = modules.gui.telegram;
        screenshot = modules.bin.maim;
        lsp = modules.bin.lsp;
        formatter = modules.bin.formatter;
        linter = modules.bin.linter;
        neovim = modules.bin.neovim;
        himalaya = modules.bin.himalaya;
        keys = modules.misc.keys;
        ssh = modules.bin.ssh;
        gpg = modules.bin.gpg;
        npm = modules.bin.npm;
        pip = modules.bin.pip;
        cargo = modules.bin.cargo;
        dircolors = modules.misc.dircolors;
      };

      namedModules = {
        # pg = modules.service.nixos.postgres;
        # mysql = modules.service.nixos.mysql;
        eww = modules.bar.eww;
        nix-direnv = modules.bin.nix-direnv;
        xserver = modules.nixos.xserver;
        window-manager = modules.windowManager.leftwm;
      };
    });
  };

  # make the system here, so that the inputs of universal dotfiles will be used
  system = {
    nixos = (inputs.dotfiles-manager.lib.mkSystem {
      inherit inputs;
      modules = { config = modules.nixos.config.minimal; };
      system = "x86_64-linux";
    });
  };
}
