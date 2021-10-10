{ pkgs, config, ... }:

{
  programs.gh = {
    enable = true;
    # settings = (builtins.readFile ../../dotfiles/gh/config.yml);
    settings = {
        git_protocol = "ssh";
        editor = "nvim";
    };
  };
}
