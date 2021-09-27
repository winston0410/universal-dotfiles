{
  windowManager = { leftwm = import ./windowManager/leftwm.nix; };
  bar = { eww = import ./bar/eww.nix; };
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
    direnv = import ./bin/direnv.nix;
    nix-direnv = import ./bin/nix-direnv.nix;
    menyoki = import ./bin/menyoki.nix;
    maim = import ./bin/maim.nix;
    ssh = import ./bin/ssh.nix;
    gpg = import ./bin/gpg.nix;
    npm = import ./bin/npm.nix;
    cargo = import ./bin/cargo.nix;
    pip = import ./bin/pip.nix;
    go = import ./bin/go.nix;
    mix = import ./bin/mix.nix;
    deno = import ./bin/deno.nix;
    gradle = import ./bin/gradle.nix;
    stack = import ./bin/stack.nix;
    elm = import ./bin/elm.nix;
    gem = import ./bin/gem.nix;
    racket = import ./bin/racket.nix;
    aws = import ./bin/aws.nix;
  };
  misc = {
    bibata-cursor = import ./misc/bibata-cursor.nix;
    font = import ./misc/font.nix;
    keys = import ./misc/keys.nix;
    xdg = import ./misc/xdg.nix;
    lang = import ./misc/lang.nix;
    dircolors = import ./misc/dircolors.nix;
    version = import ./misc/version.nix;
  };
  gui = {
    vscode = import ./gui/vscode.nix;
    telegram = import ./gui/telegram.nix;
    brave = import ./gui/brave.nix;
    insomnia = import ./gui/insomnia.nix;
    discord = import ./gui/discord.nix;
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
      mysql = import ./service/mysql.nix;
      hydra = import ./service/hydra.nix;
    };
  };
  # nix-darwin = { minimal = import ./nix-darwin/minimal.nix; };
}
