username:
{ pkgs, ... }:

{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      dhall
      checkmake
      golint
      goimports
      hadolint
      shellcheck
      python39Packages.flake8
      python39Packages.yamllint
      cpplint
      clippy
      nodePackages.eslint_d
      nodePackages.svelte-check
      ktlint
      nodePackages.jsonlint
    ];
  };
}
