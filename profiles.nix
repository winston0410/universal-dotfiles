{ inputs, modules, collections }: {
  user = {
    dev = (inputs.dotfiles-manager.lib.mkProfile (collections.user.devMachine
      ++ [
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
      ]));
  };

  # make the system here, so that the inputs of universal dotfiles will be used
  nixos = (inputs.dotfiles-manager.lib.mkSystem {
    inherit inputs;
    modules = [ inputs.home-manager.nixosModules.home-manager ]
      ++ collections.system.guiSystemMinimal;
    system = "x86_64-linux";
  });
}
