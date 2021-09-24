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
  };
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
    ".gitconfig" = { source = ../../dotfiles/.gitconfig; };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  dotfiles-manager.shellAliases = shellAliases;
}
