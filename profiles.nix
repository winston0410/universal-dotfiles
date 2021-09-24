{ inputs, modules, collections }: {
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
    dev = (inputs.dotfiles-manager.lib.mkProfile {
      modules = { 
      };

      hmModules = {
        dotfiles-manager = inputs.dotfiles-manager.options;
        tmux = modules.multiplexer.tmux;
        wezterm = modules.terminal.wezterm;
        browser = modules.gui.brave;
        api-tester = modules.gui.insomnia;
        cursor = modules.misc.bibata-cursor;
        font = modules.misc.font;
        essential = modules.bin.essential;
        nix-direnv = modules.bin.nix-direnv;
        shell = modules.shell.zsh;
        telegram = modules.gui.telegram;
        screenshot = modules.bin.maim;
        lsp = modules.bin.lsp;
        formatter = modules.bin.formatter;
        linter = modules.bin.linter;
        neovim = modules.bin.neovim;
        keys = modules.misc.keys;
      };

      namedModules = {
        eww = modules.bar.eww;
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
