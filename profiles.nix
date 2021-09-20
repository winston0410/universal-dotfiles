{ inputs, modules, collections }: {
  nixos = {
    macbook2017 = (inputs.dotfiles-manager.lib.mkSystem {
      system = "x86_64-linux";
      username = "hugosum";
      modules = [
        (inputs.dotfiles-manager.lib.mkProfile (collections.user.devMachine
          ++ collections.system.guiSystemMinimal ++ [
            modules.windowManager.leftwm
            modules.service.nixos.hydra
            modules.bin.maim
            modules.multiplexer.tmux
            modules.terminal.wezterm
            modules.shell.zsh
            modules.bin.neovim
            modules.bin.nix-direnv
            modules.gui.telegram
            modules.misc.font
            modules.misc.bibata-cursor
          ]) username)
      ];
      inherit inputs;
    });
  };
}
