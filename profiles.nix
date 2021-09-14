dotfiles-manager: modules: collections: {
  nixos = {
    macbook2017 = (dotfiles-manager.lib.createProfile
      (collections.user.devMachine ++ collections.system.guiSystemMinimal ++ [
        modules.windowManager.leftwm
        modules.multiplexer.tmux
        modules.terminal.wezterm
        modules.shell.nushell
        modules.bin.neovim
        modules.misc.font
        modules.misc.bibata-cursor
      ]));
  };
}
