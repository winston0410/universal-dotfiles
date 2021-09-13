_: { pkgs, config, ... }: {
  dotfiles.terminal.multiplexer = {
    enable = true;
    package = pkgs.tmux;
    configPath = ../../dotfiles/.tmux.conf;
  };
}

# shell: username:
# { pkgs, config, ... }:

# let shellName = (builtins.parseDrvName shell).name;
# in {
  # home-manager.users.${username} = {
    # home.packages = with pkgs; [ tmux ];

    # home.file = {
      # ".tmux.conf" = {
        # text = (builtins.readFile ../../dotfiles/.tmux.conf) + ''
          # set -g default-shell ${shell}/bin/${shellName}  
        # '';
      # };
    # };
  # };
# }
