{ pkgs, config, ... }:

let
  shellAliases = {
    sudo = "sudo ";
    sudoedit = "sudo -E -s $EDITOR";
    sudoe = "sudo -E -s $EDITOR";
    tree = "tre";
    ls = "lsd -a ";
    rm = "rip";
    grep = "rg";
    top = "btm";
    ps = "procs";
    cp = "xcp -r ";
    cat = "bat";
  };

  xdg = config.xdg;
in {

  home.packages = with pkgs; [
    bandwhich
    git
    bat
    fzf
    fd
    ripgrep
    rm-improved
    tre-command
    dua
    procs
    xcp
    bottom
    lsd
  ];

  home.file = {
    "fzf-color.sh" = { source = ../../dotfiles/fzf-color.sh; };
  };

  xdg.configFile = {
    "bottom/bottom.toml" = { source = ../../dotfiles/bottom/bottom.toml; };
    "lsd/config.yaml" = { source = ../../dotfiles/lsd/config.yaml; };
    "procs/config.toml" = { source = ../../dotfiles/procs/config.toml; };
    "bat/config" = { source = ../../dotfiles/bat/config; };
    "ripgrep/config" = { source = ../../dotfiles/ripgrep/config; };
    "git/" = { source = ../../dotfiles/git; };
  };

  home.sessionVariables = {
    RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/config";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  dotfiles-manager.shellAliases = shellAliases;
}
