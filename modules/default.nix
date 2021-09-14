{
  windowManager = { leftwm = import ./windowManager/leftwm.nix; };
  terminal = {
    wezterm = import ./terminal/wezterm.nix;
    alacritty = import ./terminal/alacritty.nix;
  };
  multiplexer = { tmux = import ./multiplexer/tmux.nix; };
  shell = {
    zsh = import ./shell/z-shell.nix;
    nushell = import ./shell/nushell.nix;
  };
  bin = {
    neovim = import ./bin/neovim.nix;
    lsp = import ./bin/lsp.nix;
    formatter = import ./bin/formatter.nix;
    linter = import ./bin/linter.nix;
    compiler = import ./bin/compiler.nix;
    essential = import ./bin/essential.nix;
  };
  misc = {
    bibata-cursor = import ./misc/bibata-cursor.nix;
    font = import ./misc/font.nix;
  };
  gui = {
    # vscode = import ./hm/vscode.nix;
    brave = import ./gui/brave.nix;
    insomnia = import ./gui/insomnia.nix;
  };
  nixos = {
    config = { minimal = import ./nixos/minimal.nix; };
    xserver = import ./nixos/xserver.nix;
  };
  service = {
    nixos = {
      lorri = import ./service/lorri.nix;
      docker = import ./service/docker.nix;
      k8s = import ./service/k8s.nix;
      postgres = import ./service/postgres.nix;
    };
  };
  # nix-darwin = { minimal = import ./nix-darwin/minimal.nix; };
}
