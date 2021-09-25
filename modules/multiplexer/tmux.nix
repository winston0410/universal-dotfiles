{ pkgs, lib, config, ... }:

let
  shell = pkgs.zsh;
  getBinPath = pkg:
    "${pkg}${
      if (builtins.hasAttr "shellPath" pkg) then
        pkg.shellPath
      else
        "/bin/${pkg.pname}"
    }";
in {
  programs.tmux = {
    enable = true;
    extraConfig = (builtins.readFile ../../dotfiles/.tmux.conf);
    sensibleOnTop = false;
    # Not sure why getOutput doesn't work
    # shell = "${(lib.attrsets.getOutput "bin" shell)}";
    shell = getBinPath shell;
  };
}
