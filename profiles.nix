dotfiles-manager: modules: collections: {
  nixos = {
    macbook2017 = (dotfiles-manager.lib.createProfile
      (collections.user.devMachine ++ collections.system.guiSystemMinimal ++ [
        modules.windowManager.leftwm
        # modules.bar.eww
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
}
