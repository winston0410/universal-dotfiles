{ pkgs, config, ... }: let 
  xdg = config.xdg;
  historySize = 1000000;
  historyShare = false;
  # The value of $HISTFILE
  historyPath = "${xdg.dataHome}/histfile";
in{
  programs.zsh = {
    enable = true;
    initExtra = (builtins.readFile ../../dotfiles/.zshrc);
    history = {
      path = historyPath;
      save = historySize;
      size = historySize;
      share = historyShare;
    };
  };

  # Bash is enabled by the system anyway
  programs.bash = {
    enable = true;
    historyFile = historyPath;
    historyFileSize = historySize;
    historySize = historySize;
  };
}
