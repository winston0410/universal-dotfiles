_: { pkgs, config, ... }: {
  dotfiles.terminal.emulator = {
    enable = true;
    package = pkgs.wezterm;
    configPath = ../../dotfiles/wezterm/wezterm.lua;
  };
}
# { pkgs, config, ... }:

# {
# home-manager.users.${user} = {
# home.packages = with pkgs; [ wezterm ];

# xdg.configFile = {
# "wezterm/wezterm.lua" = {
# text =
# (builtins.replaceStrings [ "--[[nix-placeholder--]]" "${program}" ]
# (builtins.readFile ../../dotfiles/wezterm/wezterm.lua));
# };
# "wezterm/tokyonight.lua" = {
# source = ../../dotfiles/wezterm/tokyonight.lua;
# };
# };
# };
# }
